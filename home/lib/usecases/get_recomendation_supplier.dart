import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/recomendation_item_reponse.dart';
import 'package:home/repository/home_repository.dart';

class GetRecomendationSupplierUseCase
    extends UseCase<BaseResult<RecomendationResponse>, int> {
  GetRecomendationSupplierUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<RecomendationResponse>> call(int params) async {
    return await repository.getRecomendationSupplier(params);
  }
}
