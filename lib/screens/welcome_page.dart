import 'package:flutter/material.dart';
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/constants/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:huurdersapp/widgets/default_app_bar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: defaultAppBar('Welkom!'),
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                  'Log direct in op de persoonlijke pagina bij Maison Management. \n\nIn deze app kun je onder meer wijzigingen doorvoeren in je persoonlijke gegevens, facturen en betalingen inzien, storingen en klachten melden, documenten nalezen, email-berichten bekijken en onze contactgegevens vinden.'),
            ),
            Lottie.asset('assets/27920-thanks-message.json'),
          ],
        ),
      );
}
