import 'package:agos/views/auth/register.dart';
import 'package:agos/views/home.dart';
import 'package:agos/views/auth/login.dart';

var routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
};