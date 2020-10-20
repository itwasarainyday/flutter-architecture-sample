import 'package:flutterarchitecturesample/extensions/list+extension.dart';

extension MapExtension<K, V> on Map<K, V> {
  bool nestedMapEquals(Map<K, V> otherMap) {
    if (this.keys.length != otherMap.keys.length) {
      return false;
    }

    for (int i = 0; i < this.keys.length; i++) {
      final key = this.keys.elementAt(i);
      final value = this[key];
      final otherValue = otherMap[key];

      if (value is Map && otherValue is Map) {
        if (!value.nestedMapEquals(otherValue)) {
          return false;
        }
      } else if (value is List && otherValue is List) {
        if (!value.nestedListEquals(otherValue)) {
          return false;
        }
      } else if (otherValue != value) {
        return false;
      }
    }

    return true;
  }
}
