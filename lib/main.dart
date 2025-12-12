import 'package:flutter/material.dart';
import 'package:hoophub_ui/FilePreviewButton/file_preview_button.dart';
import 'package:hoophub_ui/Pill/info_pill.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FilePreviewButton(
            title: 'Document.pdf',
            tags: [
              InfoPill(
                label: 'PDF',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                icon: const Icon(Icons.picture_as_pdf),
              ),
              InfoPill(
                label: 'Important',
                backgroundColor: Colors.orange,
                labelColor: Colors.white,
                icon: const Icon(Icons.star),
              ),
            ],
            onTap: () {
              // Handle tap event
            },
          ),
        ),
      ),
    );
  }
}
