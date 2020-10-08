import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user.bloc.dart';
import 'package:shopping_bloc/ui/android/pages/settings.page.dart';
import 'package:shopping_bloc/ui/shared/widgets/account/authenticated-user-card.widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/account/unauthenticated-user-card.widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: bloc.user == null
          ? UnauthenticatedUserCard()
          : AuthenticatedUserCard(),
    );
  }
}
