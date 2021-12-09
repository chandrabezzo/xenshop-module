import 'package:intl/intl.dart';

class CurrencyUtil {
  static String price({
    required double amount,
    String? locale,
  }) {
    final format = NumberFormat.currency(locale: locale ?? 'en_US');
    return format.format(amount);
  }
}
