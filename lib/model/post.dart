import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String id, title, body;

  Post({this.id, this.title, this.body});

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object['id'],
      title: object['title'],
      body: object['body'],
    );
  }

  static Future<List<Post>> connectToAPI(int start, int limit) async {
    String apiURL = "https://jsonplaceholder.typicode.com/posts?_start=" +
        start.toString() +
        "&_limit=" +
        limit.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body) as List;

    return jsonObject
        .map((item) => Post(
            id: item['id'].toString(),
            title: item['title'],
            body: item['body']))
        .toList();
  }
}
