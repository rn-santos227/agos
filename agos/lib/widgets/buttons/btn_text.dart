import 'package:flutter/material.dart';


class ButtonTextDecorative extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function function;

  const ButtonTextDecorative({
    Key? key,
    required this.text,
    required this.icon,
    required this.function
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
          height: 50.0,
          width: double.infinity,   
          child: TextButton(   
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
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
            onPressed: () => function
          ),
        )
      );
  }
}