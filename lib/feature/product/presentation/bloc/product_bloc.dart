import 'package:bloc/bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/use_case/payment_usecase.dart';
import '../../domain/use_case/product_usecase.dart';
import 'payment_status.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'product_status.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;
  final PaymentUsecase paymentUsecase;
  ProductBloc(this.productUseCase , this.paymentUsecase)
      : super(ProductState(
            status: ProductInitial(), paymentStatus: ProductPaymentInit())) {
    on<ProdcutStartEvent>(
      (event, emit) async {
        emit(state.copyWith(status: ProductLoading()));
        DataState dataState = await productUseCase.call(null);
        print(dataState);
        if (dataState is DataSuccess) {
          emit(state.copyWith(status: ProductSuccess(dataState.data)));
        }
        if (dataState is DataError) {
          emit(state.copyWith(status: ProductError(dataState.error!)));
        }
      },
    );
    on<ProductPaymentEvent>(
      (event, emit) async {
        emit(state.copyWith(paymentStatus: ProductPaymentLoading(event.productID)));
        DataState dataState = await paymentUsecase.call(event.productID);
        print(dataState);
        if (dataState is DataSuccess) {
          emit(state.copyWith(paymentStatus: ProductPaymentSuccess(dataState.data)));
        }
        if (dataState is DataError) {
          emit(state.copyWith(paymentStatus: ProductPaymentError(dataState.error!)));
        }
      },
    );
  }
}
