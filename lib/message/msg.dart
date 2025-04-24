import 'package:flutter/material.dart';

void setMessage2(String msg2,BuildContext context) {
  final msg=SnackBar(content: Text(msg2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
  backgroundColor: Colors.grey,
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.only(left: 30,right: 30,bottom: MediaQuery.of(context).size.height-400),
  );
  ScaffoldMessenger.of(context).showSnackBar(msg);
}