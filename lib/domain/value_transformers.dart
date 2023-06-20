import 'package:test_assignment_effective/domain/dish.dart';

String formatDateTime(DateTime dateTime) {
  final String day = dateTime.day.toString();
  final String month = _getMonthName(dateTime.month);
  final String year = dateTime.year.toString();

  return '$day $month $year';
}

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'Января';
    case 2:
      return 'Февраля';
    case 3:
      return 'Марта';
    case 4:
      return 'Апреля';
    case 5:
      return 'Мая';
    case 6:
      return 'Июня';
    case 7:
      return 'Июля';
    case 8:
      return 'Августа';
    case 9:
      return 'Сентября';
    case 10:
      return 'Октября';
    case 11:
      return 'Ноября';
    case 12:
      return 'Декабря';
    default:
      return '';
  }
}

String translateTeg(Teg teg) {
  switch (teg) {
    case Teg.all:
      return 'Все меню';
    case Teg.rice:
      return 'С рисом';
    case Teg.salad:
      return 'Салаты';
    case Teg.fish:
      return 'С рыбой';
  }
}
