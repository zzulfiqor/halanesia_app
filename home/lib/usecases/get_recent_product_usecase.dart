import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/recent_product_response.dart';
import 'package:home/repository/home_repository.dart';

class GetRecentProductUsecase
    extends UseCase<BaseResult<RecentProductResponse>, int> {
  GetRecentProductUsecase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<RecentProductResponse>> call(int params) async {
    return await repository.getRecentProduct(params);
  }
}
