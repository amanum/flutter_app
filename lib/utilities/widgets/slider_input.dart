import 'package:flutter/material.dart';
import 'package:quick_pick/utilities/style/label.dart';

class SliderInput extends StatefulWidget{
  final String label;
  final bool filter;

  const SliderInput({Key? key, required this.label, this.filter = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<SliderInput>{
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: widget.filter ? LabelStyle.black(size: 16) : LabelStyle.input(size: 12),
                ),
                Text(
                  '${_currentSliderValue.toInt()} м',
                  style: widget.filter ? LabelStyle.inputLight(size: 16) :  LabelStyle.blackLight(size: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Slider(
            value: _currentSliderValue,
            min: 0,
            activeColor: Color(0xffF00E3E),
            inactiveColor: Color(0xffEAEAEA),
            max: 100,
            divisions: 20,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}