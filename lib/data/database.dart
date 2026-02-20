// import 'dart:io';
import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;
// import 'package:drift/native.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

part 'database.g.dart';

// 1. Table Definitions based on your schema
class Books extends Table {
  IntColumn get nr => integer()();
  TextColumn get name => text()();
}

class Content extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get book_name => text()();
  IntColumn get chapter_nr => integer()();
  IntColumn get verse_nr => integer()();
  IntColumn get word_nr => integer()();
  TextColumn get word => text()();
  TextColumn get concordance => text()();
  TextColumn get functional => text()();
  TextColumn get strongs => text()();
  TextColumn get lemma => text()();
}

class Strongs extends Table {
  IntColumn get id => integer().autoIncrement()(); // Stores "H1", "H1961", etc.
  IntColumn get nr => integer()(); // Stores "H1", "H1961", etc.
  TextColumn get tag => text()();
}

@DriftDatabase(tables: [Books, Content, Strongs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  // ADD THIS BLOCK
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        // INTENTIONALLY EMPTY
        // Since the database is pre-populated, we don't need Drift to create tables.
        // If we let it run, it might crash trying to create tables that already exist.
      },
      beforeOpen: (details) async {
        // Good practice to enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  // Query to get words for a specific verse
  Future<List<ContentData>> getVerse(String bookName, int chapter, int verse) {
    return (select(content)
          ..where((t) => t.book_name.equals(bookName))
          ..where((t) => t.chapter_nr.equals(chapter))
          ..where((t) => t.verse_nr.equals(verse))
          ..orderBy([(t) => OrderingTerm(expression: t.word_nr)]))
        .get();
  }

  Future<void> debugCheckColumns() async {
    // This query returns the table structure from SQLite's internal master table
    // final result = await customSelect("PRAGMA table_info(strongs);").get();
    
    // print("--- 🔍 SQLITE 'strongs' TABLE STRUCTURE ---");
    // for (final row in result) {
    //   print("Column: ${row.read<String>('name')} | Type: ${row.read<String>('type')}");
    // }
    // print("------------------------------------------");
  }

  // Query to get Strongs definition
  Future<Strong?> getStrongsDefinition(String strongsNumber) async {
    // debugCheckColumns(); // Call the debug function to check columns before querying

    final lookupId = int.tryParse(strongsNumber.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    // Run a raw count check to see if the ID even exists
    // final countCheck = await customSelect(
    //   'SELECT COUNT(*) as c FROM strongs WHERE nr = ?', 
    //   variables: [Variable.withInt(lookupId)]
    // ).getSingle();
    
    // print("📢 DEBUG: Rows found in DB for nr $lookupId: ${countCheck.read<int>('c')}");
    
    return (select(strongs)..where((t) => t.nr.equals(lookupId))).getSingleOrNull();
  }

  //Multiple Strongs Def
  // Inside AppDatabase class
  Future<List<Strong>> getMultipleStrongsDefinitions(String strongsString) async {
    // 1. Split by '&' and clean each part to get the numbers
    // Example: "G2424&G3056" -> [2424, 3056]
    final List<int> nrs = strongsString.split('&').map((s) {
      return int.tryParse(s.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    }).where((nr) => nr != 0).toList();

    if (nrs.isEmpty) return [];

    // 2. Query for all rows where 'nr' is in our list
    return (select(strongs)..where((t) => t.nr.isIn(nrs))).get();
  }

  // Inside AppDatabase class

  // 1. Get All Books (Already likely exists, but ensuring it matches)
  Future<List<String>> getAllBooks() async {
    final result = await customSelect(
      'SELECT DISTINCT name FROM books ORDER BY nr ASC',
      readsFrom: {books},
    ).get();
    return result.map((row) => row.read<String>('name')).toList();
  }

  // 2. Get Distinct Chapters for a Book
  Future<List<int>> getChaptersForBook(String bookName) async {
    // Logic: Select distinct chapter from content where book = bookName
    final query = selectOnly(content, distinct: true)
      ..addColumns([content.chapter_nr])
      ..where(content.book_name.equals(bookName))
      ..orderBy([OrderingTerm(expression: content.chapter_nr, mode: OrderingMode.asc)]);

    final result = await query.get();
    
    // Convert rows to List<int>
    return result.map((row) => row.read(content.chapter_nr)!).toList();
  }

  // 3. Get Distinct Verses for a Book + Chapter
  Future<List<int>> getVersesForChapter(String bookName, int chapterNum) async {
    // Logic: Select distinct verse from content where book = bookName AND chapter = chapterNum
    final query = selectOnly(content, distinct: true)
      ..addColumns([content.verse_nr])
      ..where(content.book_name.equals(bookName) & content.chapter_nr.equals(chapterNum))
      ..orderBy([OrderingTerm(expression: content.verse_nr, mode: OrderingMode.asc)]);

    final result = await query.get();
    
    return result.map((row) => row.read(content.verse_nr)!).toList();
  }

}