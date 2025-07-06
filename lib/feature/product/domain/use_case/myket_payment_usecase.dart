import 'package:instastyle/core/resources/data_state.dart';
import 'package:instastyle/core/usecase/use_case.dart';

import '../repository/product_repository.dart';

class MyketPaymentUsecase extends UseCase<DataState<String>, MyketPayment> {
  final ProductRepository productRepository;

  MyketPaymentUsecase(this.productRepository);

  @override
  Future<DataState<String>> call(MyketPayment params) async {
    return await productRepository.myketPayment(
        params.productId, params.productUuid);
  }
}
