import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../utils/validators.dart';
import '../widgets/app_brand.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _acceptedTerms = false;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the Terms & Conditions.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.dashboard, (route) => false);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Widget _passwordVisibilityIcon(bool obscure, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        child: Icon(
          obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          key: ValueKey(obscure),
          color: const Color(0xFF64748B),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEEF2FF), Color(0xFFF5F7FF)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: AppBrand()),
                  const SizedBox(height: 24),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xFF172554),
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Set up your profile and start building.',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 15),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    prefixIcon: Icons.person_outline_rounded,
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateName,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    label: 'Email Address',
                    hint: 'you@example.com',
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    prefixIcon: Icons.phone_outlined,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validatePhone,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    label: 'Password',
                    hint: 'Create a strong password',
                    prefixIcon: Icons.lock_outline_rounded,
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validatePassword,
                    suffixIcon: _passwordVisibilityIcon(
                      _obscurePassword,
                      () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    label: 'Confirm Password',
                    hint: 'Repeat your password',
                    prefixIcon: Icons.lock_outline_rounded,
                    controller: _confirmController,
                    obscureText: _obscureConfirm,
                    textInputAction: TextInputAction.done,
                    validator: (value) => Validators.validateConfirmPassword(
                      _passwordController.text,
                      value,
                    ),
                    suffixIcon: _passwordVisibilityIcon(
                      _obscureConfirm,
                      () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _acceptedTerms,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() => _acceptedTerms = value ?? false);
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'I agree to the Terms & Conditions',
                          style: TextStyle(color: Color(0xFF64748B)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'Create Account',
                    icon: Icons.person_add_alt_1_rounded,
                    loading: _loading,
                    onPressed: _submit,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Color(0xFF94A3B8)),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SocialLoginButton(
                    provider: 'Google',
                    onPressed: () => _showMessage(
                      'Google authentication is not configured in this demo.',
                    ),
                  ),
                  const SizedBox(height: 12),
                  SocialLoginButton(
                    provider: 'Apple',
                    onPressed: () => _showMessage(
                      'Apple authentication is not configured in this demo.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.signIn,
                          (route) => false,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
