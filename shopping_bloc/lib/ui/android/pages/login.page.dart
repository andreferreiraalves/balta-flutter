import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user.bloc.dart';
import 'package:shopping_bloc/models/authenticate-user.model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Usuário Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  username = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Senha Inválida';
                  }
                  return null;
                },
                onSaved: (val) {
                  password = val;
                },
              ),
              FlatButton(
                child: Text("Entrar"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    authenticate(context, bloc);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context, UserBloc bloc) async {
    var user = await bloc.authenticate(
      new AuthenticateUserModel(
        username: username,
        password: password,
      ),
    );

    if (user != null) {
      Navigator.pop(context);
      return;
    }

    final snackBar = SnackBar(content: Text('Usuário ou senha invalidos'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
