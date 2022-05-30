import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/shipping_option_request.dart';
import 'package:profile/data/response/shipping_option_update_response.dart';
import 'package:profile/profile.dart';

class PutShippingOptionUseCase
    extends UseCase<BaseResult<ShippingOptionUpdateResponse>, ShippingOptionRequest> {
  PutShippingOptionUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<ShippingOptionUpdateResponse>> call(ShippingOptionRequest params) async{
   return await repository.putShippingOptions(params);
  }
}
