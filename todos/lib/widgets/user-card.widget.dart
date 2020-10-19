import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 40),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage("assets/images/notification.png"),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
