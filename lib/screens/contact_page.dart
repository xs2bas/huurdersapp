import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/widgets/default_app_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: defaultAppBar('Contact'),
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white10,
                child: const Text('Facturen worden geladen ..'),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 3,
                    child: Lottie.asset('assets/27920-thanks-message.json'),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ],
        ),
      );
}
