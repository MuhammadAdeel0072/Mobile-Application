import 'package:flutter/material.dart';

import '../models/user_data.dart';
import 'admin_page.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.account,
    required this.onAccountCreated,
    required this.onAuthenticated,
  });

  final LocalAccount? account;
  final ValueChanged<LocalAccount> onAccountCreated;
  final ValueChanged<LocalAccount> onAuthenticated;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim().toLowerCase();
    final password = _passwordController.text;
    LocalAccount? authenticatedAccount;

    for (final account in demoAccounts) {
      if (account.email == email && account.password == password) {
        authenticatedAccount = account;
        break;
      }
    }

    final registeredAccount = widget.account;
    if (authenticatedAccount == null &&
        registeredAccount != null &&
        registeredAccount.email == email &&
        registeredAccount.password == password) {
      authenticatedAccount = registeredAccount;
    }

    if (authenticatedAccount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect email or password.')),
      );

      return;
    }

    final account = authenticatedAccount;
    widget.onAuthenticated(account);

    if (account.role == AccountRole.admin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => AdminPage(account: account)),
        (_) => false,
      );
      return;
    }

    Navigator.pushNamed(
      context,
      '/profile',
      arguments: ProfileRouteArguments(userName: account.name),
    );
  }

  void _openSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio'), centerTitle: true),
      body: AuthLayout(
        title: 'Login',
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: validateEmail,
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),

                    // Error UI
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),

                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),

                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),

                    suffixIcon: IconButton(
                      tooltip: _hidePassword
                          ? 'Show password'
                          : 'Hide password',
                      icon: Icon(
                        _hidePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          TextButton(
            onPressed: _openSignUp,
            child: const Text("Don't have an account? Sign Up"),
          ),
        ],
      ),
    );
  }
}

// This layout is used by Login and Sign Up pages.
class AuthLayout extends StatelessWidget {
  const AuthLayout({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),

              const SizedBox(height: 24),

              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// Email validation
String? validateEmail(String? value) {
  final email = value?.trim() ?? '';

  final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  if (email.isEmpty) {
    return 'Please enter your email.';
  }

  if (!emailPattern.hasMatch(email)) {
    return 'Please enter a valid email.';
  }

  return null;
}
