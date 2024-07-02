import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CMaker extends StatefulWidget {
  CMaker(
      {super.key,
      required this.child,
      this.height,
      this.boxShadow,
      this.border,
      this.BackGroundimage,
      this.margin,
      this.width,
      this.padding,
      this.alignment,
      this.color,
      this.gradient,
      this.circularRadius});
  Color? color;
  double? height;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  DecorationImage? BackGroundimage;
  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  BoxBorder? border;
  double? width;
  double? circularRadius;
  Widget child;
  @override
  State<CMaker> createState() => _CMakerState();
}
class _CMakerState extends State<CMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
          gradient: widget.gradient,
          image: widget.BackGroundimage,
          border: widget.border,
          color: widget.color,
          boxShadow: widget.boxShadow,
          borderRadius: BorderRadius.circular(
            widget.circularRadius ?? 0,
          )),
      height: widget.height,
      width: widget.width,
      child: widget.child,
    );
  }
}


class TMaker extends StatelessWidget {
  TMaker({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}


dynamic TStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}


class TFMaker extends StatefulWidget {
  TFMaker(
      {super.key,
      this.prefix,
      this.disabledBorderwidth,
      this.enabledBorderwidth,
      this.focusedBorderwidth,
      this.disabledBorderColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.suffix,
      this.focusedCircularRadius,
      this.disabledCircularRadius,
      this.enabledCircularRadius,
      this.hintText,
      this.hintStyle,
      this.label});
  Widget? prefix;
  Widget? suffix;
  String? hintText;
  Widget? label;
  TextStyle? hintStyle;
  double? enabledCircularRadius;
  double? disabledCircularRadius;
  double? focusedCircularRadius;
  double? enabledBorderwidth;
  double? disabledBorderwidth;
  double? focusedBorderwidth;
  Color? enabledBorderColor;
  Color? disabledBorderColor;
  Color? focusedBorderColor;
  @override
  State<TFMaker> createState() => _TFMakerState();
}
class _TFMakerState extends State<TFMaker> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefix: widget.prefix,
          suffix: widget.suffix,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          label: widget.label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.enabledBorderColor!,
                width: widget.enabledBorderwidth!),
            borderRadius:
                BorderRadius.circular(widget.enabledCircularRadius ?? 0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.disabledBorderColor!,
                width: widget.disabledBorderwidth!),
            borderRadius:
                BorderRadius.circular(widget.disabledCircularRadius ?? 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.focusedBorderColor!,
                width: widget.focusedBorderwidth!),
            borderRadius:
                BorderRadius.circular(widget.focusedCircularRadius ?? 0),
          )),
    );
  }
}


double PageHeight(BuildContext context) {
  List l = [2.2];
  final Sheigt = MediaQuery.of(context).size.height;
  l.add(Sheigt);
  return l[1];
}
double PageWidth(BuildContext context) {
  List l = [2.2];
  final Swidth = MediaQuery.of(context).size.width;
  l.add(Swidth);
  return l[1];
}


// status bar code , inset it in the runApp (SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);)


// to remove the red debug , insert it inside the materialApp (debugShowCheckedModeBanner: false,)


class SplashViewPage extends StatefulWidget {
  const SplashViewPage({super.key});
  @override
  State<SplashViewPage> createState() => _SplashViewPageState();
}
class _SplashViewPageState extends State<SplashViewPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fading;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    fading = Tween<double>(begin: 0, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {
          if (animationController!.isCompleted) {
            Timer(Duration(milliseconds: 300), () {
              Navigator.pushReplacementNamed(context, "LogInPage");
            });
          }
        });
      });
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 8, 125, 159),
              Color.fromARGB(255, 74, 193, 241)
            ])),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 10, child: Container()),
              Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                          flex: 8,
                          child: Opacity(
                            opacity: fading?.value,
                            child: Container(
                              child: Image.asset("images/Logo.png"),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                    ],
                  )),
              Expanded(flex: 10, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}


class GVBuilder extends StatefulWidget {
  GVBuilder(
      {super.key,
      required this.list,
      required this.child,
      required this.crossAxisCount,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      required this.onTap});
  List list;
  Widget child;
  int? crossAxisCount;
  double? mainAxisSpacing;
  double? crossAxisSpacing;
  void Function()? onTap;
  @override
  State<GVBuilder> createState() => _GVBuilderState();
}
class _GVBuilderState extends State<GVBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount ?? 1,
          mainAxisSpacing: widget.mainAxisSpacing ?? 0,
          crossAxisSpacing: widget.crossAxisSpacing ?? 0),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              setState(() {
                widget.onTap;
              });
            },
            child: widget.child);
      },
    );
  }
}


class DDButton extends StatefulWidget {
  DDButton({super.key, required this.values});
  // void Function()? onChosen;
  List values = [];
  var commonVar;
  @override
  State<DDButton> createState() => _DDButtonState();
}
class _DDButtonState extends State<DDButton> {
  @override
  Widget build(BuildContext context) {
    widget.commonVar = widget.values[0];
    List<DropdownMenuItem<Object?>>? t(List values) {
      List<DropdownMenuItem<Object?>>? list = [];
      for (int i = 0; i < values.length; i++) {
        list.add(
          DropdownMenuItem(
            child: Text(values[i].toString()),
            value: values[i],
          ),
        );
      }
      return list;
    }

    return DropdownButton(
        onChanged: (val) {
          setState(() {
            widget.commonVar = val;
          });
        },
        underline: Container(),
        value: widget.commonVar,
        items: t(widget.values));
  }
}


class RButton extends StatefulWidget {
  RButton({
    super.key,
    required this.list,
    required this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  });
  List list;
  int? crossAxisCount;
  double? mainAxisSpacing;
  double? crossAxisSpacing;
  @override
  State<RButton> createState() => _RButtonState();
}
var selected = "";
class _RButtonState extends State<RButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: GridView.builder(
        itemCount: widget.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount ?? 1,
            mainAxisSpacing: widget.mainAxisSpacing ?? 0,
            crossAxisSpacing: widget.crossAxisSpacing ?? 0),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(96, 216, 216, 216),
            ),
            child: RadioListTile(
                activeColor: Color.fromARGB(255, 74, 193, 241),
                title: Text(
                  widget.list[index],
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                value: widget.list[index],
                groupValue: selected,
                onChanged: (val) {
                  setState(() {
                    selected = val;
                  });
                }),
          );
        },
      ),
    );
  }
}
