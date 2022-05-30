import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/shipping_suburb_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetShippingSuburbUseCase
    extends UseCase<BaseResult<ShippingSuburbResponse>, int> {
  GetShippingSuburbUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<ShippingSuburbResponse>> call(int params) async{
   return await repository.getShippingSuburb(params);
  }
}
