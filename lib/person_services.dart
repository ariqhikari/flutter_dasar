import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/person.dart';

class PersonServices {
  static Future<Person> getPersonById(String id, http.Client client) async {
    String url = ".../persons/" + id;

    var response = await client.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error");
    }

    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}
