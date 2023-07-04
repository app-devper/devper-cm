typedef FutureResult<T, E> = Future<Result<T, E>>;
typedef StreamResult<T, E> = Stream<Result<T, E>>;

class Result<T, E> {
  final T? _value;
  final E? _error;

  Result.error(E error)
      : _value = null,
        _error = error;

  Result.success(T success)
      : _value = success,
        _error = null;

  bool get isFailure => _error != null;

  bool get isSuccess => _value != null;

  E get error {
    if (_error == null) {
      throw Exception("Attempted to pull a success value from a failure");
    }
    return _error!;
  }

  T get value {
    if (_value == null) {
      throw Exception("Attempted to pull a failure value from a success");
    }
    return _value!;
  }

  Result<T2, dynamic> andThen<T2, E2>(Result<T2, E2> Function(T) thenFunction) {
    if (isSuccess) {
      return thenFunction(_value!);
    }

    return Result.error(_error!);
  }

  FutureResult<T2, dynamic> andThenAsync<T2, E2>(FutureResult<T2, E2> Function(T) thenFunction) async {
    if (isSuccess) {
      try {
        return await thenFunction(_value!);
      } catch (e) {
        return Result.error(e);
      }
    }

    return Result.error(_error!);
  }

  T2 fold<T2>({required T2 Function(T value) onSuccess, required T2 Function(E error) onError}) {
    if (isSuccess) {
      return onSuccess(_value as T);
    }

    return onError(_error as E);
  }

  E getErrorOrElse(E Function() orElse) => _error ?? orElse();

  T getValueOrElse(T Function() orElse) => _value ?? orElse();

  @override
  String toString() {
    return isSuccess ? 'success($_value)' : 'error($_error)';
  }
}
