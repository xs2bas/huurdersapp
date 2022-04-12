import 'package:flutter/material.dart';

class DocumentsItem {
  final String fromDate;
  final String title;
  final String categoryName;

  DocumentsItem({
    required this.fromDate,
    required this.title,
    required this.categoryName,
  });

  factory DocumentsItem.fromJson(Map<String, dynamic> json) {
    return DocumentsItem(
      fromDate: json['from_date'] as String,
      title: json['title'] as String,
      categoryName: json['categoryname'] as String,
    );
  }
}

class DocumentsList extends StatelessWidget {
  const DocumentsList({Key? key, required this.items}) : super(key: key);

  final List<DocumentsItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    items[index].categoryName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 14),
                  ),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Text(
                    items[index].fromDate,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.white70),
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
              Text(
                items[index].title,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: const Divider(
                  color: Colors.white30,
                  height: 6,
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        );
      },
    );
  }
}
