import 'package:agos/helpers/database_helper.dart';

class User {
  final _dbHelper = DatabaseHelper.instance;
  final String email;
  final String password;
  final String contact;
  final String name;

  User(this.email, this.password, this.name, this.contact);

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
      "name": name,
      "contact": contact
    };
  }

  insert() {
    _dbHelper.insert("users", this.toMap());
  }
}