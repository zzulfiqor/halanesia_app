import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/shipping_option_response.dart';
import 'package:profile/repository/profile_repository.dart';


class GetShippingOptionUseCase
    extends UseCaseNoParams<BaseResult<List<ShippingOptionResponse>>> {
  GetShippingOptionUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<List<ShippingOptionResponse>>> call() async{
   return await repository.getShippingOptions();
  }
}
