import 'package:flutter/material.dart';

class NotImplementedScreen extends StatelessWidget {
  NotImplementedScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return  Center(
       child: Text(message, style: TextStyle(color: Colors.black),),
    );
  }
}