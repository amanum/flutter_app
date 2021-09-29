import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/models/employer.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';

class Match extends StatelessWidget {
  final Employer? employer;

  const Match({Key? key, this.employer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(employer?.image ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: _height * 0.13,
              child: Column(
                children: [
                  Text(
                    Strings.congratulations,
                    style: LabelStyle.white(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Strings.companyWantsYou,
                    style: LabelStyle.whiteLight(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: _width,
                height: _width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 40,
                      child: Container(
                        width: _width * 0.35,
                        height: _width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I='),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 7, color: Colors.red),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        child: Image.asset('assets/images/icons/like.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 40,
                      child: Container(
                        width: _width * 0.35,
                        height: _width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(employer?.logo ?? ''),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 7, color: Colors.red),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 15,
              left: 15,
              child: ButtonWidget().whiteForChat('Написать в чат', (){
                Navigator.of(context).pop(true);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
