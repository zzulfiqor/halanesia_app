import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class GetCouponUseCase
    extends UseCase<BaseResult<List<GetCouponResponseData>>, NoParams> {
  GetCouponUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<List<GetCouponResponseData>>> call(NoParams params) async {
    return await repository.getCoupon();
  }
}
