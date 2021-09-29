import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/enums.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/home/home.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/divider.dart';
import 'package:quick_pick/utilities/widgets/file_picker.dart';
import 'package:quick_pick/utilities/widgets/input.dart';

class CompleteInformation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<CompleteInformation> {
  List _selectList = [1, 2];
  var _selectVacancy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(4),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 80),
                  children: [
                    TitleBack(Strings.addInfo, () {
                      Navigator.of(context).pop(true);
                    }),
                    SizedBox(height: 25),
                    for (var _data in _selectList)
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.vacancyCategory,
                                    style: LabelStyle.input(size: 12),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Официант',
                                    style: LabelStyle.red(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            InputWidget().text(Strings.vacancyName),
                            SizedBox(height: 25),
                            InputWidget().text(Strings.moreAboutVacancy),
                            SizedBox(height: 25),
                            InputWidget().text(
                              '${Strings.salary}:',
                              type: TextInputType.number,
                            ),
                            _selectVacancy == _data
                                ? Column(
                                    children: [
                                      SizedBox(height: 25),
                                      InputWidget().text(
                                        '${Strings.duties}:',
                                        type: TextInputType.number,
                                      ),
                                      SizedBox(height: 25),
                                      InputWidget().text(
                                        '${Strings.requirements}:',
                                        type: TextInputType.number,
                                      ),
                                      SizedBox(height: 25),
                                      InputWidget().text(
                                        '${Strings.conditions}:',
                                        type: TextInputType.number,
                                      ),
                                      SizedBox(height: 25),
                                      FilePickerWidget(
                                        single: true,
                                        label: Strings.photoForVacancy,
                                      )
                                    ],
                                  )
                                : Container(),
                            Container(
                              height: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    _selectVacancy =
                                        _selectVacancy == _data ? 0 : _data;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    ' ${_selectVacancy == _data ? '-' : '+'} ${Strings.extendedDescription}',
                                    style: LabelStyle.blue(size: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            DividerWidget.divider(height: 7.0),
                          ],
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonWidget().fixedRed(Strings.postVacancies, () {
        Navigator.pushNamed(
          context,
          AppRouter.home,
          arguments: UserType.employer,
        );
      }),
    );
  }
}
