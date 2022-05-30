import 'package:flutter/foundation.dart';

enum Status { SUCCESS, ERROR }

class BaseResult<T> {
  BaseResult(
      {this.statusCode,
      required this.status,
      required this.data,
      required this.message,
      required this.errorCode,
      required this.errorDesc});

  late final int? statusCode;
  late final Status status;
  final T? data;
  late final String message;
  late final dynamic errorCode;
  late final String errorDesc;

  static BaseResult<T> success<T>(T? data) {
    return BaseResult(
        status: Status.SUCCESS,
        data: data,
        message: '',
        errorCode: 0,
        errorDesc: '');
  }

  static BaseResult<T> error<T>(dynamic code, String message) {
    return BaseResult(
      status: Status.ERROR,
      data: null,
      errorCode: code,
      errorDesc: message,
      message: '',
    );
  }
}
