enum TheStates {
  initial,
  success,
  error,
  loading;
}

extension TheStatesExtension on TheStates {
  T? whenOrNull<T>({
    T Function()? initial,
    T Function()? success,
    T Function()? error,
    T Function()? loading,
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
    }
  }
}
