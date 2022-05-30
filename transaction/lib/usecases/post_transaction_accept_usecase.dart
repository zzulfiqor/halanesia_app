import 'dart:ffi';

import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:transaction/data/request/order_accept_response.dart';
import 'package:transaction/repository/transaction_repository.dart';

class PostTransactionAcceptUseCase
    extends UseCase<BaseResult<OrderAcceptResponseData>, int> {
  PostTransactionAcceptUseCase(this.repository);
  final TransactionRepository repository;

  @override
  Future<BaseResult<OrderAcceptResponseData>> call(int params) async {
    return await repository.acceptTransaction(params);
  }
}
