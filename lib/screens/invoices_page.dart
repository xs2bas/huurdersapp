import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/constants/app_data.dart';

import 'package:huurdersapp/widgets/loading_animation_widget.dart';
import 'package:huurdersapp/widgets/default_app_bar.dart';
import 'invoices_pages_content.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({Key? key}) : super(key: key);

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

Future<List<InvoiceItem>> fetchItems(http.Client client) async {
  Map<String, String> headers = {
    'Authentication': AppData.authentication,
    'Usertype': AppData.authenticationUserType,
    'Date': AppData.authenticationDate,
  };
  final response = await client.get(
      Uri.parse(AppData.protocol + AppData.baseUrl + '/rest/invoice'),
      headers: headers);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseItems, response.body);
}

// convert response body into a List<email_item>.w
List<InvoiceItem> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<InvoiceItem>((json) => InvoiceItem.fromJson(json)).toList();
}

class _InvoicesPageState extends State<InvoicesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: defaultAppBar('Facturen'),
        backgroundColor: Colors.grey.shade900,
        body: FutureBuilder<List<InvoiceItem>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return InvoiceList(items: snapshot.data!);
            } else {
              return Row(
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
                        assetName: 'loading_invoices.json',
                        text: 'Facturen worden geladen ...',
                      )), //Flexible
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(), //Container
                  ), //Flexible
                ], //<widget>[]
                mainAxisAlignment: MainAxisAlignment.center,
              );
            }
          },
        ),
      );
}
