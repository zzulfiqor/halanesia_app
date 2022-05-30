import 'package:core/core.dart';

void safeCallApi<T>(BaseResult<T> result,
    {Function(bool isLoad)? onLoad,
    required Function(T? data) onSuccess,
    required Function(dynamic code, String message) onError}) {
  onLoad != null ? onLoad(true) : doNothing();
  if (result.status == Status.SUCCESS) {
    onSuccess(result.data);
  } else {
    if (result.errorCode != "40001") {
      onError(result.errorCode, result.errorDesc);
    }
  }
  onLoad != null ? onLoad(false) : doNothing();
}

doNothing() {}
