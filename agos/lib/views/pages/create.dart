import 'package:agos/helpers/generators.dart';
import 'package:agos/models/question.dart';
import 'package:agos/widgets/textfields/txt_decoration.dart';
import 'package:agos/widgets/buttons/btn_decorative.dart';
import 'package:agos/widgets/buttons/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({
    Key? key,
  }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final List<Card> _questionWidgets = [];
  final List<Question> _questions = [];
  
  final _formKey = GlobalKey<FormState>();
  static const Map<int, String> _questionType = {
    1: "text",
    2: "paragraph",
    3: "choices",
    4: "multiple",
    5: "dropdown",
    6: "linear scale"
  };

  @override
  void initState() {
    super.initState();
  }
  
  String title = "Untitled Form", description = "Description of the Form.", link = "";
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
                initialValue: title,
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
                initialValue: description,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: new TextDecoration(
                  iconData: Icons.article,
                  hint: 'Description',
                ),
                onChanged: (text) {
                  setState(() {
                    description = text.trim();
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
              SizedBox(height: 15.0),
              Column(
                children: List.generate(_questionWidgets.length, (i) {
                  return _questionWidgets[i];
                }),
              ),
              ButtonOutlinedDecorative(
                text: "ADD QUESTION",
                icon: Icons.queue,
                callback: () {
                  setState(() {
                    String rnd = getRandString(10);
                    _questions.add(new Question(0, rnd, "", 1));
                    int index = _questions.indexWhere((question) => question.refCode == rnd); 
                    _questionWidgets.add(Card(
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
                                    print(_questions);
                                    _questions.removeAt(_questions.length - 1);
                                    _questionWidgets.removeAt(_questionWidgets.length - 1);
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
                              value: _questions[index].type,
                              onChanged: (newValue) {
                                setState(() {
                                  _questions[index].setType(int.parse(newValue.toString()));
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
                                  _questions[index].setText(text.trim());
                                });
                              },
                            ),
                          ]
                        )
                      )
                    ));
                  });
                }
              ),
              Divider(
                height: 50,
                thickness: 2,
              ),
              ButtonDecorative(
                text: "CREATE NEW FORM",
                icon: Icons.assignment_turned_in,
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
