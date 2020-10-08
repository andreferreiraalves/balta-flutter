import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user.bloc.dart';
import 'package:shopping_bloc/models/create-user.model.dart';
import 'package:shopping_bloc/ui/shared/validators/custom.validators.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var user = CreateUserModel();

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
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
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
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (value) => user.name = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
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
                validator: (value) => CustomValidators.isEmail(value),
                onSaved: (value) => user.email = value,
              ),
              SizedBox(height: 10),
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
                  if (value.isEmpty) return "Usuário inválido";
                  return null;
                },
                onSaved: (value) => user.username = value,
              ),
              SizedBox(height: 10),
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
                onSaved: (value) => user.password = value,
              ),
              SizedBox(height: 10),
              FlatButton(
                child: Text("Entrar"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    create(context, bloc);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  create(BuildContext context, UserBloc bloc) async {
    var res = await bloc.create(this.user);

    if (res == null) {
      final snackBar =
          SnackBar(content: Text('Não foi possível realizar o cadastro'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      Navigator.pop(context);
      final snackBar = SnackBar(content: Text('Bem vindo ! Efetue login'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
