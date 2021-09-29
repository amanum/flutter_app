import 'package:flutter/material.dart';
import 'package:quick_pick/utilities/style/label.dart';
import 'package:quick_pick/utilities/widgets/divider.dart';
import 'package:url_launcher/url_launcher.dart';

class LabelTextBlock extends StatelessWidget {
  final String label;
  final String text;
  final String? link;
  final bool border;

  const LabelTextBlock({
    Key? key,
    required this.label,
    required this.text,
    this.link,
    this.border = true,
  }) : super(key: key);

  void _launchLink() async {
    if (await canLaunch(link!)) {
      await launch(
        link!,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: border ? BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Color(0xfff2f2f2),
          ),
        ),
      ) : BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: LabelStyle.gray(size: 14)),
          SizedBox(height: 5),
          link == null
              ? Text(text, style: LabelStyle.black(size: 14))
              : GestureDetector(
                  onTap: () {
                    _launchLink();
                  },
                  child: Text(
                    link!.split('/').last,
                    style: LabelStyle.blue(size: 14),
                  ),
                ),
        ],
      ),
    );
  }
}
