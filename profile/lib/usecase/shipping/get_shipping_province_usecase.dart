import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/shipping_province_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetShippingProvinceUseCase
    extends UseCaseNoParams<BaseResult<ShippingProvinceResponse>> {
  GetShippingProvinceUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<ShippingProvinceResponse>> call() async{
   return await repository.getShippingProvince();
  }
}
