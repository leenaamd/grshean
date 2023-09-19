import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int currentPageIndex = 0;
  Card topArea() => Card(
        margin: EdgeInsets.all(10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(76, 121, 74, 1),
                  Color.fromRGBO(76, 121, 74, 1)
                ])),
            padding: EdgeInsets.all(5.0),
            // color: Color(0xFF015FFF),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                      onPressed: () {},
                    ),
                    Text("محفظتي",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.transparent,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(r"  95,000 ريال ",
                        style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  ),
                ),
                SizedBox(height: 35.0),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: AppDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFFFFFFF),
          foregroundColor: Colors.black87,
          centerTitle: true,
          // title: Text(
          //   ' محفظتي ',
          // ),
          leading: //Icon(Icons.more_vert)
              Text(''),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          // elevation: 15,
        ),
        body: buildScrollableContainer(),
      ),
    );
  }

  Container accountItems(
          String item, String charge, String dateString, String type,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(item, style: TextStyle(fontSize: 16.0)),
                Text(charge, style: TextStyle(fontSize: 16.0))
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dateString,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                Text(type, style: TextStyle(color: Colors.grey, fontSize: 14.0))
              ],
            ),
          ],
        ),
      );
  Widget buildScrollableContainer() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            topArea(),
            // SizedBox(
            //   height: 40.0,
            //   child: Icon(
            //     Icons.refresh,
            //     size: 35.0,
            //     color: Color(0xFF015FFF),
            //   ),
            // ),
            displayAccoutList(),
          ],
        ),
      ),
    );
  }

  displayAccoutList() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          accountItems(r"+ 1,000 ريال", "جمعية ادخار", "", "28-04-16",
              oddColour: const Color(0xFFF7F7F9)),
          accountItems(r"+ 5,000 ريال", "جمعية سفر", "", "26-04-16"),
          accountItems(r"- 6,000 ريال", "جمعية عقار", "", "20-04-16",
              oddColour: const Color(0xFFF7F7F9)),
          accountItems(r"- 1,000 ريال", "جمعية ادخار", "", "28-01-16"),
          accountItems(r"+ 1,000 ريال", "جمعية ادخار", "", "28-01-16",
              oddColour: const Color(0xFFF7F7F9)),
        ],
      ),
    );
  }
}
