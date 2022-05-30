import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:transaction/data/request/transaction_response.dart';
import 'package:transaction/repository/transaction_repository.dart';

class GetTransactionListUseCase
    extends UseCase<BaseResult<TransactionResponse>, Map<String, dynamic>> {
  GetTransactionListUseCase(this.repository);
  final TransactionRepository repository;

  @override
  Future<BaseResult<TransactionResponse>> call(
      Map<String, dynamic> params) async {
    return await repository.getTransaction(
        page: params['page'], size: params['size'], type: params['type']);
  }
}
