import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/logic/blocs/auth/auth_bloc.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/input.dart';
import 'package:formz/formz.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
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

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<AuthBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<AuthBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocListener<AuthBloc, AuthState>(
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  width: _width * 0.2,
                  child: Image.asset('assets/images/icons/logo.png'),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.authorization,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // InputWidget().authInput(placeholder: Strings.email),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return AuthValidationInput(
                                placeholder: Strings.email,
                                focusNode: _emailFocusNode,
                                error: state.email.invalid ? Strings.emailError : null,
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(EmailChanged(email: value));
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return AuthValidationInput(
                                placeholder: Strings.password,
                                email: false,
                                focusNode: _passwordFocusNode,
                                error: state.password.invalid ? Strings.passwordError : null,
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(PasswordChanged(password: value));
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ButtonWidget().blue(
                            Strings.signIn,
                                () {
                              Navigator.pushNamed(
                                context,
                                AppRouter.home,
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
                                text: '${Strings.noAccount} ',
                                style: LabelStyle.gray(),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: Strings.register,
                                    style: LabelStyle.blue(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRouter.signUp);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    incCounter(1);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    incCounter(2);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                bottom: imagePosition,
                left: 30,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/easter_egg.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: showSlider
                    ? Opacity(
                  opacity: 0,
                  child: Container(
                    height: 50,
                    child: Slider(
                      value: easterEggSlider,
                      min: 0,
                      activeColor: Colors.red,
                      inactiveColor: Colors.red,
                      max: 10,
                      divisions: 5,
                      onChanged: (double value) {
                        setState(() {
                          easterEggSlider = value;
                        });
                        if (value == 10.0) {
                          setState(() {
                            showSlider = false;
                          });
                          changeImagePosition();
                        }
                      },
                    ),
                  ),
                )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double easterEggSlider = 0.0;
  int counter = 0;
  int counter2 = 0;
  bool showSlider = false;
  double imagePosition = -200.0;
  bool ready = false;

  void incCounter(int i) {
    if (i == 1) {
      setState(() {
        counter++;
      });
    } else if (i == 2 && (counter == 2)) {
      setState(() {
        counter2++;
      });
    }
    if (counter == 2 && counter2 == 2)
      setState(() {
        showSlider = true;
      });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        counter = 0;
        counter2 = 0;
      });
    });
  }

  void changeImagePosition() {
    setState(() {
      imagePosition = -80.0;
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        imagePosition = 0.0;
        ready = true;
      });
    });
    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        easterEggSlider = 0.0;
        counter = 0;
        counter2 = 0;
        showSlider = false;
        imagePosition = -200.0;
        ready = false;
      });
      Navigator.pushNamed(
        context,
        AppRouter.developers,
      );
    });
  }
}
