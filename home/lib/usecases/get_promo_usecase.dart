import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/banner_entity.dart';
import 'package:home/repository/home_repository.dart';

class GetPromoUsecase extends UseCase<BaseResult<List<BannerEntity>>, NoParams> {
  GetPromoUsecase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<List<BannerEntity>>> call(NoParams params) async {
    return await repository.getBanner();
  }
}
