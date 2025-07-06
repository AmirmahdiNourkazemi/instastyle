import 'package:dio/dio.dart';
import 'package:instastyle/utils/constant.dart';
import 'package:myket_iap/myket_iap.dart';
import 'package:myket_iap/util/iab_result.dart';
import 'package:myket_iap/util/purchase.dart';

import '../../../../../core/localstorage/local_data.dart';
import '../../../../../core/locator/locator.dart';
import '../../../../../core/network/api_provider_imp.dart';

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

  Future<String> myketPayment(String productId, String productUuid) async {
    var iabResult = await MyketIAP.init(
        rsaKey: Constants.rsaMyket, enableDebugLogging: true);
    Map<dynamic, dynamic> result =
        await MyketIAP.launchPurchaseFlow(sku: productUuid, payload: "payload");
    IabResult purchaseResult = result[MyketIAP.RESULT];
    var putSub;
    Purchase? purchase = result[MyketIAP.PURCHASE];
    if (purchase == null) {
      return 'error';
    } else {
      if (purchase.mToken.isNotEmpty) {
        putSub = await locator<ApiProviderImp>().put(
            'https://api.texim.ir/api/package-names/${Constants.packageName}/products/$productId/subscribe',
            bodyParameters: {
              'purchase_token': purchase.mToken,
              'gateway': 'myket'
            },
            headerParameters: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${LocalData.firstTokenNotifier.value}'
            },
            queryParameter: {
              'name': Constants.packageName,
              'product_id': productId
            });
      }
    }

    if (putSub.statusCode == 200) {
      await MyketIAP.consume(purchase: purchase);
      return 'ok';
    } else {
      return 'error';
    }
  }
}
