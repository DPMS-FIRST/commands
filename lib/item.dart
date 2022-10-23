import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key, required this.email,required this.password, required this.callBackValue});
  final String email, password;
  //Create The Callback
  final Function(String value, String value1) callBackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Call the callback
        callBackValue(email,password);
      },
      child: ListTile(
        title: Text(email),
        subtitle: Text(password),
      ),
    );
  }
}
