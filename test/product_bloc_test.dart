import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_first_flutter/bloc/product_bloc.dart';
import 'package:my_first_flutter/model/product.dart';

void main() {
  group("Product Bloc Test", () {
    blocTest(
      "Initial Value",
      build: () => ProductBloc(),
      expect: [],
    );

    blocTest(
      "Add Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(Product("Apel", 2000)));
      },
      expect: [
        ProductLoaded([Product("Apel", 2000)])
      ],
    );

    blocTest(
      "Add 2 Products",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(Product("Apel", 2000)));
        bloc.add(AddProduct(Product("Durian", 100000)));
      },
      expect: [
        // ProductLoaded([Product("Apel", 2000)]),
        ProductLoaded([Product("Apel", 2000), Product("Durian", 100000)]),
      ],
    );

    blocTest(
      "Remove Product",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(RemoveProduct(Product("Apel", 2000)));
      },
      expect: [ProductInitial()],
    );

    blocTest(
      "Remove Products (ProductLoaded)",
      build: () => ProductBloc(),
      act: (bloc) async {
        bloc.add(AddProduct(Product("Apel", 2000)));
        bloc.add(RemoveProduct(Product("Apel", 2000)));
      },
      expect: [
        ProductLoaded([]),
      ],
    );
  });
}
