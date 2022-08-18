import 'package:flutter/material.dart';
import 'package:get_data_api/user_list/models/user_error.dart';
import 'package:get_data_api/user_list/models/user_model.dart';
import 'package:get_data_api/user_list/repo/api_status.dart';
import 'package:get_data_api/user_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUserModel;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUserModel => _selectedUserModel;
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError? userError) {
    _userError = userError;
  }

  setSelectedUserModel(UserModel? selectedUserModel) {
    _selectedUserModel = selectedUserModel;
  }

  setAddingUser(UserModel addingUser) {
    _addingUser = addingUser;
  }

  addUser() async {
    if (!isValid()) {
      return false;
    }
    _userListModel.add(_addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (_addingUser.name == null || _addingUser.name!.isEmpty) {
      return false;
    }
    if (_addingUser.email == null || _addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
