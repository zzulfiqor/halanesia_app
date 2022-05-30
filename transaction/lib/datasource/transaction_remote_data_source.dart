import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:core/base/base_data_source.dart';
import 'package:transaction/data/request/order_accept_response.dart';
import 'package:transaction/data/request/transaction_detail_response.dart';
import 'package:transaction/data/request/transaction_response.dart';

class TransactionRemoteDataSource extends BaseDataSource {
  TransactionRemoteDataSource({required this.apiProvider});

  final ApiProvider apiProvider;

  // Get Transaction Data
  Future<BaseResult<TransactionResponse>> getTransaction(
      {int page = 1, int size = 5, String type = 'buy'}) async {
    return getResult(
        apiProvider.get(URL_TRANSACTION +
            "?page=$page&size=$size&order=desc&sort=created&type=$type"),
        (response) => TransactionResponse.fromJson(response['data']));
  }

  // Accept Transaction (Seller)
  Future<BaseResult<OrderAcceptResponseData>> acceptTransaction(
      int transactionId) async {
    return getResult(
        apiProvider.post(URL_TRANSACTION_ACCEPT + "/$transactionId",{}),
        (response) => OrderAcceptResponseData.fromJson(response['data']));
  }

  // Get Transaction Detail
  Future<BaseResult<TransactionDetailResponse>> getTransactionDetail(
      int id) async {
    return getResult(apiProvider.get(URL_TRANSACTION_DETAIL + "/$id"),
        (response) => TransactionDetailResponse.fromJson(response['data']));
  }
}
