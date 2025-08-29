import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/locator/locator.dart';
import 'package:instastyle/core/widgets/app_bar.dart';
import 'package:instastyle/feature/home/presentation/widgets/export_class.dart';
import 'package:instastyle/feature/home/presentation/widgets/select_buttons.dart';
import 'package:instastyle/feature/home/presentation/widgets/text_filled_style.dart';
import 'package:instastyle/feature/home/presentation/widgets/vertical_font_slider.dart';
import 'package:instastyle/feature/status/data/model/status_model.dart';
import 'package:instastyle/feature/status/presentation/bloc/status_event.dart';
// import 'package:permission_handler/permission_handler.dart';
import '../../../status/presentation/bloc/status_bloc.dart';
import '../widgets/footer_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle selectedStyle = const TextStyle(fontSize: 24);
  bool isProFont = false;
  Widget Function({required Widget child}) childStyle =
      ({required Widget child}) => Container(child: child);
  Widget Function(
      {required Widget child,
      required String text,
      required TextStyle textStyle}) dynamicTextStyle = (
          {required Widget child,
          required String text,
          required TextStyle textStyle}) =>
      Container(child: child);
  final TextEditingController _textController = TextEditingController();
  Color? selectColor;
  String text = 'اینجا بنویس...';
  double valueFontSize = 18;
  bool changeLineHeight = false;
  int isSelected = 0;
  late Export export;
  final GlobalKey _globalKey = GlobalKey();
  bool colorFlag = false;
  // Future<void> storagePermission() async {
  //   try {
  //     if (await Permission.photos.request().isGranted ||
  //         await Permission.mediaLibrary.request().isGranted ||
  //         await Permission.videos.request().isGranted ||
  //         await Permission.audio.request().isGranted) {
  //       // print('Permission granted');
  //     } else {
  //       // print('Permission denied');
  //     }
  //   } catch (e) {
  //     // print('Permission request failed: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // storagePermission();
    export = Export(context: context, text: text);
    BlocProvider.of<StatusBloc>(context)
        .add(StatusInitialEvent()); // TODO: implement initState>
    // _textController.text = text;
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: appBar(title: 'متن استوری', showUsage: true, actions: [
        ValueListenableBuilder(
          valueListenable: LocalData.isPaid,
          builder: (context, value, child) {
            print(value);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // iconAlignment: IconAlignment.end,
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(!value && isProFont
                      ? Colors.grey
                      : Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    export.captureAndCopy(_globalKey);
                  });
                },
                child: Text(
                  'کپی فونت',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            );
          },
        ),
      ]),
      body: Container(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Center(
              child: RepaintBoundary(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: dynamicTextStyle(
                    textStyle: selectedStyle.copyWith(
                      letterSpacing: 0.2,
                      fontSize: valueFontSize,
                      color: !colorFlag
                          ? Colors.transparent
                          : selectColor ??
                              Theme.of(context).colorScheme.onSurface,
                    ),
                    text: text,
                    child: childStyle(
                      child: StyledTextInput(
                          controller: _textController,
                          textStyle: selectedStyle.copyWith(
                            letterSpacing: 0.2,
                            fontSize: valueFontSize,
                            color: colorFlag
                                ? Colors.transparent
                                : selectColor ??
                                    Theme.of(context).colorScheme.onSurface,
                          ),
                          onTextChanged: (value) {
                            setState(() {
                              text = value;
                            });
                          }),
                    ),
                  ),
                ),
              ),
            ),
            VerticalFontSlider(
              initialSize: valueFontSize,
              onSizeChanged: (value) {
                setState(() {
                  valueFontSize = value;
                });
              },
            ),
            Positioned(
                bottom: 8,
                child: SelectButtons(
                  onSelect: isSelected,
                  isFontPro: (value) {
                    setState(() {
                      isProFont = value;
                    });
                  },
                  onWidgetSelected: (styleWidget) {
                    setState(() {
                      childStyle = styleWidget;
                    });
                    setState(() {
                      colorFlag = false;
                    });
                  },
                  onColorSelected: (value) {
                    setState(() {
                      selectColor = value;
                      // setState(() {
                      //   colorFlag = false;
                      // });
                    });
                  },
                  onStyleSelected: (style) {
                    setState(() {
                      selectedStyle = style;
                    });
                  },
                  onDynamicWidgetSelected: (value) {
                    setState(() {
                      dynamicTextStyle = value;
                    });
                    setState(() {
                      colorFlag = true;
                    });
                  },
                )),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        FooterButtons(
          onSelect: (value) {
            setState(() {
              isSelected = value;
            });
          },
        ),
      ],
    );
  }
}
