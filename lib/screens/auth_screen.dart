// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:netflix_auth/routes/routes.dart';
import 'package:netflix_auth/theme/app_theme.dart';
import 'package:netflix_auth/utils/validators.dart';
import 'package:netflix_auth/widgets/auth_form_container.dart';
import 'package:netflix_auth/widgets/netflix_background.dart';
import 'package:netflix_auth/widgets/netflix_logo.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() {
      isSignIn = !isSignIn;
      _formKey.currentState?.reset();
    });
  }

  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isSignIn ? 'Signing in...' : 'Creating account...'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );

      print(isSignIn ? 'Signing In' : 'Signing Up');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      if (!isSignIn) {
        print('Name: ${_nameController.text}');
        print('Confirm Password: ${_confirmPasswordController.text}');
      }
    }
  }

  void _navigateToResetPassword() {
    Navigator.pushNamed(context, AppRoutes.resetPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetflixBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //! Logo
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: NetflixLogo(),
                ),
              ),

              //! Auth Form
              AuthFormContainer(
                title: isSignIn ? 'Sign In' : 'Sign Up',
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name field
                      if (!isSignIn) ...[
                        TextFormField(
                          controller: _nameController,
                          decoration: AppTheme.inputDecoration('Name'),
                          validator: Validators.validateName,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 16),
                      ],

                      //! EMail field
                      TextFormField(
                        controller: _emailController,
                        decoration: AppTheme.inputDecoration(
                          'Email or phone number',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 16),

                      //! Password Field
                      TextFormField(
                        controller: _passwordController,
                        decoration: AppTheme.inputDecoration(
                          'Password',
                        ).copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator:
                            (value) => Validators.validatePassword(
                              value,
                              isNew: !isSignIn,
                            ),
                        textInputAction:
                            isSignIn
                                ? TextInputAction.done
                                : TextInputAction.next,
                      ),
                      const SizedBox(height: 16),

                      //! Confirm Password (only for Sign Up)
                      if (!isSignIn) ...[
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: AppTheme.inputDecoration(
                            'Confirm Password',
                          ).copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureConfirmPassword,
                          validator:
                              (value) => Validators.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              ),
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 16),
                      ],

                      //! SIGN IN/UP Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          child: Text(
                            isSignIn ? 'Sign In' : 'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      //! Remember me & Forgot Password (only for Sign In)
                      if (isSignIn) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            //! forget password
                            GestureDetector(
                              onTap: _navigateToResetPassword,
                              child: Text(
                                'Forgot password',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                      //! Toggle between Sign In & Sign Up
                      Row(
                        children: [
                          Text(
                            isSignIn
                                ? 'New to Netflix?'
                                : 'Already have an account?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: _toggleMode,
                            child: Text(
                              isSignIn ? 'Sign up now' : 'Sign in now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
