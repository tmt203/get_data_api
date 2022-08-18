import 'package:flutter/material.dart';
import 'package:get_data_api/user_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User Screen"),
        actions: [
          IconButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              bool userAdded = await usersViewModel.addUser();
              if (!userAdded) {
                return;
              }
              navigator.pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Name",
              ),
              onChanged: (value) async {
                usersViewModel.addingUser.name = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              onChanged: (value) async {
                usersViewModel.addingUser.email = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
