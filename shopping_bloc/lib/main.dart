import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart.bloc.dart';
import 'package:shopping_bloc/blocs/theme.bloc.dart';
import 'package:shopping_bloc/blocs/user.bloc.dart';
import 'package:shopping_bloc/ui/android/pages/tabs.page.dart';

import 'blocs/home.bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
