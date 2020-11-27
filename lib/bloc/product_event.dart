part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  final Product product;
  const ProductEvent(this.product);

  @override
  List<Object> get props => [];
}

class AddProduct extends ProductEvent {
  AddProduct(Product product) : super(product);
}

class RemoveProduct extends ProductEvent {
  RemoveProduct(Product product) : super(product);
}
