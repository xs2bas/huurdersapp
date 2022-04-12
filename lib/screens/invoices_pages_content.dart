import 'package:flutter/material.dart';
import 'package:huurdersapp/widgets/invoice_detail.dart';

class InvoiceItem {
  final String period;
  final String periodvalue;
  final String amount;
  final String payed;
  final String closed;
  final String hash;
  final String secret;

  const InvoiceItem({
    required this.period,
    required this.periodvalue,
    required this.amount,
    required this.payed,
    required this.closed,
    required this.hash,
    required this.secret,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      period: json['year'] as String,
      periodvalue: json['periodvalue'] as String,
      amount: json['amount'] as String,
      payed: json['payed'] as String,
      closed: json['closed'] as String,
      hash: json['hash'] as String,
      secret: json['secret'] as String,
    );
  }
}

String formattedAmount(amount) {
  return '€ ' + (int.parse(amount) / 100).toString();
}

class InvoiceList extends StatefulWidget {
  const InvoiceList({Key? key, required this.items}) : super(key: key);

  final List<InvoiceItem> items;
  static const List<String> month = [
    'Januari',
    'Februari',
    'Maart',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Augustus',
    'September',
    'Oktober',
    'November',
    'December'
  ];

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            String pageTitle = 'Factuur ' +
                InvoiceList
                    .month[int.parse(widget.items[index].periodvalue) - 1] +
                " " +
                widget.items[index].period;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InvoiceDetail(
                  title: pageTitle,
                  hash: widget.items[index].hash,
                  secret: widget.items[index].secret,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.check_sharp,
                        color: Colors.green,
                        size: 14.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      InvoiceList.month[
                              int.parse(widget.items[index].periodvalue) - 1] +
                          " " +
                          widget.items[index].period,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        formattedAmount(widget.items[index].amount),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 0.0,
                  right: 0.0,
                  bottom: 15,
                ),
                child: const Divider(
                  color: Colors.white30,
                  height: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
