import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../utils/functions.dart';
import '../login_screen/login_screen.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold), softWrap: true, textAlign: TextAlign.center),
      content: const Text('Are you sure, you want to log out?', softWrap: true, textAlign: TextAlign.center),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(LogoutRequested());
            newPage(LoginScreen(), context);
            print('User confirmed logout');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User confirmed logout')),
            );
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
            print('User cancelled logout');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User cancelled logout')),
            );
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
