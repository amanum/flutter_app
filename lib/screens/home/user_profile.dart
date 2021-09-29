import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/utilities/components/navigator_bar.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/divider.dart';
import 'package:quick_pick/utilities/widgets/label_text_block.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Text(
                Strings.profile,
                style: TextStyle(
                  color: Color(0xff1B1116),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: _width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: _width * 0.4,
                    height: _width * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Color.fromRGBO(238, 238, 238, 1),
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I=',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ержан Директоров',
                    style: LabelStyle.black(size: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Нур-Султан',
                    style: LabelStyle.gray(),
                  ),
                ],
              ),
            ),
            DividerWidget.divider(height: 7.0),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.aboutMe,
                        style: LabelStyle.red(),
                      ),
                      GestureDetector(
                        child: Text(
                          Strings.edit,
                          style: LabelStyle.blue(size: 14),
                        ),
                        onTap: () {
                          setState(() {
                            isEdit = true;
                          });
                        },
                      ),
                    ],
                  ),
                  LabelTextBlock(
                    label: 'Обо мне',
                    text:
                        'Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание системы обучения кадров',
                    border: false,
                  ),
                  LabelTextBlock(
                    label: 'Email',
                    text: '800elo@gmail.com',
                  ),
                  LabelTextBlock(
                    label: 'Опыт работы',
                    text: '3 года в донерке',
                  ),
                  LabelTextBlock(
                    label: 'Номер телефона',
                    text: '+77777777777',
                  ),
                  LabelTextBlock(
                    label: 'Ищу работу',
                    text: 'Официант, водитель, грузчик',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigatorBarWidget(index: 3, border: true,),
    );
  }
}
