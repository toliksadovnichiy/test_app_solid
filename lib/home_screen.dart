import 'dart:math';
import 'package:flutter/material.dart';

import 'package:test_app/color_range_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _backgroundColor = Colors.white;
  List<Color> _colorList = [];
  int _startColorRange = 0;
  int _endColorRange = 0;

  @override
  void initState() {
    _colorList = _generateColorList();
    _endColorRange = _colorList.length-1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _generateRandomColorInRange(_startColorRange, _endColorRange);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: _backgroundColor,
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Hey there',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                alignment: Alignment.bottomCenter,
                child: ColorRangeSlider(
                  onRangeChanged: (RangeValues values) {
                    setState(() {
                      _startColorRange = values.start.toInt();
                      _endColorRange = values.end.toInt();
                    });
                  },
                  colorList: _colorList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _generateRandomColorInRange(int start, int end) {
    setState(() {
      _backgroundColor = start != end
          ? _colorList[start + Random().nextInt(end - start)]
          : _colorList[start];
    });
  }

  List<Color> _generateColorList() {
    final List<Color> colorList = [];

    for (double h = 0.0; h < 360.0; h += 0.5) {
      colorList.add(HSLColor.fromAHSL(1.0, h, 1.0, 0.5).toColor());
    }

    return colorList;
  }
}
