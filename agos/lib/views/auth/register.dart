import 'package:agos/models/user.dart';
import 'package:agos/widgets/buttons/btn_decorative.dart';
import 'package:agos/widgets/dialogs/dlg_warning.dart';
import 'package:flutter/material.dart';
import 'package:agos/widgets/textfields/txt_decoration.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = "", password = "", name = "", contact = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agos Registration Page"),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.indigo[100]),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: new TextDecoration(
                          iconData: Icons.person,
                          hint: 'Full Name'
                        ),   
                        onChanged: (text) {
                          setState(() {
                            name = text.trim();
                          });                       
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: new TextDecoration(
                          iconData: Icons.contact_phone,
                          hint: 'Contact Number'
                        ),   
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (text) {
                          setState(() {
                            contact = text.trim();
                          });                       
                        },
                      ),
                      ButtonDecorative(
                        text: "CREATE ACCOUNT",
                        icon: Icons.check_circle_outline,
                        callback: () async {
                          if(email == "" || password == "" || contact == "") {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) { 
                                return new DialogWarning(context: context, message: "Please fill up all required fields.");
                              }
                            );
                          }

                          var user = new User(email.trim(), password.trim(), name.trim(), contact.trim()
                          );
                          user.insert();

                          Navigator.pop(context);
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) { 
                              return new DialogWarning(context: context, message: "Account has been successfully registered.");
                            }
                          );
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