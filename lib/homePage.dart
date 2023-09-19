import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grshean/createassembly.dart';
import 'package:grshean/loginPage.dart';
import 'package:grshean/main.dart';
import 'package:grshean/time.dart';
import 'Account.dart';
import 'app_drawer.dart';
import 'assemblyList.dart';
import 'contactsList.dart';
import 'joinAssembly.dart';
import 'transfer.dart';
//import 'package:contactus/contactus.dart';

class homePage extends StatefulWidget {
  const homePage({
    Key? key,
  }) : super(key: key);
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var items = ['انضم لجمعية', 'انشئ جمعية'];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFFFFFFF),
      //   foregroundColor: Colors.black87,
      //   centerTitle: true,
      //   title: Text(
      //     'مرحبًا',
      //   ),
      //   leading: //Icon(Icons.more_vert)
      //       Text(''),
      //   actions: [
      //     // IconButton(
      //     //   icon: const Icon(
      //     //     Icons.arrow_forward_ios,
      //     //   ),
      //     //   onPressed: () {
      //     //     // clearForm();
      //     //     Navigator.of(context).pop();
      //     //   },
      //     // ),
      //   ],
      //   // elevation: 15,
      // ),
      body: <Widget>[
        //Account
        Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.transparent,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(" 95,000 ريال",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24.0)),
                            ),
                          ),
                          SizedBox(height: 50.0),
                        ],
                      )),
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Account(),
                        ));
                    print('tap');
                  }),
                ),
                // GridView.builder(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, // number of items in each row
                //     mainAxisSpacing: 8.0, // spacing between rows
                //     crossAxisSpacing: 8.0, // spacing between columns
                //   ),
                //   padding: EdgeInsets.all(8.0), // padding around the grid
                //   itemCount: items.length, // total number of items
                //   itemBuilder: (context, index) {
                //     return Container(
                //       color: Colors.blue, // color of grid items
                //       child: Center(
                //         child: Text(
                //           items[index],
                //           style: TextStyle(fontSize: 18.0, color: Colors.white),
                //         ),
                //       ),
                //     );
                //   },
                // ),
                Expanded(
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 16),
                        children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color of grid items
                          child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Icon(Icons.contacts)),
                              Text(
                                'جهات الاتصال',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(24, 61, 26, 1)),
                              ),
                            ]),
                          ),
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListViewContacts(),
                              ));
                        }),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color of grid items
                          child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Icon(Icons.diversity_3)),
                              Text(
                                'جمعياتي ',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(24, 61, 26, 1)),
                              ),
                            ]),
                          ),
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListViewDemo(),
                              ));
                        }),
                      ),
                      // InkWell(
                      //   child: Container(
                      //     margin: EdgeInsets.all(10),
                      //     padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      //     decoration: const BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(25))),
                      //     // color of grid items
                      //     child: Center(
                      //       child: Column(children: [
                      //         Padding(
                      //             padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      //             child: Icon(Icons.payments)),
                      //         Text(
                      //           ' إضافة أموال',
                      //           style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Color.fromRGBO(24, 61, 26, 1)),
                      //         ),
                      //       ]),
                      //     ),
                      //   ),
                      //   onTap: (() {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => ListViewContacts(),
                      //         ));
                      //   }),
                      // ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color of grid items
                          child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Icon(Icons.payments)),
                              Text(
                                ' تحويل أموال',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(24, 61, 26, 1)),
                              ),
                            ]),
                          ),
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListViewMonay(),
                              ));
                        }),
                      ),
                    ])),
                // Padding(
                //     padding: EdgeInsets.only(
                //         left: 20, right: 20, bottom: 10, top: 20),
                //     child: Container(
                //         child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => loginPage(),
                //             ));
                //       },
                //       child: Text(
                //         'ابدأ الرحلة',
                //         style: TextStyle(fontSize: 17),
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //       ),
                //     ))),

                // Text('data'),
              ],
            )),
        //page 2
        // GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, // number of items in each row
        //     mainAxisSpacing: 8.0, // spacing between rows
        //     crossAxisSpacing: 8.0, // spacing between columns
        //   ),
        //   padding: EdgeInsets.all(8.0), // padding around the grid
        //   itemCount: items.length, // total number of items
        //   itemBuilder: (context, index) {
        //     return Container(
        //       decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.all(Radius.circular(25))),
        //       // color of grid items
        //       child: Center(
        //         child: Text(
        //           items[index],
        //           style: TextStyle(fontSize: 18.0, color: Colors.white),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Image.asset(
                      'assets/images/transparent.png',
                      height: 200,
                      width: 200,
                    )),
                Expanded(
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                      ),
                      children: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            // color of grid items
                            child: Image.asset(
                              'assets/images/create.jpg',
                              //scale: 0.1,
                            ),
                          ),
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => createAssembly(),
                                ));
                          }),
                        ),
                        InkWell(
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              // color of grid items
                              child: Image.asset(
                                'assets/images/join.jpg',
                              )),
                          onTap: (() {
                            //ListViewjoin
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListViewjoin(),
                                ));
                          }),
                        ),
                      ]),
                )
              ],
            )),
