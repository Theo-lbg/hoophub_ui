import 'package:flutter/material.dart';

class TaskTilePopup extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onAccept;
  final VoidCallback? onRefuse;
  final VoidCallback? onClose;
  final Widget? iconEdit;
  final Widget? iconAccept;
  final Widget? iconRefuse;

  const TaskTilePopup({
    super.key,
    this.onEdit,
    this.onAccept,
    this.onRefuse,
    this.onClose,
    this.iconEdit,
    this.iconAccept,
    this.iconRefuse,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onClose ?? () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            right: 0,
            top: 8,
            child: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _TaskTilePopupOption(
                    icon:
                        iconRefuse ??
                        Icon(Icons.close, color: Colors.red, size: 28),
                    label: 'Accepter',
                    color: Colors.red,
                    onTap: () {
                      onAccept?.call();
                      onClose?.call();
                    },
                  ),
                  const SizedBox(height: 18),
                  _TaskTilePopupOption(
                    icon:
                        iconAccept ??
                        Icon(Icons.check, color: Colors.green, size: 28),
                    label: 'Refuser',
                    color: Colors.green,
                    onTap: () {
                      onRefuse?.call();
                      onClose?.call();
                    },
                  ),
                  const SizedBox(height: 18),
                  _TaskTilePopupOption(
                    icon:
                        iconEdit ??
                        Icon(Icons.edit, color: Colors.blue, size: 28),
                    label: 'Éditer',
                    color: Colors.blue,
                    onTap: () {
                      onEdit?.call();
                      onClose?.call();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskTilePopupOption extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _TaskTilePopupOption({
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
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }
}
