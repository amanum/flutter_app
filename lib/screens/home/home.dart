import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/models/select.dart';
import 'package:quick_pick/utilities/components/navigator_bar.dart';
import 'package:quick_pick/utilities/components/swipe_widget.dart';
import 'package:quick_pick/utilities/components/swipe_widget_v2.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/select.dart';
import 'package:quick_pick/utilities/widgets/slider_input.dart';

class MainPage extends StatefulWidget {
  final bool client;

  const MainPage({Key? key, this.client = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<MainPage> {
  bool sliderReady = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        sliderReady = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _openSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15),
                SelectWidget(
                  data: [
                    MultiSelectItem(
                        new ISelect(value: '1', title: 'Официант'), 'Официант'),
                    MultiSelectItem(
                        new ISelect(value: '2', title: 'Водитель'), 'Водитель'),
                    MultiSelectItem(
                        new ISelect(value: '3', title: 'Грузчик'), 'Грузчик')
                  ],
                  label: Strings.mainVacancy,
                  callBack: () {},
                  placeholder: '',
                  filter: true,
                ),
                SizedBox(
                  height: 20,
                ),
                SliderInput(label: Strings.searchRange, filter: true),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: Row(
                    children: [
                      ButtonWidget().cleanWhite(Strings.cancel, () {
                        Navigator.of(context).pop();
                      }, width: MediaQuery.of(context).size.width / 2),
                      ButtonWidget().fixedRed(Strings.accept, () {
                        Navigator.of(context).pop();
                      }, width: MediaQuery.of(context).size.width / 2)
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.client
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.vacancies,
                          style: TextStyle(
                            color: Color(0xff1B1116),
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => _openSheet(),
                            child: Image.asset('assets/images/icons/filter.png'),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      Strings.jobSeekers,
                      style: TextStyle(
                        color: Color(0xff1B1116),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Expanded(child: sliderReady ? SwipeWidgetV2() : Center(child: CupertinoActivityIndicator())),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigatorBarWidget(index: 1),
    );
  }
}
