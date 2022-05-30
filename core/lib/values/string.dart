import 'package:intl/intl.dart';

String formatCurrencyWithDecimal(int price) {
  double d = price.toDouble();
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  return "Rp ${currencyFormatter.format(d)}";
}

String formatDateString(DateTime? date) {
  return DateFormat('dd MMMM yyyy').format(date!);
}

String formatDateCompleteString(DateTime? date) {
  return DateFormat('dd MMMM yyyy, HH:mm').format(date!);
}

String formatDateWithHourString(DateTime? date) {
  return DateFormat('HH:mm  dd MMM').format(date!);
}

String getMonthNameFromDate(DateTime date) {
  return DateFormat.MMMM().format(date);
}

String? validateEmpty(String? value, String title) {
  if (value == null || value.isEmpty) {
    return "$title anda kosong";
  }
  return null;
}

String? validateEmail(String? value, String title) {
  if (value == null || value.isEmpty) {
    return "$title anda kosong";
  }
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
    return 'Email anda tidak valid';
  }
  return null;
}

String? validatePhone(String? value, String title) {
  if (value == null || value.isEmpty) {
    return "$title anda kosong";
  }
  if (value.length < 10) {
    return 'nomor anda kurang dari 10';
  }
  return null;
}

extension StringExtension on String? {
  String replaceIfEmptyOrNull(String value) {
    if (this == null) {
      return value;
    } else {
      if (this == "") {
        return value;
      } else {
        return this ?? "";
      }
    }
  }

  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this ?? "";
    }
  }
}

extension IntExtension on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this ?? 0;
    }
  }
}
