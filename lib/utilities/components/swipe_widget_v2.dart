import 'package:flutter/material.dart';
import 'package:quick_pick/models/card_user.dart';
import 'package:quick_pick/models/employer.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:tcard/tcard.dart';

import 'swipe_card.dart';

class SwipeWidgetV2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SwipeWidgetV2> {
  List<Widget> _swipeItems = [];
  TCardController _controller = TCardController();

  List<ICardUser> data = [
    ICardUser(
      img: 'assets/images/card.jpeg',
      name: 'Ержан Директоров 1',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card2.jpeg',
      name: 'Ержан Директоров 2',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card3.png',
      name: 'Ержан Директоров 3',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card4.jpeg',
      name: 'Ержан Директоров 4',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card5.jpeg',
      name: 'Ержан Директоров 5',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card6.jpeg',
      name: 'Ержан Директоров 6',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card7.jpeg',
      name: 'Ержан Директоров 7',
      type: 'Официант',
    ),
    ICardUser(
      img: 'assets/images/card8.jpeg',
      name: 'Ержан Директоров 8',
      type: 'Официант',
    ),
  ];

  initData() {
    for (ICardUser el in data) {
      _swipeItems.add(CardWidget.swipe(context, el));
    }
  }

  void _like() {
    Navigator.pushNamed(
      context,
      AppRouter.match,
      arguments: Employer(
        id: 1,
        name: 'asd',
        image:
            'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FmZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
        logo: 'https://www.tailorbrands.com/wp-content/uploads/2020/07/mcdonalds-logo.jpg'
      ),
    );
  }

  void _dislike() {
    print('dislike');
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          child: TCard(
            cards: _swipeItems,
            controller: _controller,
            onForward: (index, info) {
              print('+');
              if (info.direction == SwipDirection.Right) {
                _like();
              } else {
                _dislike();
              }
            },
            onBack: (index, info) {
              print('-');
            },
            onEnd: () {
              print('end');
            },
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget().icon('assets/images/icons/dislike.png', () {
              _controller.forward(direction: SwipDirection.Left);
            }),
            SizedBox(
              width: 25,
            ),
            ButtonWidget().icon('assets/images/icons/restart.png', () {
              setState(() {
                _swipeItems = [];
                initData();
              });
            }),
            SizedBox(
              width: 25,
            ),
            ButtonWidget().icon('assets/images/icons/like.png', () {
              _controller.forward(direction: SwipDirection.Right);
            }),
          ],
        ),
      ]),
    );
  }
}
