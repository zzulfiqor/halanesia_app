import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetMerchantRatingUseCase extends UseCase<BaseResult<String>, int> {
  @override
  GetMerchantRatingUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<String>> call(int params) async {
    return await repository.getMerchantRating(params);
  }
}
