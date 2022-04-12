import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:huurdersapp/constants/app_data.dart';
import 'package:huurdersapp/widgets/default_app_bar_too.dart';

class InvoiceDetail extends StatefulWidget {
  final String title;
  final String hash;
  final String secret;
  const InvoiceDetail({
    Key? key,
    required this.title,
    required this.hash,
    required this.secret,
  }) : super(key: key);

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(widget.title, context),
      body: SfPdfViewer.network(
        AppData.protocol +
            AppData.baseUrl +
            '/invoice/export/hash/' +
            widget.hash +
            '/s/' +
            widget.secret +
            '/',
        key: _pdfViewerKey,
      ),
    );
  }
}
