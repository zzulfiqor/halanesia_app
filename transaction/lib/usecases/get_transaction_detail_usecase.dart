import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:transaction/data/request/transaction_detail_response.dart';
import 'package:transaction/repository/transaction_repository.dart';

class GetTransactionDetailUseCase
    extends UseCase<BaseResult<TransactionDetailResponse>, int> {
  GetTransactionDetailUseCase(this.repository);
  final TransactionRepository repository;

  @override
  Future<BaseResult<TransactionDetailResponse>> call(int params) async {
    return await repository.getTransactionDetail(params);
  }
}
