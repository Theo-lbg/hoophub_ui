import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Uncomment if you use SVG icons

class CustomPopupMenu {
  static OverlayEntry? _entry;

  static void show({
    required BuildContext context,
    required Offset position,
    required VoidCallback onAccept,
    required VoidCallback onRefuse,
    required VoidCallback onEdit,
    Widget? iconAccept,
    Widget? iconRefuse,
    Widget? iconEdit,
  }) {
    _entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            left: position.dx - 220 + 36, // Adjust for width and icon size
            top: position.dy + 8,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 220,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F4FA),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _PopupOption(
                      icon:
                          iconRefuse ??
                          Icon(Icons.close, color: Colors.red, size: 28),
                      label: 'Accepter',
                      color: Colors.red,
                      onTap: () {
                        hide();
                        onAccept();
                      },
                    ),
                    const SizedBox(height: 18),
                    _PopupOption(
                      icon:
                          iconAccept ??
                          Icon(Icons.check, color: Colors.green, size: 28),
                      label: 'Refuser',
                      color: Colors.green,
                      onTap: () {
                        hide();
                        onRefuse();
                      },
                    ),
                    const SizedBox(height: 18),
                    _PopupOption(
                      icon:
                          iconEdit ??
                          Icon(Icons.edit, color: Colors.blue, size: 28),
                      label: 'Éditer',
                      color: Colors.blue,
                      onTap: () {
                        hide();
                        onEdit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_entry!);
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}

class _PopupOption extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _PopupOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'SFProRounded',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }
}
