import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/auth/company/about_vacancy.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/file_picker.dart';
import 'package:quick_pick/utilities/widgets/input.dart';

class AboutCompanyRegis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<AboutCompanyRegis> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(2),
              Expanded(
                child: ListView(
                  children: [
                    TitleBack(Strings.aboutCompany, () {
                      Navigator.of(context).pop(true);
                    }),
                    SizedBox(height: 25),
                    Column(children: [
                      InputWidget().text(Strings.companyName),
                      SizedBox(height: 25),
                      InputWidget()
                          .text(Strings.email, type: TextInputType.emailAddress),
                      SizedBox(height: 25),
                      InputWidget().text(Strings.phoneNumber,
                          type: TextInputType.number,
                          placeholder: '+7(ххх)ххх-хх-хх'),
                      SizedBox(height: 25),
                      InputWidget().text('${Strings.companyAddress} (${Strings.notNecessary})'),
                      SizedBox(height: 25),
                      FilePickerWidget(
                        single: true,
                        label: Strings.companyLogo,
                      )
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonWidget().fixedRed('Дальше', () {
        Navigator.pushNamed(
          context,
          AppRouter.signUpEmployerVacancy,
        );
      }),
    );
  }
}
