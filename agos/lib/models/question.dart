import 'package:agos/helpers/database_helper.dart';

class Question {
  final _dbHelper = DatabaseHelper.instance;
  int formId;
  String refCode;
  String text;
  int type;


  Question(this.formId, this.refCode, this.text, this.type);

  Map<String, dynamic> toMap() {
    return {
      "form_id": formId,
      "ref_code": refCode,
      "text": text,
      "type": type
    };
  }

  setForm(int formId) {
    this.formId = formId;
  }

  setText(String text) {
    this.text = text;
  }

  setType(int type) {
    this.type = type;
  }

  insert() {
    _dbHelper.insert("questions", this.toMap());
  }
}