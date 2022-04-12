import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/widgets/default_app_bar.dart';

import 'documents_page_content.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

Future<List<DocumentsItem>> fetchDocuments(http.Client client) async {
  Map<String, String> headers = {
    "Authentication":
        "bas:2d2ad2177579d9904c074d0267258885f12f024419c072fc9faed21d9ffcb7d0",
    "Usertype": "tenant",
    "Date": "2019-12-17T14:14:24.500Z",
  };
  final response = await client.get(
      Uri.parse('https://basapptest.omniboxx.nl/rest/document'),
      headers: headers);

  // compute function to run parseEmail in a separate isolate
  return compute(parseDocuments, response.body);
}

// convert response body into a List<email_item>.
List<DocumentsItem> parseDocuments(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<DocumentsItem>((json) => DocumentsItem.fromJson(json))
      .toList();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: defaultAppBar('Documenten'),
        backgroundColor: Colors.grey.shade900,
        body: FutureBuilder<List<DocumentsItem>>(
          future: fetchDocuments(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return DocumentsList(items: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
}
