import 'package:flutter/material.dart';

import '../components/button.widget.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/notification.png",
                  width: 250,
                ),
                Text(
                  "Olá desconhecido",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TDButton(
                  text: "Login com o google",
                  image: "assets/images/google.png",
                  callBack: () {},
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
