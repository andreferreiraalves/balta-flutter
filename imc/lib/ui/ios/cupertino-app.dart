import 'package:flutter/cupertino.dart';
import 'package:imc/ui/ios/pages/home.page.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'imc',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
