enum ErrorType {
  CONNECTIONLOST,
  NODATAAVAILABLE,
  GENERALERROR,
  INCORRECTDATA,
  NOTALLOWED,
}

class BaseError {
  late final String message;
  late final String description;
  late final ErrorType errorType;

  BaseError({
    required this.message,
    required this.description,
    required this.errorType,
  });
}
