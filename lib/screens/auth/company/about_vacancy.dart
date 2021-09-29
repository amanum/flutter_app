import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/models/select.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/auth/company/complete_information.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/file_picker.dart';
import 'package:quick_pick/utilities/widgets/select.dart';

class AboutVacancy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<AboutVacancy> {
  List _selectList = [1];

  @override
  Widget build(BuildContext context) {
    MultiSelectItem<ISelect> _data =
        MultiSelectItem(new ISelect(value: '1', title: 'title'), 'Label');

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(3),
              Expanded(
                child: ListView(
                  children: [
                    TitleBack(Strings.aboutVacancy, () {
                      Navigator.of(context).pop(true);
                    }),
                    Column(children: [
                      FilePickerWidget(),
                      SizedBox(height: 25),
                      for (int idx in _selectList)
                        Column(
                          children: [
                            SelectWidget(
                              data: [_data, _data, _data, _data, _data],
                              label: '${Strings.selectCategory} $idx',
                              callBack: () {},
                              placeholder: Strings.addVacancy,
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      SizedBox(height: 25),
                      ButtonWidget().blue('+ ${Strings.moreVacancy}', () {
                        setState(() {
                          _selectList.add(_selectList.length + 1);
                        });
                      }, width: 190)
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
          AppRouter.signUpEmployerAddInfo,
        );
      }),
    );
  }
}
