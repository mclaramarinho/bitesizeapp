abstract class Result<T, E> {
  const Result();

  bool get isOk => this is Ok<T, E>;
  bool get isError => this is Error<T, E>;

  R when<R>({
    required R Function(T value) ok,
    required R Function(E error) error,
  }) {
    if (this is Ok<T, E>) {
      return ok((this as Ok<T, E>).value);
    }
    return error((this as Error<T, E>).error);
  }

  T getOrElse(T Function() orElse) {
    if (this is Ok<T, E>) {
      return (this as Ok<T, E>).value;
    }
    return orElse();
  }
}

class Ok<T, E> extends Result<T, E> {
  final T value;

  const Ok(this.value);

  @override
  String toString() => 'Ok - ($value)';
}

class Error<T, E> extends Result<T, E> {
  final E error;

  const Error(this.error);

  @override
  String toString() => 'Error - ($error)';
}