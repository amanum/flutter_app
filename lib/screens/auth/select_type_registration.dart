import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/auth/company/about.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';

class SelectTypeRegistration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<SelectTypeRegistration> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              regisProgress(1),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${Strings.me}...',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonWidget().red(Strings.employee, () {
                            Navigator.pushNamed(
                              context,
                              AppRouter.signUpEmployerCompany,
                            );
                          }),
                          SizedBox(
                            height: 15,
                          ),
                          ButtonWidget().white(Strings.lookingForJob, () {
                            Navigator.pushNamed(
                              context,
                              AppRouter.signUpEmployeeInfo,
                            );
                          }),
                        ],
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
                      top: 0,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
