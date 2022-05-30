import 'package:core/core.dart';
import 'package:quotation/data/remote/quotation_list_response.dart';
import 'package:quotation/datasource/quotation_data_source.dart';

abstract class QuotationRepository{
  // get quotation
  Future<BaseResult<QuotationListResponse>> getQuotationList({int page = 1});
}

class QuotationRepositoryImpl implements QuotationRepository{
  QuotationRepositoryImpl(this.apiProvider);
  final QuotationRemoteDataSource apiProvider;

  @override
  Future<BaseResult<QuotationListResponse>> getQuotationList({int page = 1}) async {
    return await apiProvider.getQuotationList(page: page);
  }
}