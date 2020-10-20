class Result<T> {
  ResultStatus status;
  T data;
  String message;
  String errorCode;

  Result.uninitialized() : status = ResultStatus.uninitialized;

  // Optional data field for optimistic loading with data
  Result.loading({this.data}) : status = ResultStatus.loading;

  Result.success([this.data]) : status = ResultStatus.success;

  Result.error(this.errorCode, {this.message = ""})
      : status = ResultStatus.error;

  factory Result.errorFromResult(Result result) {
    return Result.error(result.errorCode, message: result.message);
  }
}

enum ResultStatus { uninitialized, loading, success, error }
