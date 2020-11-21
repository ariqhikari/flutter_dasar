import 'package:flutter/material.dart';
import 'package:my_first_flutter/model/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(post.id),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(post.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
