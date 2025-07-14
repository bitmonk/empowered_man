import 'package:empowered/core/extension/extensions.dart';

enum TheStates { initial, success, error, loading, loadingMore }

extension TheStatesExtension on TheStates {
  T? whenOrNull<T>({
    T Function()? initial,
    T Function()? success,
    T Function()? error,
    T Function()? loading,
    T Function()? loadingMore,
  }) {
    switch (this) {
      case TheStates.initial:
        return initial?.call();
      case TheStates.success:
        return success?.call();
      case TheStates.error:
        return error?.call();
      case TheStates.loading:
        return loading?.call();
      case TheStates.loadingMore:
        return loadingMore?.call();
    }
  }

  Widget showWidget({
    Widget Function()? initial,
    Widget Function()? success,
    Widget Function()? error,
    Widget Function()? loading,
    Widget Function()? loadingMore,
    Widget Function()? orElse, // Fallback function
  }) {
    switch (this) {
      case TheStates.initial:
        return initial?.call() ?? orElse?.call() ?? const SizedBox();
      case TheStates.success:
        return success?.call() ?? orElse?.call() ?? const SizedBox();
      case TheStates.error:
        return error?.call() ?? orElse?.call() ?? const SizedBox();
      case TheStates.loading:
        return loading?.call() ?? orElse?.call() ?? const SizedBox();
      case TheStates.loadingMore:
        return loadingMore?.call() ?? orElse?.call() ?? const SizedBox();
    }
  }
}
