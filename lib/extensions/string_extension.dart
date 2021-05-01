part of 'extensions.dart';

extension StringExtension on String {
  //periksa ada atau tidak angka didalam textfield amount
  //bilangan ascii 48 - 57 adalah 0 - 9
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
