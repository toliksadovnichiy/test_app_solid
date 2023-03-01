import 'package:flutter/material.dart';

class ColorRangeSlider extends StatefulWidget {
  final Function(RangeValues values) onRangeChanged;
  final List<Color> colorList;

  const ColorRangeSlider(
      {Key? key, required this.onRangeChanged, required this.colorList})
      : super(key: key);

  @override
  State<ColorRangeSlider> createState() => _ColorRangeSliderState();
}

class _ColorRangeSliderState extends State<ColorRangeSlider> {
  RangeValues? _currentRangeValues;

  @override
  void initState() {
    _currentRangeValues =
        RangeValues(0.0, (widget.colorList.length - 1).toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 17, right: 17),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: widget.colorList,
        ),
      ),
      child: SliderTheme(
        data: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: RangeSlider(
          max: (widget.colorList.length - 1).toDouble(),
          min: 0.0,
          values: _currentRangeValues ?? const RangeValues(0.0, 1.0),
          divisions: widget.colorList.length - 1,
          activeColor: Colors.white,
          inactiveColor: Colors.white38,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
            widget.onRangeChanged(values);
          },
        ),
      ),
    );
  }
}
