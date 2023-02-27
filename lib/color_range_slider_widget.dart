import 'package:flutter/material.dart';

class ColorRangeSlider extends StatefulWidget {
  final Function(RangeValues values) onRangeChanged;

  const ColorRangeSlider({Key? key, required this.onRangeChanged})
      : super(key: key);

  @override
  State<ColorRangeSlider> createState() => _ColorRangeSliderState();
}

class _ColorRangeSliderState extends State<ColorRangeSlider> {
  RangeValues _currentRangeValues =
      RangeValues(0.0, (Colors.primaries.length - 1).toDouble());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 17, right: 17),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.black12, ...Colors.primaries, Colors.black12],
        )
      ),
      child: SliderTheme(
        data: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: RangeSlider(
          max: (Colors.primaries.length - 1).toDouble(),
          min: 0.0,
          values: _currentRangeValues,
          divisions: Colors.primaries.length - 1,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          activeColor: Colors.white,
          inactiveColor: Colors.white12,
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
