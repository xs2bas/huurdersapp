import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final String assetName;
  final String text;
  const LoadingAnimationWidget(
      {Key? key, required this.assetName, required this.text})
      : super(key: key);

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          flex: 3,
          child: Text(widget.text),
        ),
        Expanded(
          flex: 7,
          child: Lottie.asset('assets/' + widget.assetName),
        ),
      ],
    );
  }
}
