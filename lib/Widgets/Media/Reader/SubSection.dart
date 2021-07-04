import 'package:flutter/material.dart';

class SubSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: 30,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 30, width: 30),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    color: Colors.black,
                    height: 30,
                    width: 30,
                    child: Center(
                        child: Text("4",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Emporia")))),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        "The Schedule shall set forth the long title of a Bill and a summary of its contents and the respective dates on which each Bill was passed by each house of the National Assembly; and subject to the provisions of this section,when signed by the Clerk of the National Assembly, the certificate shall be conclusive for all purposes, and if a Billin  the  Schedule  is  one  to  which  section   54(5)  of  55(4)  of  the  Constitution  of  the  Federal  Republic  of  Nigeriaapplies, the Schedule shall, in addition, be endorsed with the prescribed certificate of the Speaker of the Houseof Representatives in respect of that Bill.",
                        style: TextStyle(
                            height: 1.4,
                            fontSize: 13,
                            letterSpacing: 0.5,
                            color: Colors.white,
                            fontFamily: "Blanco"),
                      )),
                ))
              ])
            ])));
  }
}

//ther are links to the constitution..be sure to make themhyperlinks so that they can be opened
//in a modal perhaps...using reader.precise...
