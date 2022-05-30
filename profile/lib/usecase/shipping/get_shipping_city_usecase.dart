import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/shipping_city_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetShippingCityUseCase
    extends UseCase<BaseResult<ShippingCityResponse>, int> {
  GetShippingCityUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<ShippingCityResponse>> call(int params) async{
   return await repository.getShippingCity(params);
  }
}
