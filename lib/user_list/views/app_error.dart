import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, this.errortxt}) : super(key: key);
  final String? errortxt;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        errortxt.toString(),
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
