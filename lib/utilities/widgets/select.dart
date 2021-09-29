import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:quick_pick/models/select.dart';
import 'package:quick_pick/utilities/style/label.dart';

// ignore: must_be_immutable
class SelectWidget extends StatefulWidget{
  String label;
  Function callBack;
  String placeholder;
  bool multiple;
  bool filter;
  final List<MultiSelectItem<ISelect>> data;

  SelectWidget({required this.data, required this.label, required this.callBack, required this.placeholder, this.multiple = false, this.filter = false});

  @override
  State<StatefulWidget> createState() => _SelectWidget();
}

class _SelectWidget extends State<SelectWidget>{
  String hint = '';

  void _showMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return  MultiSelectBottomSheet(
          items: widget.data,
          onConfirm: (values) {print(values[0]);},
          initialValue: [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  widget.label,
                  style:  widget.filter ? LabelStyle.black(size: 16) : LabelStyle.input(size: 12),
                ),
              ],
            )
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            margin: widget.filter ? EdgeInsets.only(left: 20, right: 20) : EdgeInsets.all(0),
            padding: EdgeInsets.only(left: 20, right: 10),
            decoration: widget.filter ? BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(width: 1, color: Color(0xffEAEAEA))
            ) : BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xffEAEAEA)),
                bottom: BorderSide(color: Color(0xffEAEAEA)),
              ),
            ),
            height: 55,
            child: widget.multiple ? MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: (){
                _showMultiSelect(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(hint, style: LabelStyle.black(),),
                  Icon(Icons.chevron_right, color: Color(0xffA7A7A7)),
                ],
              ),
            ) : DropdownButton(
                underline: Container(),
                icon: Icon(Icons.chevron_right, color: Color(0xffA7A7A7)),
                isExpanded: true,
                onChanged: (value) => {print(value)},
                hint: Text(widget.placeholder, overflow: TextOverflow.ellipsis, style: TextStyle(
                    color: Color(0xffA7A7A7)
                ),),
                items: widget.data.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child:  Text(value.value.title),
                  );
                }).toList()
            )


        )],
    );
  }
}