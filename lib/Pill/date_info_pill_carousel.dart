import 'package:flutter/material.dart';
import 'date_info_pill.dart';

class DateInfoPillCarousel extends StatefulWidget {
  final DateTime startDate;
  final int daysCount;
  final int initialSelectedIndex;
  final void Function(int index, DateTime date)? onDateSelected;

  const DateInfoPillCarousel({
    super.key,
    required this.startDate,
    this.daysCount = 7,
    this.initialSelectedIndex = 0,
    this.onDateSelected,
  });

  @override
  State<DateInfoPillCarousel> createState() => _DateInfoPillCarouselState();
}

class _DateInfoPillCarouselState extends State<DateInfoPillCarousel> {
  final ScrollController _scrollController = ScrollController();
  late int selectedIndex;

  DateTime get _mondayOfWeek {
    final ref = widget.startDate;
    return ref.subtract(Duration(days: ref.weekday - 1));
  }

  @override
  void initState() {
    super.initState();
    // Sélectionne la date du jour si elle est dans la semaine affichée, sinon fallback sur initialSelectedIndex
    final today = DateTime.now();
    final monday = _mondayOfWeek;
    final diff = today.difference(monday).inDays;
    if (diff >= 0 && diff < widget.daysCount) {
      selectedIndex = diff;
    } else {
      selectedIndex = widget.initialSelectedIndex;
    }

    // Scroll pour rendre la date sélectionnée visible après le premier build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelected();
    });
  }

  void _scrollToSelected() {
    // Centrer la pill sélectionnée dans le viewport
    final double pillWidth = 56 + 8;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double listPadding = 22.0; // padding horizontal du carrousel
    final double centerOffset =
        (selectedIndex * pillWidth) -
        (screenWidth - pillWidth) / 2 +
        listPadding;
    final double maxScroll = _scrollController.position.hasContentDimensions
        ? _scrollController.position.maxScrollExtent
        : double.infinity;
    final double offset = centerOffset.clamp(0, maxScroll);
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F4FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 70,
        child: Align(
          alignment: Alignment.center,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.daysCount,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final date = _mondayOfWeek.add(Duration(days: index));
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                  widget.onDateSelected?.call(index, date);
                  _scrollToSelected();
                },
                child: DateInfoPill(
                  dayLabel: _weekdayShortFr(date.weekday),
                  dayNumber: date.day.toString(),
                  monthLabel: _monthShortFr(date.month),
                  backgroundColor: isSelected
                      ? const Color(0xFF4956C6)
                      : Colors.white,
                  textColor: isSelected
                      ? Colors.white
                      : const Color(0xFF4956C6),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

String _weekdayShortFr(int weekday) {
  const days = ['lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'];
  return days[(weekday - 1) % 7];
}

String _monthShortFr(int month) {
  const months = [
    'Jan',
    'Fév',
    'Mar',
    'Avr',
    'Mai',
    'Juin',
    'Juil',
    'Aoû',
    'Sep',
    'Oct',
    'Nov',
    'Déc',
  ];
  return months[(month - 1) % 12];
}
