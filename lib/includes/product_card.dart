import 'package:flutter/material.dart';

const Color firstColor = Color(0XFFF44336);
const Color secondColor = Color(0XFF4CAF50);

/// Class ini untuk membuat Product Card dengan indah
class ProductCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final String price;
  final String notification;
  final int quantity;
  final Function onAddCartTap;
  final Function onIncTap;
  final Function onDecTap;

  final TextStyle _textStyle = TextStyle(
    fontFamily: "Lato",
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.grey[800],
  );

  /// Membuat `Product Card` dengan indah
  /// * [imageURL] diisi dengan url gambar yang ingin ditampilkan di `Product Card` defaultnya ""
  /// * [name] diisi dengan nama `Product Card` defaultnya ""
  /// * [price] diisi dengan harga `Product Card` defaultnya ""
  ///
  /// Contoh:
  /// ```
  /// ProductCard(imageURL: "http://mywebsite/foto.jpg", name: "Buah Jeruk Mix 1 kg", price: "Rp15.000");
  /// ```
  ProductCard({
    this.imageURL = "",
    this.name = "",
    this.price = "",
    this.quantity = 0,
    this.notification,
    this.onAddCartTap,
    this.onIncTap,
    this.onDecTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 10),
          duration: Duration(milliseconds: 300),
          width: 230,
          height: (notification != null) ? 375 : 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: secondColor,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != null) ? notification : "",
              style: _textStyle.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: _textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      price,
                      style: _textStyle.copyWith(
                        fontSize: 14,
                        color: firstColor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 240,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: firstColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: onIncTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: _textStyle,
                        ),
                        GestureDetector(
                          onTap: onDecTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: RaisedButton(
                      onPressed: onAddCartTap,
                      color: firstColor,
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 20,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
