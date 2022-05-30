import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/recomendation_item_reponse.dart';
import 'package:home/repository/home_repository.dart';

class GetRecomendationBuyerUseCase
    extends UseCase<BaseResult<RecomendationResponse>, int> {
  GetRecomendationBuyerUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<RecomendationResponse>> call(int params) async {
    return await repository.getRecomendationBuyer(params);
  }
}