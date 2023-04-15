import 'package:intl/intl.dart';

extension ExtInt on int {
  String get formatCurrency =>
      NumberFormat.simpleCurrency(locale: 'pt-BR').format(this);
}
