import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/data/remote/generate_payment_url_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class PostGeneratePaymentUrlUseCase
    extends UseCase<BaseResult<GeneratePaymentUrlResponseData>, NoParams> {
  PostGeneratePaymentUrlUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<GeneratePaymentUrlResponseData>> call(params) async {
    return await repository.generatePaymentUrl();
  }
}
