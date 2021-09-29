import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/colors.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/models/employer.dart';
import 'package:quick_pick/models/chat_item.dart';
import 'package:quick_pick/utilities/components/navigator_bar.dart';
import 'package:quick_pick/utilities/style/label.dart';

class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _matchItemCard(Employer data) {
      return GestureDetector(
        onTap: () {
          print(data.name);
        },
        child: Container(
          width: 72,
          child: Column(
            children: [
              Container(
                width: 72,
                height: 72,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(data.logo!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: ColorVars.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.name!,
                style: LabelStyle.grayDarkLight(size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    }

    List<Employer> _employersList = [
      Employer(
        id: 1,
        name: 'ТОО',
        image: '',
        logo:
            'https://coffeeboom.kz/storage/app/uploads/public/5f8/fad/939/5f8fad9395aeb981089746.png',
      ),
      Employer(
        id: 2,
        name: 'Macdonalds',
        image: '',
        logo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2ITlqqH2T4Wg7nasX_hOa6suL1OQLmnKI915bO9S3f4VIcbXdR8MN8yTOl2O2EEG4Xos&usqp=CAU',
      ),
      Employer(
        id: 3,
        name: 'GoPro',
        image: '',
        logo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Yf_1tNMGfjTdsa4LJZA1Sogld5HqFjpYAg&usqp=CAU',
      ),
    ];

    List<MessageItem> _messages = [
      MessageItem(
        id: 1,
        message: 'Доброе утро, подойти к бару',
        sender: Employer.fromMap({
          'id': 1,
          'name': 'ТОО Dostar coffee',
          'image': '',
          'logo':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Yf_1tNMGfjTdsa4LJZA1Sogld5HqFjpYAg&usqp=CAU',
        }),
      ),
      MessageItem(
        id: 2,
        message:
            'Ай донт спик инглиш вери вел Ай донт спик инглиш вери вел Ай донт спик инглиш вери вел',
        sender: Employer.fromMap({
          'id': 2,
          'name': 'BMW',
          'image': '',
          'logo':
              'https://seeklogo.com/images/B/bmw-logo-248C3D90E6-seeklogo.com.png',
        }),
      ),
      MessageItem(
        id: 3,
        message: 'Я не согласен работать бесплатно',
        sender: Employer.fromMap({
          'id': 3,
          'name': 'North Face',
          'image': '',
          'logo':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsBL0rxy4g2qWOWg8K9O1q53jh6YyGT8JoGGLYiJmPihAXvmmNqOL76ZJny2WYDXFWAwU&usqp=CAU',
        }),
      ),
      MessageItem(
        id: 4,
        message: 'Завтра в 9:00 ждем вас! 😉',
        sender: Employer.fromMap({
          'id': 4,
          'name': 'Mona',
          'image': '',
          'logo':
              'https://1000logos.net/wp-content/uploads/2020/07/Dole-Logo.png',
        }),
      ),
      MessageItem(
        id: 1,
        message: 'Доброе утро, подойти к бару',
        sender: Employer.fromMap({
          'id': 1,
          'name': 'ТОО Dostar coffee',
          'image': '',
          'logo':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Yf_1tNMGfjTdsa4LJZA1Sogld5HqFjpYAg&usqp=CAU',
        }),
      ),
      MessageItem(
        id: 2,
        message: 'Ай донт спик инглиш вери вел',
        sender: Employer.fromMap({
          'id': 2,
          'name': 'BMW',
          'image': '',
          'logo':
              'https://seeklogo.com/images/B/bmw-logo-248C3D90E6-seeklogo.com.png',
        }),
      ),
      MessageItem(
        id: 3,
        message: 'Я не согласен работать бесплатно',
        sender: Employer.fromMap({
          'id': 3,
          'name': 'North Face',
          'image': '',
          'logo':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsBL0rxy4g2qWOWg8K9O1q53jh6YyGT8JoGGLYiJmPihAXvmmNqOL76ZJny2WYDXFWAwU&usqp=CAU',
        }),
      ),
      MessageItem(
        id: 4,
        message: 'Завтра в 9:00 ждем вас! 😉',
        sender: Employer.fromMap({
          'id': 4,
          'name': 'Mona',
          'image': '',
          'logo':
              'https://1000logos.net/wp-content/uploads/2020/07/Dole-Logo.png',
        }),
      ),
    ];

    Widget _chatWidget(MessageItem data) {
      print(data.sender?.image);
      return Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(data.sender?.logo ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Yf_1tNMGfjTdsa4LJZA1Sogld5HqFjpYAg&usqp=CAU'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.sender?.name ?? '',
                  style: LabelStyle.grayDarkBold(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  data.message ?? '',
                  style: LabelStyle.gray(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorVars.red,
            ),
            child: Center(
              child: Text(
                '2',
                style: LabelStyle.white(size: 14),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.newMatches,
                style: LabelStyle.red(),
              ),
              Container(
                height: 95,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _employersList.length,
                  separatorBuilder: (_, __) => SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return _matchItemCard(_employersList[index]);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                Strings.messages,
                style: LabelStyle.grayDark(size: 21),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(
                    height: 10,
                  ),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _chatWidget(_messages[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigatorBarWidget(
        index: 2,
        border: true,
      ),
    );
  }
}
