import 'package:agos/widgets/textfields/txt_decoration.dart';
import 'package:flutter/material.dart';

class QuestionForm extends StatefulWidget {
  QuestionForm({
    Key? key,
  }) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  static const Map<int, String> _questionType = {
    1: "text",
    2: "paragraph",
    3: "choices",
    4: "multiple",
    5: "dropdown",
    6: "linear scale"
  };

  int _type = 1;
  String question = "";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment(1.15, 0.65),
              heightFactor: 0.5,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.red,
                elevation: 0,
                onPressed: () {
                  setState(() {
                    
                  });
                },
                child: Icon(Icons.close),
              )
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.settings),
                hintText: 'Question Type',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(color: Colors.yellow),
              ),
              items: _questionType.map((key, value) {
                return MapEntry(
                    value,
                    DropdownMenuItem<int>(
                      value: key,
                      child: Text(value),
                    ));
              }).values.toList(),
              value: _type,
              onChanged: (newValue) {
                setState(() {
                    _type = int.parse(newValue.toString());
                });
              }
            ),
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: new TextDecoration(
                iconData: Icons.help,
                hint: 'Question',
              ),
              onChanged: (text) {
                setState(() {
                  question = text.trim();
                });
              },
            ),
          ]
        )
      )
    );
  }
}