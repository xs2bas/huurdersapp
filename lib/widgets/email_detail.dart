import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:huurdersapp/widgets/default_app_bar_too.dart';
import 'package:huurdersapp/constants/app_colors.dart';

class EmailDetail extends StatefulWidget {
  final String htmlString;
  final String title;
  const EmailDetail({
    Key? key,
    required this.htmlString,
    required this.title,
  }) : super(key: key);

  @override
  State<EmailDetail> createState() => _EmailDetailState();
}

class _EmailDetailState extends State<EmailDetail> {
  @override
  Widget build(BuildContext context) {
    print('objectobjectobjectobjectobjectobjectobject' + widget.htmlString);
    return Scaffold(
      appBar: defaultAppBar(widget.title, context),
      body: SingleChildScrollView(
        child: Html(style: {
          'body': Style(
              color: Colors.white,
              backgroundColor: AppColors.background,
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(20))
        }, data: widget.htmlString),
      ),
    );
  }
}
