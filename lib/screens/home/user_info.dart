import 'package:flutter/material.dart';
import 'package:quick_pick/models/card_user.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/divider.dart';
import 'package:quick_pick/utilities/widgets/label_text_block.dart';

class UserInfo extends StatefulWidget {
  final ICardUser superHero;

  UserInfo(this.superHero);

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy > 25) {
                  Navigator.of(context).pop(true);
                }
              },
              child: Hero(
                transitionOnUserGestures: true,
                tag: widget.superHero.img,
                child: Transform.scale(
                  scale: 1.0,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    widget.superHero.img,
                    height: 315,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: widget.superHero.name,
                              child: Text(widget.superHero.name,
                                  style: LabelStyle.blackBold(size: 18)),
                            ),
                            SizedBox(height: 5),
                            Text(widget.superHero.type,
                                style: LabelStyle.blackLight(size: 14)),
                            LabelTextBlock(
                              label: 'Коротко обо мне',
                              text:
                                  'Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание системы обучения кадров',
                            ),
                            LabelTextBlock(
                              label: 'Опыт работы',
                              text: '3 года работал официантом в Донерке',
                            ),
                            LabelTextBlock(
                              label: 'Образование',
                              text: 'Высшее донерное',
                            ),
                            LabelTextBlock(
                              label: 'Резюме',
                              text: 'asd',
                              link: 'http://www.africau.edu/images/default/sample.pdf',
                            ),
                            LabelTextBlock(
                              label: 'Диплом',
                              text: 'asd',
                              link: 'http://www.africau.edu/images/default/sample.pdf',
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
