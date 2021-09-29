import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/logic/blocs/sign_up/sign_up_bloc.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/input.dart';
import 'package:quick_pick/models/confirm_password.dart';
import 'package:formz/formz.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(PasswordUnfocused());
      }
    });
    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(ConfirmPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: _height,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.registration,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return AuthValidationInput(
                              placeholder: Strings.email,
                              focusNode: _emailFocusNode,
                              error: state.email.invalid ? Strings.emailError : null,
                              onChanged: (value) {
                                context.read<SignUpBloc>().add(EmailChanged(email: value));
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return AuthValidationInput(
                              placeholder: Strings.password,
                              email: false,
                              focusNode: _passwordFocusNode,
                              error: state.password.invalid ? Strings.passwordError : null,
                              onChanged: (value) {
                                context.read<SignUpBloc>().add(PasswordChanged(password: value));
                                context.read<SignUpBloc>().add(ConfirmPasswordChanged(confirmPassword: ''));
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          buildWhen: (previous, current) => previous.password != current.password ||
                              previous.confirmPassword != current.confirmPassword,
                          builder: (context, state) {
                            return AuthValidationInput(
                              placeholder: Strings.confirmPassword,
                              email: false,
                              focusNode: _confirmPasswordFocusNode,
                              error: state.confirmPassword.error?.name?? null,
                              onChanged: (value) {
                                print(state.confirmPassword.error?.name);
                                context.read<SignUpBloc>().add(ConfirmPasswordChanged(confirmPassword: value));
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonWidget().blue(
                          Strings.toRegister,
                          () {
                            Navigator.pushNamed(
                              context,
                              AppRouter.signUpSelectType,
                            );
                          },
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: '${Strings.gotAccount} ',
                              style: LabelStyle.gray(),
                              children: <TextSpan>[
                                TextSpan(
                                  text: Strings.signIn,
                                  style: LabelStyle.blue(),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                          context, AppRouter.auth);
                                    },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      width: _width * 0.2,
                      child: Image.asset('assets/images/icons/logo.png'),
                    ),
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
