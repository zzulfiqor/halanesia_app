import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/repository/home_repository.dart';

import '../data/remote/quotation_list_response.dart';

class GetMerchantQuotationUseCase
    extends UseCase<BaseResult<QuotationListResponse>, int> {
  GetMerchantQuotationUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<QuotationListResponse>> call(int params) async {
    return await repository.getQuotationList(params);
  }
}