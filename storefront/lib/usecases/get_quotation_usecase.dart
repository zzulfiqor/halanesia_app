import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/quotation_list_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetQuotationUseCase
    extends UseCase<BaseResult<QuotationListResponse>, Map<String,int>> {
  GetQuotationUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<QuotationListResponse>> call( Map<String,int> params) async {
    return await repository.getQuotationList(params['merchantId'] as int, params['page'] as int);
  }
}