import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryst/login/login.dart';
import 'package:tryst/sign_up/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/monochrome-logo.png',
                height: 120,
              ),
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LoginButton(),
                  const SizedBox(width: 12),
                  _SignUpButton(),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  SizedBox(
                      height: 1,
                      width: 100,
                      child: Container(
                        color: secondaryColor,
                        height: 1,
                      )),
                  Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                      width: 100,
                      height: 1,
                      child: Container(
                        color: secondaryColor,
                        height: 1,
                      ))
                ],
              ),
              const SizedBox(height: 12),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _GoogleLoginButton(),
                    const SizedBox(width: 12),
                    _AnonLoginButton()
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.email.displayError,
    );

    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'email',
        suffixIcon: Icon(Icons.email_outlined),
        helperText: '',
        errorText: displayError != null ? 'invalid email' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'password',
          helperText: '',
          errorText: displayError != null ? 'invalid password' : null,
          suffixIcon: Icon(Icons.lock)),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: const Color(0xFF0088FF),
          elevation: 6,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 32)),
      onPressed: isValid
          ? () => context.read<LoginCubit>().logInWithCredentials()
          : null,
      child: const Text('LOGIN'),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      key: const Key('loginForm_googleLogin_raisedButton'),
      style: IconButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: theme.colorScheme.surface,
          fixedSize: Size(40, 40),
          iconSize: 24),
      icon: Icon(FontAwesomeIcons.google,
          size: 18, color: theme.colorScheme.secondary),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _AnonLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      key: const Key('loginForm_anonLogin_raisedButton'),
      style: IconButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: theme.colorScheme.surface,
          fixedSize: Size(40, 40),
          iconSize: 24),
      icon: Icon(FontAwesomeIcons.lockOpen,
          color: theme.colorScheme.secondary, size: 18),
      onPressed: () => context.read<LoginCubit>().logInAsGuest(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 32)),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
