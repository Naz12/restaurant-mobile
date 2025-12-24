import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_theme.dart';

enum DateRangeOption {
  today,
  currentWeek,
  lastWeek,
  last7Days,
  currentMonth,
  lastMonth,
  currentYear,
  lastYear,
  custom,
}

class DateRangePicker extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime, DateTime) onDateRangeSelected;
  final DateRangeOption? initialOption;

  const DateRangePicker({
    super.key,
    this.startDate,
    this.endDate,
    required this.onDateRangeSelected,
    this.initialOption,
  });

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateRangeOption? _selectedOption;
  DateTime? _customStartDate;
  DateTime? _customEndDate;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialOption ?? DateRangeOption.today;
    _customStartDate = widget.startDate;
    _customEndDate = widget.endDate;
    _applyDateRange(_selectedOption!);
  }

  void _applyDateRange(DateRangeOption option) {
    final now = DateTime.now();
    DateTime startDate;
    DateTime endDate;

    switch (option) {
      case DateRangeOption.today:
        startDate = DateTime(now.year, now.month, now.day);
        endDate = startDate.add(const Duration(days: 1));
        break;
      case DateRangeOption.currentWeek:
        final weekday = now.weekday;
        startDate = now.subtract(Duration(days: weekday - 1));
        startDate = DateTime(startDate.year, startDate.month, startDate.day);
        endDate = startDate.add(const Duration(days: 7));
        break;
      case DateRangeOption.lastWeek:
        final weekday = now.weekday;
        startDate = now.subtract(Duration(days: weekday + 6));
        startDate = DateTime(startDate.year, startDate.month, startDate.day);
        endDate = startDate.add(const Duration(days: 7));
        break;
      case DateRangeOption.last7Days:
        startDate = now.subtract(const Duration(days: 7));
        startDate = DateTime(startDate.year, startDate.month, startDate.day);
        endDate = DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
        break;
      case DateRangeOption.currentMonth:
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 1);
        break;
      case DateRangeOption.lastMonth:
        startDate = DateTime(now.year, now.month - 1, 1);
        endDate = DateTime(now.year, now.month, 1);
        break;
      case DateRangeOption.currentYear:
        startDate = DateTime(now.year, 1, 1);
        endDate = DateTime(now.year + 1, 1, 1);
        break;
      case DateRangeOption.lastYear:
        startDate = DateTime(now.year - 1, 1, 1);
        endDate = DateTime(now.year, 1, 1);
        break;
      case DateRangeOption.custom:
        startDate = _customStartDate ?? DateTime(now.year, now.month, now.day);
        endDate = _customEndDate ?? startDate.add(const Duration(days: 1));
        break;
    }

    widget.onDateRangeSelected(startDate, endDate);
  }

  Future<void> _selectCustomDateRange() async {
    final now = DateTime.now();
    final startDate = await showDatePicker(
      context: context,
      initialDate: _customStartDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (startDate != null && mounted) {
      final endDate = await showDatePicker(
        context: context,
        initialDate: _customEndDate ?? startDate,
        firstDate: startDate,
        lastDate: now,
      );

      if (endDate != null && mounted) {
        setState(() {
          _customStartDate = startDate;
          _customEndDate = endDate.add(const Duration(days: 1)); // Include end date
          _selectedOption = DateRangeOption.custom;
        });
        _applyDateRange(DateRangeOption.custom);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    String displayText;

    if (_selectedOption == DateRangeOption.custom && _customStartDate != null && _customEndDate != null) {
      displayText = '${dateFormat.format(_customStartDate!)} - ${dateFormat.format(_customEndDate!.subtract(const Duration(days: 1)))}';
    } else {
      displayText = _getOptionLabel(_selectedOption!);
    }

    return PopupMenuButton<DateRangeOption>(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.textSecondary),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_today, size: 16),
            const SizedBox(width: 8),
            Text(displayText),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_drop_down, size: 16),
          ],
        ),
      ),
      onSelected: (option) {
        setState(() {
          _selectedOption = option;
        });
        if (option == DateRangeOption.custom) {
          _selectCustomDateRange();
        } else {
          _applyDateRange(option);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: DateRangeOption.today,
          child: Text('Today'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.currentWeek,
          child: Text('Current Week'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.lastWeek,
          child: Text('Last Week'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.last7Days,
          child: Text('Last 7 Days'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.currentMonth,
          child: Text('Current Month'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.lastMonth,
          child: Text('Last Month'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.currentYear,
          child: Text('Current Year'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.lastYear,
          child: Text('Last Year'),
        ),
        const PopupMenuItem(
          value: DateRangeOption.custom,
          child: Text('Custom Range'),
        ),
      ],
    );
  }

  String _getOptionLabel(DateRangeOption option) {
    switch (option) {
      case DateRangeOption.today:
        return 'Today';
      case DateRangeOption.currentWeek:
        return 'Current Week';
      case DateRangeOption.lastWeek:
        return 'Last Week';
      case DateRangeOption.last7Days:
        return 'Last 7 Days';
      case DateRangeOption.currentMonth:
        return 'Current Month';
      case DateRangeOption.lastMonth:
        return 'Last Month';
      case DateRangeOption.currentYear:
        return 'Current Year';
      case DateRangeOption.lastYear:
        return 'Last Year';
      case DateRangeOption.custom:
        return 'Custom Range';
    }
  }
}

