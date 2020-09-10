import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'package:imc/ui/android/materia-app.dart';
import 'package:imc/ui/ios/cupertino-app.dart';

void main() =>
    Platform.isIOS ? runApp(MyCupertinoApp()) : runApp(MyMaterialApp());
