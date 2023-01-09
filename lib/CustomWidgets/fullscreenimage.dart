import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';

class FullImageScreen extends StatefulWidget {
  final String? imagePath, imageTag;
  final int? backgroundOpacity;

  const FullImageScreen(
      {Key? key,
      required this.imagePath,
      required this.imageTag,
      this.backgroundOpacity})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FullImageScreenState createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeOut);
    _animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(
          widget.backgroundOpacity == null ? 220 : widget.backgroundOpacity!),
      body: SafeArea(
        child: Stack(
          children: [
            ScaleTransition(
              scale: _animation!,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Image.memory(
                        base64Decode(widget.imagePath!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.imageTag!,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: MySize.size18,
                      color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  IconButton(
                    splashRadius: 1,
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: MySize.size44,
                    ),
                    onPressed: () {
                      _animationController!.reverse();
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
