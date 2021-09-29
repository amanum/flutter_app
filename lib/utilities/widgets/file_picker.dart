import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';

class FilePickerWidget extends StatefulWidget {
  final bool single;
  final String label;

  FilePickerWidget(
      {this.single = false, this.label = '',});

  @override
  _PageWidget createState() => _PageWidget();
}

class _PageWidget extends State<FilePickerWidget> {
  List<File> _list = [];

  _uploader({bool isImage = false}) async {
    if(isImage) {
      if(widget.single) {
        final XFile? result = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (result != null) {
          File _f = File(result.path.toString());
          setState(() {
            _list.add(_f);
          });
        }
      } else {
        final List<XFile>? result = await ImagePicker().pickMultiImage();
        if (result != null) {
          List<File> newFileList = [];
          for(XFile file in result) {
            newFileList.add(File(file.path));
          }
          setState(() {
            _list = [..._list, ...newFileList];
          });
        }
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File _f = File(result.files.single.path.toString());
        setState(() {
          _list.add(_f);
        });
      }
    }
  }

  _removeImage(File img) {
    setState(() {
      _list = _list.where((File i) => i.path != img.path).toList();
    });
  }

  Widget _imgCard(File file, {int id = 0}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.file(
            File(file.path),
            width: double.infinity,
            height: 96,
            fit: BoxFit.cover,
          ),
        ),
        id != 0 && !widget.single
            ? Positioned(
                left: -7,
                top: -7,
                child: new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color(0xffEF303B),
                  ),
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      id.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container(),
        Positioned(
          right: -10,
          top: -10,
          child: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icons/remove.png"),
                fit: BoxFit.contain,
              ),
            ),
            width: 25,
            height: 25,
            child: MaterialButton(onPressed: () {
              _removeImage(file);
            }),
          ),
        ),
      ],
    );
  }

  Widget _addImage() {
    return Container(
      height: 100,
      padding: EdgeInsets.all(1),
      decoration: DottedDecoration(
        shape: Shape.box,
        color: Color(0xffD1D1D1),
        dash: <int>[5],
      ),
      child: Container(
        color: Color(0xffEAEAEA),
        width: double.infinity,
        height: 100,
        child: MaterialButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      children: [
                        ButtonWidget().cleanWhite('Из галереи', () {
                          _uploader(isImage: true);
                          Navigator.of(context).pop();
                        }, width: MediaQuery.of(context).size.width / 2),
                        ButtonWidget().fixedRed('Из файлов', () {
                          _uploader();
                          Navigator.of(context).pop();
                        }, width: MediaQuery.of(context).size.width / 2)
                      ],
                    ),
                  );
                }
            );
            // _uploader();
          },
          child: Image.asset(
            'assets/images/icons/add.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ''
              ? Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffA7A7A7),
                    ),
                  ),
                )
              : Container(),
          Container(
            height: widget.single ? 150 : 280,
            width: double.infinity,
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 3,
              children: [
                ...List.generate(
                  _list.length,
                  (index) {
                    return _imgCard(_list[index], id: index + 1);
                  },
                ),
                (widget.single && _list.length >= 1) || _list.length >= 9 ? Container() : _addImage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
