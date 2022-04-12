import 'package:flutter/material.dart';
import 'package:huurdersapp/screens/personal_page.dart';
import 'package:huurdersapp/screens/report_page.dart';
import 'package:huurdersapp/screens/documents_page.dart';
import 'package:huurdersapp/screens/contact_page.dart';
import 'package:huurdersapp/screens/email_page.dart';
import 'package:huurdersapp/screens/invoices_page.dart';
import 'package:huurdersapp/screens/welcome_page.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/app_colors.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.yellow,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/logo_maison.png',
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white,
                    AppColors.yellow,
                  ],
                )),
              ),
              height: 40.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                buildMenuItem(
                  text: 'Persoonlijke gegevens',
                  icon: LineAwesomeIcons.identification_card,
                  onClicked: () => selectedItem(context, 0),
                ),
                buildMenuItem(
                  text: 'Facturen',
                  icon: Icons.receipt,
                  onClicked: () => selectedItem(context, 1),
                ),
                buildMenuItem(
                  text: 'Meldingen',
                  icon: LineAwesomeIcons.bell,
                  onClicked: () => selectedItem(context, 2),
                ),
                buildMenuItem(
                  text: 'Documenten',
                  icon: LineAwesomeIcons.archive,
                  onClicked: () => selectedItem(context, 3),
                ),
                buildMenuItem(
                  text: 'E-mail',
                  icon: Icons.inbox_outlined,
                  onClicked: () => selectedItem(context, 4),
                ),
                buildMenuItem(
                  text: 'Contact',
                  icon: LineAwesomeIcons.headset,
                  onClicked: () => selectedItem(context, 5),
                ),
                const Divider(
                  color: Colors.white,
                ),
                buildMenuItem(
                  text: 'Uitloggen',
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onClicked: () => selectedItem(context, 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      dense: true,
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      // personal
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PersonalPage(),
          ),
        );
        break;

      // invoices
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InvoicesPage(),
          ),
        );
        break;

      // report
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportPage(),
          ),
        );
        break;

      // documents
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DocumentsPage(),
          ),
        );
        break;

      // email
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EmailPage(),
          ),
        );
        break;

      // contact
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ContactPage(),
          ),
        );
        break;

      // log-out
      case 10:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
        );
        break;
    }
  }
}
