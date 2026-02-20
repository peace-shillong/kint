// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nrMeta = const VerificationMeta('nr');
  @override
  late final GeneratedColumn<int> nr = GeneratedColumn<int>(
    'nr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [nr, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<Book> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nr')) {
      context.handle(_nrMeta, nr.isAcceptableOrUnknown(data['nr']!, _nrMeta));
    } else if (isInserting) {
      context.missing(_nrMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      nr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nr'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int nr;
  final String name;
  const Book({required this.nr, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nr'] = Variable<int>(nr);
    map['name'] = Variable<String>(name);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(nr: Value(nr), name: Value(name));
  }

  factory Book.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      nr: serializer.fromJson<int>(json['nr']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nr': serializer.toJson<int>(nr),
      'name': serializer.toJson<String>(name),
    };
  }

  Book copyWith({int? nr, String? name}) =>
      Book(nr: nr ?? this.nr, name: name ?? this.name);
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      nr: data.nr.present ? data.nr.value : this.nr,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('nr: $nr, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nr, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book && other.nr == this.nr && other.name == this.name);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> nr;
  final Value<String> name;
  final Value<int> rowid;
  const BooksCompanion({
    this.nr = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required int nr,
    required String name,
    this.rowid = const Value.absent(),
  }) : nr = Value(nr),
       name = Value(name);
  static Insertable<Book> custom({
    Expression<int>? nr,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nr != null) 'nr': nr,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith({
    Value<int>? nr,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return BooksCompanion(
      nr: nr ?? this.nr,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nr.present) {
      map['nr'] = Variable<int>(nr.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('nr: $nr, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContentTable extends Content with TableInfo<$ContentTable, ContentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _book_nameMeta = const VerificationMeta(
    'book_name',
  );
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
    'book_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapter_nrMeta = const VerificationMeta(
    'chapter_nr',
  );
  @override
  late final GeneratedColumn<int> chapter_nr = GeneratedColumn<int>(
    'chapter_nr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verse_nrMeta = const VerificationMeta(
    'verse_nr',
  );
  @override
  late final GeneratedColumn<int> verse_nr = GeneratedColumn<int>(
    'verse_nr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _word_nrMeta = const VerificationMeta(
    'word_nr',
  );
  @override
  late final GeneratedColumn<int> word_nr = GeneratedColumn<int>(
    'word_nr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _concordanceMeta = const VerificationMeta(
    'concordance',
  );
  @override
  late final GeneratedColumn<String> concordance = GeneratedColumn<String>(
    'concordance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _functionalMeta = const VerificationMeta(
    'functional',
  );
  @override
  late final GeneratedColumn<String> functional = GeneratedColumn<String>(
    'functional',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strongsMeta = const VerificationMeta(
    'strongs',
  );
  @override
  late final GeneratedColumn<String> strongs = GeneratedColumn<String>(
    'strongs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lemmaMeta = const VerificationMeta('lemma');
  @override
  late final GeneratedColumn<String> lemma = GeneratedColumn<String>(
    'lemma',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    book_name,
    chapter_nr,
    verse_nr,
    word_nr,
    word,
    concordance,
    functional,
    strongs,
    lemma,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_name')) {
      context.handle(
        _book_nameMeta,
        book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    if (data.containsKey('chapter_nr')) {
      context.handle(
        _chapter_nrMeta,
        chapter_nr.isAcceptableOrUnknown(data['chapter_nr']!, _chapter_nrMeta),
      );
    } else if (isInserting) {
      context.missing(_chapter_nrMeta);
    }
    if (data.containsKey('verse_nr')) {
      context.handle(
        _verse_nrMeta,
        verse_nr.isAcceptableOrUnknown(data['verse_nr']!, _verse_nrMeta),
      );
    } else if (isInserting) {
      context.missing(_verse_nrMeta);
    }
    if (data.containsKey('word_nr')) {
      context.handle(
        _word_nrMeta,
        word_nr.isAcceptableOrUnknown(data['word_nr']!, _word_nrMeta),
      );
    } else if (isInserting) {
      context.missing(_word_nrMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('concordance')) {
      context.handle(
        _concordanceMeta,
        concordance.isAcceptableOrUnknown(
          data['concordance']!,
          _concordanceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_concordanceMeta);
    }
    if (data.containsKey('functional')) {
      context.handle(
        _functionalMeta,
        functional.isAcceptableOrUnknown(data['functional']!, _functionalMeta),
      );
    } else if (isInserting) {
      context.missing(_functionalMeta);
    }
    if (data.containsKey('strongs')) {
      context.handle(
        _strongsMeta,
        strongs.isAcceptableOrUnknown(data['strongs']!, _strongsMeta),
      );
    } else if (isInserting) {
      context.missing(_strongsMeta);
    }
    if (data.containsKey('lemma')) {
      context.handle(
        _lemmaMeta,
        lemma.isAcceptableOrUnknown(data['lemma']!, _lemmaMeta),
      );
    } else if (isInserting) {
      context.missing(_lemmaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      book_name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_name'],
      )!,
      chapter_nr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_nr'],
      )!,
      verse_nr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_nr'],
      )!,
      word_nr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word_nr'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      concordance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concordance'],
      )!,
      functional: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}functional'],
      )!,
      strongs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strongs'],
      )!,
      lemma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lemma'],
      )!,
    );
  }

  @override
  $ContentTable createAlias(String alias) {
    return $ContentTable(attachedDatabase, alias);
  }
}

class ContentData extends DataClass implements Insertable<ContentData> {
  final int id;
  final String book_name;
  final int chapter_nr;
  final int verse_nr;
  final int word_nr;
  final String word;
  final String concordance;
  final String functional;
  final String strongs;
  final String lemma;
  const ContentData({
    required this.id,
    required this.book_name,
    required this.chapter_nr,
    required this.verse_nr,
    required this.word_nr,
    required this.word,
    required this.concordance,
    required this.functional,
    required this.strongs,
    required this.lemma,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_name'] = Variable<String>(book_name);
    map['chapter_nr'] = Variable<int>(chapter_nr);
    map['verse_nr'] = Variable<int>(verse_nr);
    map['word_nr'] = Variable<int>(word_nr);
    map['word'] = Variable<String>(word);
    map['concordance'] = Variable<String>(concordance);
    map['functional'] = Variable<String>(functional);
    map['strongs'] = Variable<String>(strongs);
    map['lemma'] = Variable<String>(lemma);
    return map;
  }

  ContentCompanion toCompanion(bool nullToAbsent) {
    return ContentCompanion(
      id: Value(id),
      book_name: Value(book_name),
      chapter_nr: Value(chapter_nr),
      verse_nr: Value(verse_nr),
      word_nr: Value(word_nr),
      word: Value(word),
      concordance: Value(concordance),
      functional: Value(functional),
      strongs: Value(strongs),
      lemma: Value(lemma),
    );
  }

  factory ContentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentData(
      id: serializer.fromJson<int>(json['id']),
      book_name: serializer.fromJson<String>(json['book_name']),
      chapter_nr: serializer.fromJson<int>(json['chapter_nr']),
      verse_nr: serializer.fromJson<int>(json['verse_nr']),
      word_nr: serializer.fromJson<int>(json['word_nr']),
      word: serializer.fromJson<String>(json['word']),
      concordance: serializer.fromJson<String>(json['concordance']),
      functional: serializer.fromJson<String>(json['functional']),
      strongs: serializer.fromJson<String>(json['strongs']),
      lemma: serializer.fromJson<String>(json['lemma']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book_name': serializer.toJson<String>(book_name),
      'chapter_nr': serializer.toJson<int>(chapter_nr),
      'verse_nr': serializer.toJson<int>(verse_nr),
      'word_nr': serializer.toJson<int>(word_nr),
      'word': serializer.toJson<String>(word),
      'concordance': serializer.toJson<String>(concordance),
      'functional': serializer.toJson<String>(functional),
      'strongs': serializer.toJson<String>(strongs),
      'lemma': serializer.toJson<String>(lemma),
    };
  }

  ContentData copyWith({
    int? id,
    String? book_name,
    int? chapter_nr,
    int? verse_nr,
    int? word_nr,
    String? word,
    String? concordance,
    String? functional,
    String? strongs,
    String? lemma,
  }) => ContentData(
    id: id ?? this.id,
    book_name: book_name ?? this.book_name,
    chapter_nr: chapter_nr ?? this.chapter_nr,
    verse_nr: verse_nr ?? this.verse_nr,
    word_nr: word_nr ?? this.word_nr,
    word: word ?? this.word,
    concordance: concordance ?? this.concordance,
    functional: functional ?? this.functional,
    strongs: strongs ?? this.strongs,
    lemma: lemma ?? this.lemma,
  );
  ContentData copyWithCompanion(ContentCompanion data) {
    return ContentData(
      id: data.id.present ? data.id.value : this.id,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
      chapter_nr: data.chapter_nr.present
          ? data.chapter_nr.value
          : this.chapter_nr,
      verse_nr: data.verse_nr.present ? data.verse_nr.value : this.verse_nr,
      word_nr: data.word_nr.present ? data.word_nr.value : this.word_nr,
      word: data.word.present ? data.word.value : this.word,
      concordance: data.concordance.present
          ? data.concordance.value
          : this.concordance,
      functional: data.functional.present
          ? data.functional.value
          : this.functional,
      strongs: data.strongs.present ? data.strongs.value : this.strongs,
      lemma: data.lemma.present ? data.lemma.value : this.lemma,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentData(')
          ..write('id: $id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_nr: $chapter_nr, ')
          ..write('verse_nr: $verse_nr, ')
          ..write('word_nr: $word_nr, ')
          ..write('word: $word, ')
          ..write('concordance: $concordance, ')
          ..write('functional: $functional, ')
          ..write('strongs: $strongs, ')
          ..write('lemma: $lemma')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    book_name,
    chapter_nr,
    verse_nr,
    word_nr,
    word,
    concordance,
    functional,
    strongs,
    lemma,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentData &&
          other.id == this.id &&
          other.book_name == this.book_name &&
          other.chapter_nr == this.chapter_nr &&
          other.verse_nr == this.verse_nr &&
          other.word_nr == this.word_nr &&
          other.word == this.word &&
          other.concordance == this.concordance &&
          other.functional == this.functional &&
          other.strongs == this.strongs &&
          other.lemma == this.lemma);
}

class ContentCompanion extends UpdateCompanion<ContentData> {
  final Value<int> id;
  final Value<String> book_name;
  final Value<int> chapter_nr;
  final Value<int> verse_nr;
  final Value<int> word_nr;
  final Value<String> word;
  final Value<String> concordance;
  final Value<String> functional;
  final Value<String> strongs;
  final Value<String> lemma;
  const ContentCompanion({
    this.id = const Value.absent(),
    this.book_name = const Value.absent(),
    this.chapter_nr = const Value.absent(),
    this.verse_nr = const Value.absent(),
    this.word_nr = const Value.absent(),
    this.word = const Value.absent(),
    this.concordance = const Value.absent(),
    this.functional = const Value.absent(),
    this.strongs = const Value.absent(),
    this.lemma = const Value.absent(),
  });
  ContentCompanion.insert({
    this.id = const Value.absent(),
    required String book_name,
    required int chapter_nr,
    required int verse_nr,
    required int word_nr,
    required String word,
    required String concordance,
    required String functional,
    required String strongs,
    required String lemma,
  }) : book_name = Value(book_name),
       chapter_nr = Value(chapter_nr),
       verse_nr = Value(verse_nr),
       word_nr = Value(word_nr),
       word = Value(word),
       concordance = Value(concordance),
       functional = Value(functional),
       strongs = Value(strongs),
       lemma = Value(lemma);
  static Insertable<ContentData> custom({
    Expression<int>? id,
    Expression<String>? book_name,
    Expression<int>? chapter_nr,
    Expression<int>? verse_nr,
    Expression<int>? word_nr,
    Expression<String>? word,
    Expression<String>? concordance,
    Expression<String>? functional,
    Expression<String>? strongs,
    Expression<String>? lemma,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book_name != null) 'book_name': book_name,
      if (chapter_nr != null) 'chapter_nr': chapter_nr,
      if (verse_nr != null) 'verse_nr': verse_nr,
      if (word_nr != null) 'word_nr': word_nr,
      if (word != null) 'word': word,
      if (concordance != null) 'concordance': concordance,
      if (functional != null) 'functional': functional,
      if (strongs != null) 'strongs': strongs,
      if (lemma != null) 'lemma': lemma,
    });
  }

  ContentCompanion copyWith({
    Value<int>? id,
    Value<String>? book_name,
    Value<int>? chapter_nr,
    Value<int>? verse_nr,
    Value<int>? word_nr,
    Value<String>? word,
    Value<String>? concordance,
    Value<String>? functional,
    Value<String>? strongs,
    Value<String>? lemma,
  }) {
    return ContentCompanion(
      id: id ?? this.id,
      book_name: book_name ?? this.book_name,
      chapter_nr: chapter_nr ?? this.chapter_nr,
      verse_nr: verse_nr ?? this.verse_nr,
      word_nr: word_nr ?? this.word_nr,
      word: word ?? this.word,
      concordance: concordance ?? this.concordance,
      functional: functional ?? this.functional,
      strongs: strongs ?? this.strongs,
      lemma: lemma ?? this.lemma,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    if (chapter_nr.present) {
      map['chapter_nr'] = Variable<int>(chapter_nr.value);
    }
    if (verse_nr.present) {
      map['verse_nr'] = Variable<int>(verse_nr.value);
    }
    if (word_nr.present) {
      map['word_nr'] = Variable<int>(word_nr.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (concordance.present) {
      map['concordance'] = Variable<String>(concordance.value);
    }
    if (functional.present) {
      map['functional'] = Variable<String>(functional.value);
    }
    if (strongs.present) {
      map['strongs'] = Variable<String>(strongs.value);
    }
    if (lemma.present) {
      map['lemma'] = Variable<String>(lemma.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentCompanion(')
          ..write('id: $id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_nr: $chapter_nr, ')
          ..write('verse_nr: $verse_nr, ')
          ..write('word_nr: $word_nr, ')
          ..write('word: $word, ')
          ..write('concordance: $concordance, ')
          ..write('functional: $functional, ')
          ..write('strongs: $strongs, ')
          ..write('lemma: $lemma')
          ..write(')'))
        .toString();
  }
}

class $StrongsTable extends Strongs with TableInfo<$StrongsTable, Strong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nrMeta = const VerificationMeta('nr');
  @override
  late final GeneratedColumn<int> nr = GeneratedColumn<int>(
    'nr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nr, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strongs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Strong> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nr')) {
      context.handle(_nrMeta, nr.isAcceptableOrUnknown(data['nr']!, _nrMeta));
    } else if (isInserting) {
      context.missing(_nrMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Strong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Strong(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nr'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  $StrongsTable createAlias(String alias) {
    return $StrongsTable(attachedDatabase, alias);
  }
}

class Strong extends DataClass implements Insertable<Strong> {
  final int id;
  final int nr;
  final String tag;
  const Strong({required this.id, required this.nr, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nr'] = Variable<int>(nr);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  StrongsCompanion toCompanion(bool nullToAbsent) {
    return StrongsCompanion(id: Value(id), nr: Value(nr), tag: Value(tag));
  }

  factory Strong.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Strong(
      id: serializer.fromJson<int>(json['id']),
      nr: serializer.fromJson<int>(json['nr']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nr': serializer.toJson<int>(nr),
      'tag': serializer.toJson<String>(tag),
    };
  }

  Strong copyWith({int? id, int? nr, String? tag}) =>
      Strong(id: id ?? this.id, nr: nr ?? this.nr, tag: tag ?? this.tag);
  Strong copyWithCompanion(StrongsCompanion data) {
    return Strong(
      id: data.id.present ? data.id.value : this.id,
      nr: data.nr.present ? data.nr.value : this.nr,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Strong(')
          ..write('id: $id, ')
          ..write('nr: $nr, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nr, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Strong &&
          other.id == this.id &&
          other.nr == this.nr &&
          other.tag == this.tag);
}

class StrongsCompanion extends UpdateCompanion<Strong> {
  final Value<int> id;
  final Value<int> nr;
  final Value<String> tag;
  const StrongsCompanion({
    this.id = const Value.absent(),
    this.nr = const Value.absent(),
    this.tag = const Value.absent(),
  });
  StrongsCompanion.insert({
    this.id = const Value.absent(),
    required int nr,
    required String tag,
  }) : nr = Value(nr),
       tag = Value(tag);
  static Insertable<Strong> custom({
    Expression<int>? id,
    Expression<int>? nr,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nr != null) 'nr': nr,
      if (tag != null) 'tag': tag,
    });
  }

  StrongsCompanion copyWith({
    Value<int>? id,
    Value<int>? nr,
    Value<String>? tag,
  }) {
    return StrongsCompanion(
      id: id ?? this.id,
      nr: nr ?? this.nr,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nr.present) {
      map['nr'] = Variable<int>(nr.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrongsCompanion(')
          ..write('id: $id, ')
          ..write('nr: $nr, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $ContentTable content = $ContentTable(this);
  late final $StrongsTable strongs = $StrongsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books, content, strongs];
}

typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      required int nr,
      required String name,
      Value<int> rowid,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<int> nr,
      Value<String> name,
      Value<int> rowid,
    });

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get nr => $composableBuilder(
    column: $table.nr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get nr => $composableBuilder(
    column: $table.nr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get nr =>
      $composableBuilder(column: $table.nr, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          Book,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
          Book,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> nr = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion(nr: nr, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required int nr,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion.insert(nr: nr, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      Book,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
      Book,
      PrefetchHooks Function()
    >;
typedef $$ContentTableCreateCompanionBuilder =
    ContentCompanion Function({
      Value<int> id,
      required String book_name,
      required int chapter_nr,
      required int verse_nr,
      required int word_nr,
      required String word,
      required String concordance,
      required String functional,
      required String strongs,
      required String lemma,
    });
typedef $$ContentTableUpdateCompanionBuilder =
    ContentCompanion Function({
      Value<int> id,
      Value<String> book_name,
      Value<int> chapter_nr,
      Value<int> verse_nr,
      Value<int> word_nr,
      Value<String> word,
      Value<String> concordance,
      Value<String> functional,
      Value<String> strongs,
      Value<String> lemma,
    });

class $$ContentTableFilterComposer
    extends Composer<_$AppDatabase, $ContentTable> {
  $$ContentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get book_name => $composableBuilder(
    column: $table.book_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapter_nr => $composableBuilder(
    column: $table.chapter_nr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verse_nr => $composableBuilder(
    column: $table.verse_nr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get word_nr => $composableBuilder(
    column: $table.word_nr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concordance => $composableBuilder(
    column: $table.concordance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get functional => $composableBuilder(
    column: $table.functional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strongs => $composableBuilder(
    column: $table.strongs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lemma => $composableBuilder(
    column: $table.lemma,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContentTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentTable> {
  $$ContentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get book_name => $composableBuilder(
    column: $table.book_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapter_nr => $composableBuilder(
    column: $table.chapter_nr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verse_nr => $composableBuilder(
    column: $table.verse_nr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get word_nr => $composableBuilder(
    column: $table.word_nr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concordance => $composableBuilder(
    column: $table.concordance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get functional => $composableBuilder(
    column: $table.functional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strongs => $composableBuilder(
    column: $table.strongs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lemma => $composableBuilder(
    column: $table.lemma,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContentTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentTable> {
  $$ContentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);

  GeneratedColumn<int> get chapter_nr => $composableBuilder(
    column: $table.chapter_nr,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verse_nr =>
      $composableBuilder(column: $table.verse_nr, builder: (column) => column);

  GeneratedColumn<int> get word_nr =>
      $composableBuilder(column: $table.word_nr, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get concordance => $composableBuilder(
    column: $table.concordance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get functional => $composableBuilder(
    column: $table.functional,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strongs =>
      $composableBuilder(column: $table.strongs, builder: (column) => column);

  GeneratedColumn<String> get lemma =>
      $composableBuilder(column: $table.lemma, builder: (column) => column);
}

class $$ContentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContentTable,
          ContentData,
          $$ContentTableFilterComposer,
          $$ContentTableOrderingComposer,
          $$ContentTableAnnotationComposer,
          $$ContentTableCreateCompanionBuilder,
          $$ContentTableUpdateCompanionBuilder,
          (
            ContentData,
            BaseReferences<_$AppDatabase, $ContentTable, ContentData>,
          ),
          ContentData,
          PrefetchHooks Function()
        > {
  $$ContentTableTableManager(_$AppDatabase db, $ContentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> book_name = const Value.absent(),
                Value<int> chapter_nr = const Value.absent(),
                Value<int> verse_nr = const Value.absent(),
                Value<int> word_nr = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> concordance = const Value.absent(),
                Value<String> functional = const Value.absent(),
                Value<String> strongs = const Value.absent(),
                Value<String> lemma = const Value.absent(),
              }) => ContentCompanion(
                id: id,
                book_name: book_name,
                chapter_nr: chapter_nr,
                verse_nr: verse_nr,
                word_nr: word_nr,
                word: word,
                concordance: concordance,
                functional: functional,
                strongs: strongs,
                lemma: lemma,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String book_name,
                required int chapter_nr,
                required int verse_nr,
                required int word_nr,
                required String word,
                required String concordance,
                required String functional,
                required String strongs,
                required String lemma,
              }) => ContentCompanion.insert(
                id: id,
                book_name: book_name,
                chapter_nr: chapter_nr,
                verse_nr: verse_nr,
                word_nr: word_nr,
                word: word,
                concordance: concordance,
                functional: functional,
                strongs: strongs,
                lemma: lemma,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContentTable,
      ContentData,
      $$ContentTableFilterComposer,
      $$ContentTableOrderingComposer,
      $$ContentTableAnnotationComposer,
      $$ContentTableCreateCompanionBuilder,
      $$ContentTableUpdateCompanionBuilder,
      (ContentData, BaseReferences<_$AppDatabase, $ContentTable, ContentData>),
      ContentData,
      PrefetchHooks Function()
    >;
typedef $$StrongsTableCreateCompanionBuilder =
    StrongsCompanion Function({
      Value<int> id,
      required int nr,
      required String tag,
    });
typedef $$StrongsTableUpdateCompanionBuilder =
    StrongsCompanion Function({
      Value<int> id,
      Value<int> nr,
      Value<String> tag,
    });

class $$StrongsTableFilterComposer
    extends Composer<_$AppDatabase, $StrongsTable> {
  $$StrongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nr => $composableBuilder(
    column: $table.nr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StrongsTableOrderingComposer
    extends Composer<_$AppDatabase, $StrongsTable> {
  $$StrongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nr => $composableBuilder(
    column: $table.nr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StrongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrongsTable> {
  $$StrongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nr =>
      $composableBuilder(column: $table.nr, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);
}

class $$StrongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrongsTable,
          Strong,
          $$StrongsTableFilterComposer,
          $$StrongsTableOrderingComposer,
          $$StrongsTableAnnotationComposer,
          $$StrongsTableCreateCompanionBuilder,
          $$StrongsTableUpdateCompanionBuilder,
          (Strong, BaseReferences<_$AppDatabase, $StrongsTable, Strong>),
          Strong,
          PrefetchHooks Function()
        > {
  $$StrongsTableTableManager(_$AppDatabase db, $StrongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StrongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> nr = const Value.absent(),
                Value<String> tag = const Value.absent(),
              }) => StrongsCompanion(id: id, nr: nr, tag: tag),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int nr,
                required String tag,
              }) => StrongsCompanion.insert(id: id, nr: nr, tag: tag),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StrongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrongsTable,
      Strong,
      $$StrongsTableFilterComposer,
      $$StrongsTableOrderingComposer,
      $$StrongsTableAnnotationComposer,
      $$StrongsTableCreateCompanionBuilder,
      $$StrongsTableUpdateCompanionBuilder,
      (Strong, BaseReferences<_$AppDatabase, $StrongsTable, Strong>),
      Strong,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$ContentTableTableManager get content =>
      $$ContentTableTableManager(_db, _db.content);
  $$StrongsTableTableManager get strongs =>
      $$StrongsTableTableManager(_db, _db.strongs);
}
