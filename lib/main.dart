import 'package:flutter/material.dart';
import 'package:get_data_api/user_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

import 'user_list/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
