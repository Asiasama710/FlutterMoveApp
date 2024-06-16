class InitState<T> extends BaseState<T> {
  const InitState();
}

class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

class LoadMoreState<T> extends BaseState<T> {
  final T data;

  LoadMoreState({required this.data});
}

class SuccessState<T> extends BaseState<T> {
  final T data;

  SuccessState({required this.data});
}

class ErrorState<T> extends BaseState<T> {
  final String? msg;

  ErrorState({required this.msg});
}

class DoneState<T> extends BaseState<T> {
  const DoneState();
}

class BaseState<T> {
  const BaseState();

  factory BaseState.init() = InitState<T>;

  factory BaseState.done() = DoneState<T>;

  factory BaseState.loading() = LoadingState<T>;

  factory BaseState.loadMore({required T data}) = LoadMoreState<T>;

  factory BaseState.success({required T data}) = SuccessState<T>;

  factory BaseState.error({required String? msg}) = ErrorState<T>;

  T? getSuccessData() {
    if (this is SuccessState) {
      return (this as SuccessState<T>).data;
    } else if (this is LoadMoreState) {
      return (this as LoadMoreState<T>).data;
    }
    return null;
  }

  String? getErrorMessage() {
    if (this is ErrorState) {
      return (this as ErrorState<T>).msg;
    }
    return null;
  }
}
