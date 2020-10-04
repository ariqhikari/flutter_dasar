import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'includes/product_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc([]),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF44336),
        title: Text("Demo ListView Builder"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            color: Color(0XFFF44336),
            child: Text(
              "Create Products",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              bloc.add(r.nextInt(4) + 2);
            },
          ),
          SizedBox(height: 20),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      (index == 0) ? SizedBox(width: 20) : Container(),
                      ProductCard(
                        imageURL: products[index].imageURL,
                        name: products[index].name,
                        price: products[index].price.toString(),
                        onAddCartTap: () {},
                        onIncTap: () {},
                        onDecTap: () {},
                      ),
                      SizedBox(width: 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  String imageURL;
  String name;
  int price;

  Product({this.imageURL = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc(List<Product> initialState) : super(initialState);

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    for (int i = 0; i < event; i++) {
      products.add(
        Product(
          imageURL:
              "https://hikari.miraistudio.id/frontend/assets/images/about.jpg",
          name: "Jual Temen " + (i + 1).toString(),
          price: (i + 1) * 5000,
        ),
      );
    }
    yield products;
  }
}
