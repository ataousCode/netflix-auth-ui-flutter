import 'package:flutter/material.dart';
import 'package:netflix_auth/theme/app_theme.dart';
import 'package:netflix_auth/utils/validators.dart';
import 'package:netflix_auth/widgets/auth_form_container.dart';
import 'package:netflix_auth/widgets/netflix_background.dart';
import 'package:netflix_auth/widgets/netflix_logo.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _resetSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    // Hide keyboard
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() {
        _resetSent = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetflixBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //! Netflix Logo
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: NetflixLogo(),
                ),
              ),

              //! Reset Password Form
              AuthFormContainer(
                title: 'Reset Password',
                child: _resetSent ? _buildSuccessMessage() : _buildResetForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter the email address associated with your account, and we'll send you an email with instructions to reset your password.",
            //textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 24),

          //! Email field
          TextFormField(
            controller: _emailController,
            decoration: AppTheme.inputDecoration('Email'),
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
            textInputAction: TextInputAction.done,
            autocorrect: false,
          ),
          SizedBox(height: 24),
          //!Reset pass btn
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: Text(
                'Send Reset Instructions',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          // Back btn
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '← Back to Sign In',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.green, size: 64),
        const SizedBox(height: 24),
        Text(
          'Email Sent!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'We\'ve sent reset instructions to:\n${_emailController.text}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          'Please check your inbox and follow the instructions to reset your password. Thank you.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Return to Sign In',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
