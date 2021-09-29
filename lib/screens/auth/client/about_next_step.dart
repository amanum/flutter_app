import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/models/select.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/file_picker.dart';
import 'package:quick_pick/utilities/widgets/input.dart';
import 'package:quick_pick/utilities/widgets/select.dart';
import 'package:quick_pick/utilities/widgets/slider_input.dart';

class AboutClientNextStep extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<AboutClientNextStep> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(3),
              Expanded(
                child: ListView(
                  children: [
                    TitleBack(Strings.personalInfo, () {
                      Navigator.of(context).pop(true);
                    }),
                    Column(children: [
                      FilePickerWidget(),
                      SizedBox(height: 25),
                      SelectWidget(
                        data: [
                          MultiSelectItem(
                              new ISelect(value: '1', title: 'Официант'),
                              'Официант'),
                          MultiSelectItem(
                              new ISelect(value: '2', title: 'Водитель'),
                              'Водитель'),
                          MultiSelectItem(
                              new ISelect(value: '3', title: 'Грузчик'),
                              'Грузчик')
                        ],
                        label: Strings.whatVacancyAreYouLookingFor,
                        multiple: true,
                        callBack: (select) {
                          print(select);
                        },
                        placeholder: '',
                      ),
                      SizedBox(height: 25),
                      SliderInput(label: Strings.searchRange),
                      SizedBox(height: 25),
                      SelectWidget(
                        data: [
                          MultiSelectItem(
                              new ISelect(value: '1', title: 'Нур-Султан'),
                              'Нур-Султан'),
                          MultiSelectItem(
                              new ISelect(value: '2', title: 'Нур-Султан 1'),
                              'Нур-Султан 1')
                        ],
                        label: 'Город',
                        callBack: (select) {
                          print(select);
                        },
                        placeholder: '',
                      ),
                      SizedBox(height: 25),
                      InputWidget().text(Strings.aboutMe),
                      SizedBox(height: 25),
                      InputWidget().text(Strings.workExperience),
                      SizedBox(height: 25),
                      InputWidget().text(Strings.education),
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
          AppRouter.signUpEmployeeDocs,
        );
      }),
    );
  }
}
