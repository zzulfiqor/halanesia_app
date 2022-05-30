import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/shipping_area_response.dart';
import 'package:profile/repository/profile_repository.dart';


class GetShippingAreaUseCase
    extends UseCase<BaseResult<ShippingAreaResponse>, int> {
  GetShippingAreaUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<ShippingAreaResponse>> call(int params) async{
   return await repository.getShippingArea(params);
  }
}
