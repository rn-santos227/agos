import 'package:agos/helpers/database_helper.dart';
import 'package:agos/widgets/textfields/txt_decoration.dart';
import 'package:agos/widgets/buttons/btn_decorative.dart';
import 'package:agos/widgets/buttons/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _dbHelper = DatabaseHelper.instance;

  String title = "", link = "";
  int participants = 20;
  bool privacy = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[               
              SizedBox(height: 15.0),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: new TextDecoration(
                  iconData: Icons.article,
                  hint: 'Form Title',
                ),
                onChanged: (text) {
                  setState(() {
                    title = text.trim();
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: new TextDecoration(
                  iconData: Icons.person,
                  hint: 'Form Participants',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                onChanged: (text) {
                  setState(() {
                    participants = int.parse(text.trim());
                  });
                },
              ),
              Divider(
                height: 50,
                thickness: 5,
              ),
              ButtonOutlinedDecorative(
                text: "ADD QUESTION",
                icon: Icons.queue,
                callback: () async {

                }
              ),
              Divider(
                height: 50,
                thickness: 5,
              ),
              ButtonDecorative(
                text: "CREATE NEW FORM",
                icon: Icons.person,
                callback: () async {

                }
              ),
            ]
          )
        )
      )
    );
  }
}