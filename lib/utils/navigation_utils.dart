import 'package:flutter/material.dart';
import 'package:get_data_api/user_list/views/add_user_screen.dart';
import 'package:get_data_api/user_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
  );
}

void openAddUserScreen(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AddUserScreen()));
}
