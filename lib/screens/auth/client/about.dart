import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/auth/client/about_next_step.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/input.dart';

class AboutClientRegis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<AboutClientRegis> {
  @override
  Widget build(BuildContext context) {
    String _date = '';
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(2),
              Expanded(
                child: ListView(
                  children: [
                    TitleBack(Strings.personalInfo, () {
                      Navigator.of(context).pop(true);
                    }),
                    SizedBox(height: 25),
                    Column(children: [
                      InputWidget().text(Strings.yourName),
                      SizedBox(height: 25),
                      InputWidget().text(
                        Strings.email,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 25),
                      InputWidget().text(
                        Strings.phoneNumber,
                        type: TextInputType.number,
                        placeholder: '+7(ххх)ххх-хх-хх',
                      ),
                      SizedBox(height: 25),
                      InputWidget().date(
                        context,
                        Strings.dateOfBirth,
                            (date) {
                          setState(() {
                            _date = date.toString().split(' ').first;
                          });
                        },
                        date: _date,
                      ),
                      SizedBox(height: 25),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonWidget().fixedRed(Strings.next, () {
        Navigator.pushNamed(
          context,
          AppRouter.signUpEmployeeInfoMore,
        );
      }),
    );
  }
}
