import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryst/home/widgets/background.dart';
import 'package:tryst/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Stack(children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Padding(
                padding: const EdgeInsets.all(8),
                child: BlocProvider(
                  create: (_) =>
                      LoginCubit(context.read<AuthenticationRepository>()),
                  child: const LoginForm(),
                ),
              ),
            ],
          )
        ]));
  }
}
