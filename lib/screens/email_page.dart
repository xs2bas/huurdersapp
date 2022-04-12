import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huurdersapp/widgets/loading_animation_widget.dart';
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/widgets/default_app_bar.dart';

import 'email_page_content.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

Future<List<EmailItem>> fetchEmail(http.Client client) async {
  Map<String, String> headers = {
    "Authentication":
        "bas:2d2ad2177579d9904c074d0267258885f12f024419c072fc9faed21d9ffcb7d0",
    "Usertype": "tenant",
    "Date": "2019-12-17T14:14:24.500Z",
  };
  final response = await client.get(
      Uri.parse('https://basapptest.omniboxx.nl/rest/email'),
      headers: headers);

  // Map<String, String> headers = {
  //   "Authentication":
  //       "Robin_Mekenkamp2021:a5c1e3d140ed7d956c229649425efea0caadbddc7aac13f955e86d14a2f1584b",
  //   "Usertype": "tenant",
  //   "Date": "2021-01-26T12:10:38.500Z",
  // };
  // final response = await client.get(
  //     Uri.parse('https://gpbeheer.omniboxx.nl/rest/email'),
  //     headers: headers);

  // compute function to run parseEmail in a separate isolate
  return compute(parseEmail, response.body);
}

// convert response body into a List<email_item>.
List<EmailItem> parseEmail(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<EmailItem>((json) => EmailItem.fromJson(json)).toList();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: defaultAppBar('E-mail'),
        backgroundColor: Colors.grey.shade900,
        body: FutureBuilder<List<EmailItem>>(
          future: fetchEmail(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return EmailList(items: snapshot.data!);
            } else {
              // return Column(
              //   children: [Text('sdfsdfsdfsfsdfsdfdd')],
              // );
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(), //Container
                  ), //Flexible
                  const Flexible(
                      flex: 12,
                      fit: FlexFit.tight,
                      child: LoadingAnimationWidget(
                        assetName: 'loading_email.json',
                        text: 'E-mails worden geladen ...',
                      )), //Flexible
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(), //Container
                  ), //Flexible
                ], //<widget>[]
              );
            }
          },
        ),
      );
}
