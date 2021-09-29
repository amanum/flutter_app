import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_pick/core/constants/enums.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';

class NavigatorBarWidget extends StatefulWidget {
  final int index;
  final bool border;

  NavigatorBarWidget({required this.index, this.border = false});

  @override
  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<NavigatorBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: widget.border ? 0.2 : 0,
            color: widget.border ? Color(0xff99A3B0) : Colors.transparent,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget().navIcon('assets/images/icons/search.svg', () {
            Navigator.pushReplacementNamed(context, AppRouter.home,
                arguments: UserType.employee);
          }, active: widget.index == 1),
          ButtonWidget().navIcon('assets/images/icons/chat.svg', () {
            Navigator.pushReplacementNamed(context, AppRouter.allChats);
          }, active: widget.index == 2),
          ButtonWidget().navIcon('assets/images/icons/profile.svg', () {
            Navigator.pushReplacementNamed(context, AppRouter.userProfile);
          }, active: widget.index == 3)
        ],
      ),
    );
  }
}
