import 'package:flutter/material.dart';
import 'package:quick_pick/models/card_user.dart';
import 'package:quick_pick/router/app_router.dart';

class CardWidget {
  static Widget swipe(context, ICardUser user) {
    return Hero(
      tag: user.img,
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          image: DecorationImage(
            image: AssetImage(user.img),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(31, 32, 65, 0.1),
              offset: new Offset(0, 10),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(31, 32, 65, 0.2),
                    offset: new Offset(0, 4),
                    blurRadius: 6,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          color: Color(0xff4A4A4A),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        user.type,
                        style: TextStyle(
                          color: Color(0xff9B9B9B),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.userInfo,
                          arguments: user
                        );
                      },
                      child: Image.asset('assets/images/icons/info.png'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
