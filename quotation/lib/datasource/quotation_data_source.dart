import 'package:core/base/base_data_source.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:quotation/data/remote/quotation_list_response.dart';

class QuotationRemoteDataSource extends BaseDataSource {
  QuotationRemoteDataSource({required this.apiProvider});
  final ApiProvider apiProvider;

  Future<BaseResult<QuotationListResponse>> getQuotationList({int? page = 1}) async {
    return getResult(apiProvider.get('$URL_QUOTATION?size=6&page=$page'),
        (response) => QuotationListResponse.fromJson(response['data']));
  }
}
