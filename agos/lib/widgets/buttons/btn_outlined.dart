import 'package:flutter/material.dart';


class ButtonOutlinedDecorative extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback callback;

  const ButtonOutlinedDecorative({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
          height: 50.0,
          width: double.infinity,   
          child: OutlinedButton(   
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.red)
                )
              )
            ),    
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(icon),
                ),
                Align(
                    alignment: Alignment.center,
                    child:  Text(    
                    this.text,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),  
                  ), 
                ),
              ],
            ), 
            onPressed: callback
          ),
        )
      );
  }
}