import 'dart:convert';
import 'package:random_user/random_user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  Uri url = Uri.parse('https://random-data-api.com/api/v2/users?size=12');

  final http.Response response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      final List<dynamic> users = jsonDecode(response.body);

      return users.map((user) => User.fromJson(user)).toList();
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load user data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch users: $e');
  }
}

void main() async {
  // print('fetching user data');

  try {
    List<User> users = await fetchUsers();

    for (var user in users) {
      user.printUser();
    }
  } catch (e) {
    print('fetching error');
  }

  // print('fetching completed');
}
