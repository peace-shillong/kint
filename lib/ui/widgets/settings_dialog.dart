import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();

    return AlertDialog(
      title: const Text("Settings"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Greek Font Size"),
          Slider(
            value: settings.fontSize,
            min: 10.0,
            max: 30.0,
            divisions: 13,
            label: settings.fontSize.round().toString(),
            onChanged: (value) {
              context.read<SettingsProvider>().setFontSize(value);
            },
          ),
          Text(
            "Το βιβλίο της γενεαλογίας του Ιησού Χριστού, του γιου του Δαβίδ, του γιου του Αβραάμ.", // Sample text
            style: TextStyle(fontSize: settings.fontSize),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Done"),
        ),
      ],
    );
  }
}