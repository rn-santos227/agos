import 'package:agos/helpers/database_helper.dart';
import 'package:agos/widgets/buttons/btn_decorative.dart';
import 'package:agos/widgets/buttons/btn_outlined.dart';
import 'package:agos/widgets/dialogs/dlg_warning.dart';
import 'package:flutter/material.dart';
import 'package:agos/widgets/textfields/txt_decoration.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _dbHelper = DatabaseHelper.instance;

  bool loading = false;

  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Agos Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        decoration: new BoxDecoration(color: Colors.indigo[100]),
        child: Form(
          key: _formKey,
          child: Center( 
            child: SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/splash.png", height: 128),                  
                      Divider(
                        height: 20,
                        thickness: 2,
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: new TextDecoration(
                          iconData: Icons.email,
                          hint: 'Email Address',
                        ),
                        onChanged: (text) {
                          setState(() {
                            email = text.trim();
                          });
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        obscureText: true,
                        decoration: new TextDecoration(
                          iconData: Icons.lock,
                          hint: 'Password'
                        ),                 
                        onChanged: (text) {
                          setState(() {
                            password = text.trim();
                          });                       
                        },
                      ),
                      ButtonDecorative(
                        text: "LET'S GET STARTED",
                        icon: Icons.check_circle_outline,
                        callback: () async {
                          var arguments = [email, password];
                          List<Map<String, dynamic>> user = await _dbHelper.search("users", "email = ? AND password = ?", arguments);
                          if (user.length > 0) {
                            Navigator.pushNamed(context, '/');
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) { 
                                return new DialogWarning(context: context, message: "Login Successful.");
                              }
                            );
                          } else {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) { 
                                return new DialogWarning(context: context, message: "Login fail, please check your credentials.");
                              }
                            );
                          }
                        }
                      ),
                      ButtonOutlinedDecorative(
                        text: "NEW ACCOUNT",
                        icon: Icons.person,
                        callback: () async {
                          Navigator.pushNamed(context, '/register');
                        }
                      ),
                    ]
                  )
                )
              )
            )
          )
        ),
      )
    );
  }
}