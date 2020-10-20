import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toPriceFormatString() {
    return "\$${NumberFormat("###,##0.00", "en_US").format(this)}";
  }
}
