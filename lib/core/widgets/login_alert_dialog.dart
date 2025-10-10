import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../view/login_screen.dart';


Future<void> showLoginAlertDialog(BuildContext context) async {
  return showCupertinoDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Login"),
            content:Text("You need to Login to Continuee"),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder:(_)=>LoginScreen()));
                },
              )
            ],
          ));
}
