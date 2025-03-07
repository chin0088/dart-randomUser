class User {
  final int id;
  final String firstName;
  final String lastName;

  User({required this.id, required this.firstName, required this.lastName});

  factory User.fromJson(Map<String, dynamic> dataMap) {
    int id = dataMap['id'] ?? 0;
    String firstName = dataMap['first_name'] ?? '';
    String lastName = dataMap['last_name'] ?? '';

    return User(id: id, firstName: firstName, lastName: lastName);
  }

  void printUser() {
    print('User id: $id, First Name: $firstName, Last Name: $lastName');
  }
}
