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
  int _startColorRange = 0;
  int _endColorRange = Colors.primaries.length;

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
          ? Colors.primaries[start +
              Random().nextInt(end - start)]
          : Colors.primaries[start];
    });
  }
}
