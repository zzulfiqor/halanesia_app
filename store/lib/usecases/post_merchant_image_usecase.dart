import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/repository/merchant_repository.dart';
import 'package:core/entity/image_upload_response.dart';

class PostMerchantImageUseCase
    extends UseCase<BaseResult<ImageUploadResponse>, String> {
  PostMerchantImageUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<ImageUploadResponse>> call(params) async {
    return await repository.postMerchantImage(params);
  }
}
