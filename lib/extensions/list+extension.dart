import 'package:flutterarchitecturesample/extensions/map+extension.dart';

extension ListExtension<E> on List<E> {
  E get safeFirst => this != null && isNotEmpty ? first : null;

  List<T> mapIndexed<T>(T Function(int, E) function) {
    return this
        .asMap()
        .map((index, item) => MapEntry(index, function(index, item)))
        .values
        .toList();
  }

  bool nestedListEquals(List<E> otherList) {
    if (this.length != otherList.length) {
      return false;
    }

    for (int i = 0; i < this.length; i++) {
      final value = this[i];
      final otherValue = otherList[i];

      if (value is List && otherValue is List) {
        if (!value.nestedListEquals(otherValue)) {
          return false;
        }
      } else if (value is Map && otherValue is Map) {
        if (!value.nestedMapEquals(otherValue)) {
          return false;
        }
      } else if (value != otherValue) {
        return false;
      }
    }

    return true;
  }
}
