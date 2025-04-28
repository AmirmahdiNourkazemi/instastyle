import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/utils/preset_color_list.dart';

class ColorListView extends StatefulWidget {
  final ValueChanged<Color> colorSelected;
  const ColorListView({super.key, required this.colorSelected});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  Color _selectedColor = Colors.blue;
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Text(
            'انتخاب رنگ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              paletteType: PaletteType.hsvWithSaturation,
              onColorChanged: (color) {
                setState(() => _selectedColor = color);
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
              enableAlpha: false,
              displayThumbColor: true,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, Dimensions.buttonHeight))
              ),
              onPressed: (){
widget.colorSelected(_selectedColor);
                Navigator.of(context).pop();
            }, child:  const Text('انتخاب'))
           
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: presetColors.length + 1,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: _showColorPicker,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Icon(Icons.colorize, color: Colors.white),
              ),
            ),
          );
        } else {
          // Preset color items
          final color = presetColors[index - 1];
          return GestureDetector(
            onTap: () {
              setState(() => _selectedColor = color);
              widget.colorSelected(color);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedColor == color
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
