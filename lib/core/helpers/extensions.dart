import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  /// Pushes a new page using a [MaterialPageRoute].
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  /// Replaces current route with [page].
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.of(this).pushReplacement<T, TO>(MaterialPageRoute(builder: (_) => page));
  }

  /// Pushes a named route.
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Replaces current route with a named route.
  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(routeName, arguments: arguments);
  }

  /// Pops the current route.
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}
