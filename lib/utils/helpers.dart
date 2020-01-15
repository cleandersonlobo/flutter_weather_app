int convertToCel(temp) {
  return ((temp - 32) * (5 / 9)).round();
}

String formatHourToString(hour) {
  if (hour == 0) {
    return "12AM";
  }
  if (hour > 11) {
    return "${hour}PM";
  }
  return "${hour}AM";
}
