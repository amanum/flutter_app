import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:quick_pick/utilities/style/label.dart';

class InputWidget {
  text(label, {placeholder = '', type = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            label,
            style: LabelStyle.input(size: 12),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xffEAEAEA)),
              bottom: BorderSide(color: Color(0xffEAEAEA)),
            ),
          ),
          child: TextField(
            keyboardType: type,
            style: TextStyle(
              color: Color(0xff1B1116),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              hintStyle: TextStyle(color: Color(0xffA7A7A7), fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  date(context, label, callback, {String date = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            label,
            style: LabelStyle.input(size: 12),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20),
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xffEAEAEA)),
              bottom: BorderSide(color: Color(0xffEAEAEA)),
            ),
          ),
          child: TextButton(
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(2019, 1, 1),
                maxTime: DateTime(2023, 12, 30),
                onChanged: (date) {},
                onConfirm: (date) {
                  callback(date);
                },
                currentTime: DateTime.now(),
                locale: LocaleType.ru,
              );
            },
            child: Text(
              date,
              textAlign: TextAlign.start,
              style: LabelStyle.black(size: 16),
            ),
          ),
        )
      ],
    );
  }

  authInput({
    placeholder = '',
    type = TextInputType.text,
    bool email = true,
    bool showPassword = true,
    Function? showPasswordFunc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffEAEAEA)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    email
                        ? 'assets/images/icons/email.png'
                        : 'assets/images/icons/password.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: type,
                      style: TextStyle(
                        color: Color(0xff1B1116),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: placeholder,
                        hintStyle:
                            TextStyle(color: Color(0xffA7A7A7), fontSize: 16),
                      ),
                    ),
                  ),
                  if (!email)
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          child: GestureDetector(
                            onTap: () {
                              showPasswordFunc!();
                            },
                            child: Image.asset(
                                'assets/images/icons/show_password.png'),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AuthValidationInput extends StatefulWidget {
  final String placeholder;
  final TextInputType type;
  final bool email;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final String? error;

  const AuthValidationInput({
    Key? key,
    this.placeholder = '',
    this.type = TextInputType.text,
    this.email = true,
    required this.focusNode,
    required this.onChanged,
    this.error,
  }) : super(key: key);

  @override
  _AuthValidationInputState createState() => _AuthValidationInputState();
}

class _AuthValidationInputState extends State<AuthValidationInput> {
  bool hidePass = true;

  void togglePassVisible() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: widget.error == null ? Color(0xffEAEAEA) : Colors.red,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    widget.email
                        ? 'assets/images/icons/email.png'
                        : 'assets/images/icons/password.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: widget.type,
                      focusNode: widget.focusNode,
                      style: TextStyle(
                        color: Color(0xff1B1116),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      obscureText: widget.email ? false : hidePass,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.placeholder,
                        hintStyle:
                            TextStyle(color: Color(0xffA7A7A7), fontSize: 16),
                      ),
                      validator: (value) => null,
                      onChanged: widget.onChanged,
                    ),
                  ),
                  if (!widget.email)
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          child: GestureDetector(
                            onTap: togglePassVisible,
                            child: Image.asset(
                                'assets/images/icons/show_password.png'),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
        if(widget.error != null) Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          child: Text(widget.error!, style: LabelStyle.red(size: 14),),
        ),
      ],
    );
  }
}
