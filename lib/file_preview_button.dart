import 'package:flutter/material.dart';
import 'package:hoophub_ui/Pill/info_pill.dart';

enum LabelPosition { top, bottom }

class FilePreviewButton extends StatelessWidget {
  final String title;
  final List<InfoPill> tags;
  final Widget imagePreview;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const FilePreviewButton({
    super.key,
    required this.title,
    this.tags = const [],
    this.imagePreview = const ColoredBox(
      color: Colors.grey,
      child: SizedBox.expand(),
    ),
    this.backgroundColor = const Color(0xFFF6F7FB),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SizedBox(
                height: 170,
                width: double.infinity,
                child: imagePreview,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(spacing: 8, runSpacing: 8, children: tags),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: onTap,
                        child: const Icon(
                          Icons.more_vert,
                          size: 28,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'SFProRounded',
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      color: Color(0xFF222222),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
