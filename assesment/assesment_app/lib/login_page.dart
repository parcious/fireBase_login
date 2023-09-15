import 'package:assesment_app/HomePage.dart';
import 'package:assesment_app/bloc/bloc/authentication_bloc.dart';
import 'package:assesment_app/bloc/bloc/authentication_event.dart';
import 'package:assesment_app/bloc/bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginEvent) {
            // Navigate to the home screen or perform any other action
          }
        },
        builder: (context, state) {
          if (state is AuthInitialState) {
            return _buildLoginForm(
                context, emailController, passwordController);
          } else if (state is AuthLoginEvent) {
            return _buildLoadingIndicator();
          } else {
            return _buildLoginForm(
                context, emailController, passwordController);
          }
        },
      ),
    );
  }

  Widget _buildLoginForm(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 14.0),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context
                    .read<AuthBloc>()
                    .add(AuthLoginEvent(email: email, password: password));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, '/registration');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
