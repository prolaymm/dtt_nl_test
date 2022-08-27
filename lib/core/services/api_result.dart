import 'api_status.dart';

class ApiResult<T> {
  String message;
  StatusType statusType;
  T data;

  ApiResult({required this.message, required this.statusType, required this.data});
}
