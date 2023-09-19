import 'package:flutter/material.dart';

import 'assimblyItem.dart';

// Define a data class for the image data
class ImageData {
  final String imagePath;
  final String name;
  final String description;

  ImageData({
    required this.imagePath,
    required this.name,
    required this.description,
  });
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of ImageData objects
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/images/transparent.png",
        name: " جمعية المسافر ",
        description:
            "\n  غرض هذه الجمعية السفر والسياحة\n السعر: 5000 المدة: 30 شهر \n ",
      ),
      ImageData(
        imagePath: "assets/images/transparent.png",
        name: "ادخار 10,000 ",
        description:
            "\n  غرض هذه الجمعية الادخار\n السعر: 1,000 المدة: 22 شهر \n ",
      ),
      // add more images here...
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFFFFFFF),
          foregroundColor: Colors.black87,
          centerTitle: true,
          title: Text(
            ' جمعياتي ',
          ),
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
        body:

            // Create a ListView widget with the list of ImageData objects
            Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemCount: imageDataList
                        .length, // Set the number of items in the list
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(), // Add a divider between each item in the list
                    itemBuilder: (BuildContext context, int index) {
                      final imageData = imageDataList[
                          index]; // Get the ImageData object at the current index
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: ListTile(
                          onTap: (() {
                            //AssemblyItem
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AssemblyItem(),
                                ));
                          }),
                          // leading: Image.asset(imageData
                          //     .imagePath), // Display the image on the left side of the ListTile
                          title: Text(
                            imageData.name,
                            textDirection: TextDirection.rtl,
                          ), // Display the name as the title of the ListTile
                          subtitle: Text(imageData.description,
                              textDirection: TextDirection.rtl),
                          trailing: Image.asset(imageData
                              .imagePath), // Display the description as the subtitle of the ListTile
                        ),
                      );
                    })),
            Text(
              "الدعوات الجديدة",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.navigate_before),
              title: Text(' 10,000 ادخار', textDirection: TextDirection.rtl),
              subtitle: Text(
                  '\n  غرض هذه الجمعية الادخار\n السعر: 1,000 المدة: 20 شهر \n',
                  textDirection: TextDirection.rtl),
              trailing: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/transparent.png')),

              dense: false,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssemblyItem(),
                    ));
              }),

              //isThreeLine: true,
            ),
            Expanded(
              child: Container(
                //margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                    ),
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color of grid items
                          child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Icon(Icons.close)),
                              Text(
                                'رفض',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(24, 61, 26, 1)),
                              ),
                            ]),
                          ),
                        ),
                        onTap: (() {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => createAssembly(),
                          //     ));
                        }),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color of grid items
                          child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Icon(Icons.done)),
                              Text(
                                'قبول',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(24, 61, 26, 1)),
                              ),
                            ]),
                          ),
                        ),
                        onTap: (() {
                          //ListViewjoin
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ListViewjoin(),
                          //     ));
                        }),
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
