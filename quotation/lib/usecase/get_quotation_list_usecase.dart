import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:quotation/data/remote/quotation_list_response.dart';
import 'package:quotation/repository/quotation_repository.dart';

class GetQuotationListUsecase
    extends UseCase<BaseResult<QuotationListResponse>, int> {
  GetQuotationListUsecase(this.repository);

  final QuotationRepository repository;

  @override
  Future<BaseResult<QuotationListResponse>> call(int params) async {
    return await repository.getQuotationList(page: params);
  }
}