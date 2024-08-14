import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";

  bool isNotNullOrEmpty() => !isNullOrEmpty();  

  String capitalize() => this![0].toUpperCase() + this!.substring(1);

  String trim() => this!.trim();

  String trimAll() => this!.replaceAll(RegExp(r"\s+"), " ");

  String toPascalCase() => this!.split(" ").map((str) => str.capitalize()).join();

  String toCamelCase() => this!.split(" ").map((str) => str.toLowerCase()).join();

  String toSnakeCase() => this!.split(" ").map((str) => str.toLowerCase()).join("_");

  String toTitleCase() => this!.split(" ").map((str) => str.capitalize()).join(" ");

  String toSentenceCase() => this!.toTitleCase();

}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// String Extension
extension MyString on String {
  int parseInt() => int.parse(this);

  double parseDouble() => double.parse(this);

  String addPrefix(String prefix) => '$prefix $this';

  String addSuffix(String suffix) => '$this $suffix';
}

class EXAMPLE {
  EXAMPLE() {
    // print("hello".parseInt());
    // print("hello".parseDouble());

    // print('Hussein Saad!'.addPrefix('Welcome:'));
    // print('Hussein Saad!'.addPrefix('Developer'));
    // Output: Welcome: Hussein Saad!
  }
}
