import 'dart:developer';

import 'package:intl/intl.dart';

String extractYear(String? date) {
  if(date == null || date.isEmpty) return '';
  DateTime parsedDate = DateTime.parse(date);
  return parsedDate.year.toString();
}

String formatRating(double? rating) {
  if (rating == null) return 'N/A';
  double maxRating = (rating / 10) * 10;
  // Format the rating to one decimal place and append '/10'
  return '${maxRating.toStringAsFixed(1)}/10';
}
