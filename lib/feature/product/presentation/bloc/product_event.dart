abstract class ProductEvent {}

class ProdcutStartEvent extends ProductEvent {}

class ProductPaymentEvent extends ProductEvent {
  String productID;
  ProductPaymentEvent(this.productID);
}