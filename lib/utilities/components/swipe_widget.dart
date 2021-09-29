import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:quick_pick/models/card_user.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';

import 'swipe_card.dart';

class SwipeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<SwipeWidget> with TickerProviderStateMixin {

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

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Container(
      child: Column(
        children: [
          Expanded(
            child: TinderSwapCard(
              swipeUp: false,
              swipeDown: false,
              totalNum: data.length,
              orientation: AmassOrientation.bottom,
              maxWidth: MediaQuery.of(context).size.width * 0.85,
              maxHeight: MediaQuery.of(context).size.width * 0.99 + 300,
              minWidth: MediaQuery.of(context).size.width * 0.75,
              minHeight: MediaQuery.of(context).size.width * 0.99 + 100,
              cardBuilder: (context, index) =>
                  CardWidget.swipe(context, data[index]),
              cardController: controller = CardController(),
              swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                print('$orientation || $index');
              },
              animDuration: 400,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget().icon('assets/images/icons/like.png', () {
                controller.triggerLeft();
              }),
              SizedBox(
                width: 25,
              ),
              ButtonWidget().icon('assets/images/icons/restart.png', () {}),
              SizedBox(
                width: 25,
              ),
              ButtonWidget().icon('assets/images/icons/dislike.png', () {
                controller.triggerRight();
              }),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
