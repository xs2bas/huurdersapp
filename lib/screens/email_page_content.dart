import 'package:flutter/material.dart';
import 'package:huurdersapp/widgets/email_detail.dart';
import 'dart:convert';

class EmailItem {
  final String date;
  final String subject;
  final String fromName;
  final String message;

  const EmailItem({
    required this.date,
    required this.subject,
    required this.fromName,
    required this.message,
  });

  factory EmailItem.fromJson(Map<String, dynamic> json) {
    return EmailItem(
      date: json['date'] as String,
      subject: json['subject'] as String,
      fromName: json['from_name'] as String,
      message: json['message'] as String,
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String strippedText = htmlText.replaceAll(exp, '');
  strippedText =
      strippedText.replaceAll(RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
  return strippedText;
}

class EmailList extends StatelessWidget {
  const EmailList({Key? key, required this.items}) : super(key: key);

  final List<EmailItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EmailDetail(
                  htmlString:
                      "<div style=\"text-align: left;\" class=\"reply\">\n\n\t<table>\n\t\t\n\t\t<tbody><tr>\n\t\t\t<td>Van:</td>\n\t\t\t<td>De heer Sven Hof <small>(svenhof10@hotmail.com)</small></td>\t\t\n\t\t</tr>\n\n\t\t<tr>\n\t\t\t<td>Aan:</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t<td>Service | Groningse Panden <small>(serviceAAAAAAAAgroningsepanden.nl)</small></td>\n\t\t</tr>\n\t\n\n\t\t\n\t\t<tr>\n\t\t\t<td>Verzonden:</td>\n\t\t\t<td>02-11-2021</td>\n\t\t</tr>\n\n\t\t<tr>\n\t\t\t<td>Onderwerp:</td>\n\t\t\t<td>Re: Studio 1e of 10e verdieping</td>\n\t\t</tr>\n\t</tbody></table>\n\n\t<p>Hoooi Veralyn,<br>\n<br>\nBij deze de bevestiging!<br>\n<br>\nDe gene die ik wilde aandragen en die zeker interesse heeft in de appgroep van de wachterij is:<br>\n<br>\nNina Westerbeek<br>\n06-29241960<br>\nNinac.westerbeekAAAAAAAAAAAoutlook.com<br>\n<br>\nNogmaals bedankt!<br>\n<br>\nMet vriendelijke groet,<br>\nSven Hof<br>\n<br>\nVerstuurd vanaf mijn iPhone<br>\n<br>\n<br>\n> Op 2 nov. 2021 om 10:14 heeft Service Groningse Panden het volgende geschreven:<br>\n<br>\n<br>\n<br>\n> ﻿</service@groningsepanden.nl></p><table>",
                  // "<div style=\"text-align: left;\" class=\"reply\">\n\n\t<table>\n\t\t\n\t\t<tbody><tr>\n\t\t\t<td>Van:</td>\n\t\t\t<td>De heer Sven Hof <small>(svenhof10@hotmail.com)</small></td>\t\t\n\t\t</tr>\n\n\t\t<tr>\n\t\t\t<td>Aan:</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t<td>Service | Groningse Panden <small>(service@groningsepanden.nl)</small></td>\n\t\t</tr>\n\t\n\n\t\t\n\t\t<tr>\n\t\t\t<td>Verzonden:</td>\n\t\t\t<td>02-11-2021</td>\n\t\t</tr>\n\n\t\t<tr>\n\t\t\t<td>Onderwerp:</td>\n\t\t\t<td>Re: Studio 1e of 10e verdieping</td>\n\t\t</tr>\n\t</tbody></table>\n\n\t<p>Hoi Veralyn,<br>\n<br>\nBij deze de bevestiging!<br>\n<br>\nDe gene die ik wilde aandragen en die zeker interesse heeft in de appgroep van de wachterij is:<br>\n<br>\nNina Westerbeek<br>\n06-29241960<br>\nNinac.westerbeek@outlook.com<br>\n<br>\nNogmaals bedankt!<br>\n<br>\nMet vriendelijke groet,<br>\nSven Hof<br>\n<br>\nVerstuurd vanaf mijn iPhone<br>\n<br>\n<br>\n> Op 2 nov. 2021 om 10:14 heeft Service Groningse Panden <service@groningsepanden.nl> het volgende geschreven:<br>\n<br>\n<br>\n<br>\n> ﻿</service@groningsepanden.nl></p><table><tbody><tr><td><table><tbody><tr><td><br>\n><br>\n> Hoi Sven,<br>\n<br>\nHierbij de bevestiging van wat vanmorgen telefonisch is besproken, je kunt per 1 december verhuizen naar studio 1-287.<br>\nIk ontvang graag nog even een bevestiging zodat we jouw huidige studio in de verhuur kunnen zetten per 1 december.<br>\n<br>\nHopende snel van je te horen.<br>\n<p>Met vriendelijke groet / Kind regards,<br>\n<br>\nVeralyn van Stein<br>\n<br>\nGroningse Panden Beheer B.V.<br>\nUbbo Emmiusstraat 30<br>\n9711 CC Groningen<br>\nservice@groningsepanden.nl</p><br>\n<img src=\"http://gpbeheer.omniboxx.nl//media/images/email_logo58458f569c03c.jpg\"></td></tr></tbody></table></td></tr></tbody></table><br>\n><br>\n> -------------------------<br>\n><table><tbody><tr><td>Van:</td><td>De heer Sven Hof (svenhof10@hotmail.com) </td></tr><tr><td>Aan:</td><td>Service | Groningse Panden (service@groningsepanden.nl) </td></tr><tr><td>Verzonden:</td><td>29-10-2021</td></tr><tr><td>Onderwerp:</td><td>Studio 1e of 10e verdieping</td></tr></tbody></table><p>Beste lezer,<br>\n<br>\nIk heb sinds maart een aantal keren gemaild met de vraag of ik kan verhuizen naar een studio op de uitbouw op de eerste etage, of naar een studio op de 10e verdieping. Ik heb nooit reactie gehad op deze e-mails dus vandaar dat ik het nog eens probeer.<br>\nIk ben in september 23 geworden, ook merk ik dat ik de standaard studio te klein vind worden. Om deze reden zou ik graag willen verhuizen naar een grotere studio op de eerste of op de 10e verdieping. Ik hoop dat u mij daarmee kunt helpen.<br>\nAls er een mogelijkheid is om te verhuizen, kan ik iemand aandragen die in mijn huidige studio wil.<br>\n<br>\nGraag hoor ik (telefonisch) van u,<br>\n<br>\nMet vriendelijke groet,<br>\nSven Hof (142)<br>\n06-22434841</p><img src=\"https://u562531.ct.sendgrid.net/wf/open?upn=GfFF-2BOc4DLNR9naev4BHTwjMks6pp9YxwbDmuVjvYeV0RjrwxEKilfw17UXa-2FaYzljqdeCJaMDk95rsJrBfXZ-2BYEaDR1c9OIQAGuyVQSv5oDtp9fdqCaDDJ14Ndxc6cCRa3wbDcHvGxM3gTCv2wL04CEmCJ3sBqTFR5UfvfhIiQO-2F1FjmUx1sE2O2tNPNrJEcPlsSzH3u-2FhfKbbMi5Z6c47dH-2FELxj90p0SPE4tlh-2BvBFS1G0aqbQMVcKHDZlgSZj6PKWH3-2FAiV1x2O5hJNCuEljZPutw0Xexho8-2BAr9Z25NkOvqu3Cij0-2FxiRiu5t2BEkfHimjkog9zzG8g1d70vg-3D-3D\"><p></p>\n</div>",
                  // htmlString: items[index].message,
                  title: items[index].subject,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      items[index].fromName,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Text(
                      items[index].date,
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  items[index].subject,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  removeAllHtmlTags(items[index].message),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              const Divider(
                color: Colors.white30,
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
