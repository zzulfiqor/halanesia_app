import 'package:core/core.dart';
import 'package:transaction/data/request/order_accept_response.dart';
import 'package:transaction/data/request/transaction_response.dart';
import 'package:transaction/datasource/transaction_remote_data_source.dart';

import '../data/request/transaction_detail_response.dart';

abstract class TransactionRepository {
  Future<BaseResult<TransactionResponse>> getTransaction(
      {int page = 1, int size = 5, String type = 'buy'});

  Future<BaseResult<TransactionDetailResponse>> getTransactionDetail(int id);
  Future<BaseResult<OrderAcceptResponseData>> acceptTransaction(int transactionId);
}

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRepositoryImpl(this.transactionRemoteDataSource);
  final TransactionRemoteDataSource transactionRemoteDataSource;

  @override
  Future<BaseResult<TransactionResponse>> getTransaction(
      {int page = 1, int size = 5, String type = 'buy'}) async {
    return await transactionRemoteDataSource.getTransaction(
        page: page, size: size, type: type);
  }

  @override
  Future<BaseResult<TransactionDetailResponse>> getTransactionDetail(int id) async{
    return await transactionRemoteDataSource.getTransactionDetail(id);
  }
  
  @override
  Future<BaseResult<OrderAcceptResponseData>> acceptTransaction(int transactionId)async{
    return await transactionRemoteDataSource.acceptTransaction(transactionId);
  }
}
