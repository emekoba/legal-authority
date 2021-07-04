import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Examination/Examination.dart';
import 'package:legal_authority/Widgets/Style/Styles.dart';

class BulletPoint extends StatelessWidget {
  final String point;

  BulletPoint({this.point});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(height: 0),
      InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                    builder: (context) =>
                        Examination(course: "Evidence", lesson: "Relevancy")));
          },
          child: Container(
              constraints: BoxConstraints(minHeight: 50),
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(10, 20, 15, 20),
              alignment: Alignment.centerLeft,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.circle,
                    size: 10, color: Theme.of(context).buttonColor),
                SizedBox(width: 10),
                Flexible(
                    child: Text(
                        "iquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskmiquafcvhjnskvmrp9qguaovjckzmvp9ruwosknlmpwubanovkmslqpguwvojskm$point",
                        style: Styles.bulletPoint))
              ])))
    ]);
  }
}
