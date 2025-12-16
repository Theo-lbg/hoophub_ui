import 'package:flutter/material.dart';
import 'package:hoophub_ui/FilePreviewButton/task_tile_popup.dart';
import 'package:hoophub_ui/file_preview_button.dart';
import 'package:hoophub_ui/Pill/info_pill.dart';
import 'package:hoophub_ui/Pill/date_info_pill_carousel.dart';

void main() {
  runApp(const MaterialApp(home: MainApp(), debugShowCheckedModeBanner: false));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 40),
            // Carrousel de sélection de date façon Figma
            DateInfoPillCarousel(
              startDate: DateTime(2025, 12, 1),
              daysCount: 31,
              initialSelectedIndex: 1, // 2 Décembre sélectionné par défaut
            ),
            const SizedBox(height: 24),
            FilePreviewButton(
              title: 'Document.pdf',
              tags: [
                InfoPill(
                  label: 'PDF',
                  backgroundColor: Colors.red,
                  labelColor: Colors.white,
                ),
                InfoPill(
                  label: 'Important',
                  backgroundColor: Colors.orange,
                  labelColor: Colors.white,
                ),
              ],
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => TaskTilePopup(
                    onEdit: () {
                      // Handle edit action
                      Navigator.of(context).pop();
                    },
                    onRefuse: () {
                      // Handle delete action
                      Navigator.of(context).pop();
                    },
                    onClose: () => Navigator.of(context).pop(),
                  ),
                );
              },
            ),
            FilePreviewButton(
              title: 'Document.pdf',
              tags: [
                InfoPill(
                  label: 'PDF',
                  backgroundColor: Colors.red,
                  labelColor: Colors.white,
                ),
                InfoPill(
                  label: 'Important',
                  backgroundColor: Colors.orange,
                  labelColor: Colors.white,
                ),
              ],
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => TaskTilePopup(
                    onEdit: () {
                      // Handle edit action
                      Navigator.of(context).pop();
                    },
                    onRefuse: () {
                      // Handle delete action
                      Navigator.of(context).pop();
                    },
                    onClose: () => Navigator.of(context).pop(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
