import 'package:flutter/material.dart';
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/constants/app_colors.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Report'),
          centerTitle: true,
          backgroundColor: AppColors.yellow,
        ),
        backgroundColor: Colors.grey.shade900,
        body: const Text('Complaints')
      );
}
