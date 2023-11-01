import 'dart:convert';

import 'package:http/http.dart' as http;

class AddonsHelper {
  setAddonsData() async {
    final data = await http.get(Uri.parse('https://raw.githubusercontent.com/mbshuvo325/testapi/main/myapp'));
    final key = jsonDecode(data.body);
    final response = key['status'];
    return response;
  }
}
