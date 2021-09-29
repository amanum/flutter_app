import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/style/label.dart';

class Developers extends StatelessWidget {
  final data = [
    {
      'name': 'Kuralbaev Temirlan',
      'git': 'https://gitlab.com/Kuralbaev',
      'phone': '+7 708 199 4155',
      'email': 'kuralbaevtemirlan@gmasil.com'
    },
    {
      'name': 'Amanzhol Umurzakov',
      'git': 'https://gitlab.com/Amanum',
      'phone': '+7 708 548 2936',
      'email': 'umurzakov.amanzhol@gmail.com'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TitleBack('', () {
            Navigator.of(context).pop(true);
          }),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Developers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15,),
                for (var dev in data)
                  Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              dev['name'] ?? '',
                              style: LabelStyle.blackBold(),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  size: 16,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  dev['phone'] ?? '',
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  size: 16,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  dev['email'] ?? '',
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.settings_ethernet,
                                  size: 16,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  dev['git'] ?? '',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                Text(
                  'Designer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Azamat Abdrashev',
                      style: LabelStyle.blackBold(),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 16,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '+7 771 265 1985',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          size: 16,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'azamat@abdrashev.com',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.settings_ethernet,
                          size: 16,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'abdrashev.com',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
