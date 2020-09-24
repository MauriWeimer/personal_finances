extension IntExtension on int {
  String get twoDigits =>
      '${(this < 10) ? this.toString().padLeft(2, '0') : this} ';
}
