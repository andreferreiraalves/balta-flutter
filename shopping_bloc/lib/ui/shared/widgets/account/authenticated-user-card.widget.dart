import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user.bloc.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(bloc.user.image),
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Bem-vindo, ${bloc.user.name}"),
            SizedBox(height: 10),
            FlatButton(
              child: Text("Sair"),
              onPressed: bloc.logout,
            ),
          ],
        ),
      ),
    );
  }
}
