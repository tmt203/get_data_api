import 'package:flutter/material.dart';
import 'package:get_data_api/components/app_loading.dart';
import 'package:get_data_api/user_list/models/user_model.dart';
import 'package:get_data_api/user_list/view_model/users_view_model.dart';
import 'package:get_data_api/user_list/views/app_error.dart';
import 'package:get_data_api/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(
        errortxt: usersViewModel.userError!.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return InkWell(
            onTap: () async {
              usersViewModel.setSelectedUserModel(userModel);
              openUserDetails(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.name.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  userModel.email.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo MVVM with Provider"),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUserScreen(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }
}