//page 3
        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(300, 10, 0, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                            title: '',
                          ),
                        ));
                  },
                  icon: Icon(Icons.logout)),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/transparent.png',
                  height: 200,
                  width: 200,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: RadialGradient(colors: [
                    Color.fromRGBO(76, 121, 74, 1),
                    Color.fromRGBO(76, 121, 74, 1)
                  ])),
              padding: EdgeInsets.all(5.0),
              // color: Color(0xFF015FFF),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/X-Logo.png',
                  height: 30,
                ),
                title: RichText(
                  text: TextSpan(
                      text: '@grshaen', recognizer: new TapGestureRecognizer()
                      // ..onTap = () {
                      //   launch(
                      //       'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                      // },
                      ),
                ),

                dense: false,

                //isThreeLine: true,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: RadialGradient(colors: [
                    Color.fromRGBO(76, 121, 74, 1),
                    Color.fromRGBO(76, 121, 74, 1)
                  ])),
              padding: EdgeInsets.all(5.0),
              // color: Color(0xFF015FFF),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/Instagram_logo_2016.svg.png',
                  height: 40,
                ),
                title: RichText(
                  text: TextSpan(
                      text: '@grshaen', recognizer: new TapGestureRecognizer()
                      // ..onTap = () {
                      //   launch(
                      //       'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                      // },
                      ),
                ),

                dense: false,

                //isThreeLine: true,
              ),
            ),
          ],
        )
        // Container(
        // color: Colors.green,
        //   alignment: Alignment.center,
        // child: ContactUs(
        //   cardColor: Colors.white,
        //   textColor: Colors.teal.shade900,
        //   logo: const AssetImage('assets/images/logo.jpg'),
        //   email: 'adoshi26.ad@gmail.com',
        //   companyName: 'قرشين',
        //   companyColor: Colors.teal.shade900,
        //   dividerThickness: 2,
        //   phoneNumber: '+917818044311',
        //   website: 'https://abhishekdoshi.godaddysites.com',
        //   githubUserName: 'AbhishekDoshi26',
        //   linkedinURL:
        //       'https://www.linkedin.com/in/abhishek-doshi-520983199/',
        //   //  tagLine: 'Flutter Developer',
        //   taglineColor: Colors.teal.shade100,
        //   twitterHandle: 'AbhishekDoshi26',
        //   instagram: '_abhishek_doshi',
        //   facebookHandle: '_abhishek_doshi',
        // ),
        //  ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        //  indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'حسابي',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'الجمعيات',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.contact_support),
            icon: Icon(Icons.contact_support_outlined),
            label: 'التواصل',
          ),
        ],
      ),
    );
  }
}
