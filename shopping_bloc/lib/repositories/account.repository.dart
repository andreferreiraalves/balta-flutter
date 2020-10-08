import 'package:dio/dio.dart';
import 'package:shopping_bloc/models/authenticate-user.model.dart';
import 'package:shopping_bloc/models/create-user.model.dart';
import 'package:shopping_bloc/models/user.model.dart';

import '../settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    var url = "${Settings.apiUrl}v1/account/login";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    var url = "${Settings.apiUrl}v1/account";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }
}
