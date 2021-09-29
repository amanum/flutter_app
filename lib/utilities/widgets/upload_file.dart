import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_pick/utilities/style/label.dart';

class UploadFileWidget extends StatefulWidget{
  final String label;

  const UploadFileWidget({Key? key, this.label = ''}) : super(key: key);@override

  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<UploadFileWidget>{
  File? _file;

  _uploader() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File _f = File(result.files.single.path.toString());
      setState(() {
        _file = _f;
      });
    } else {}
  }

  _removeImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: LabelStyle.input(size: 12),
          ),
          SizedBox(height: 5,),
          MaterialButton(
            color: Color(0xff4087DA),
            elevation: 0,
            onPressed: () {
              _uploader();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            height: 55,
            minWidth: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/icons/plus.svg'),
                SizedBox(width: 15,),
                Text(
                  'Загрузить диплом',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],),
          ),
          SizedBox(height: 10),

          if (_file != null) Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_file!.path.split('/').last, style: LabelStyle.black(size: 14),),
                  Container(
                    width: 15,
                    height: 15,
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        _removeImage();
                      },
                      child: Icon(Icons.close, size: 16, color: Colors.red,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,)
            ],
          )
        ],
      ),
    );
  }
}