import 'package:dio/dio.dart';
import '../../../../../core/localstorage/local_data.dart';
import '../../../../../core/locator/locator.dart';
import '../../../../../core/network/api_provider_imp.dart';
import '../../../../../utils/constant.dart';

class ProductApiProvider {
  Future<Response> getProduct() async {
    final res = await locator<ApiProviderImp>().get(
        'https://api.texim.ir/api/package-names/${Constants.packageName}/products',
        headerParameter: {
          'Authorization': 'Bearer ${LocalData.firstTokenNotifier.value}',
        });
    return res;
  }

  Future<Response> getPayment(String productId) async {
    final res = await locator<ApiProviderImp>()
        .post('https://api.texim.ir/api/zarinpal/gateway', headerParametr: {
      'Authorization': 'Bearer ${LocalData.firstTokenNotifier.value}',
    }, bodyParameter: {
      'product_id': productId,
      'description': 'توضیحات پرداخت',
    });
    return res;
  }
}
