import 'package:flutter/material.dart';

import 'transferForm.dart';
import 'trasferFormNew.dart';

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

class ListViewMonay extends StatelessWidget {
  const ListViewMonay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of ImageData objects
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/images/test.webp",
        name: "Image 1",
        description: "This is the first image.",
      ),
      ImageData(
        imagePath: "assets/images/test.webp",
        name: "Image 2",
        description: "This is the second image.",
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
            ' التحويل  ',
          ),
          leading: //Icon(Icons.more_vert)
              Text(''),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
              onPressed: () {
                //clearForm();
                Navigator.of(context).pop();
              },
            ),
          ],
          // elevation: 15,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "المستفيدون المضافون",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            ListTile(
              // leading: Icon(Icons.navigate_before),
              title: Text(' التحويل لمستفيد جديد',
                  textDirection: TextDirection.rtl),
              // subtitle: Text('966551190202+', textDirection: TextDirection.rtl),
              trailing: Icon(Icons.add),

              dense: false,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => trasferFormNew(),
                    ));
              }),
            ),
            ListTile(
              leading: Icon(Icons.navigate_before),
              title: Text('لينا الدميجي', textDirection: TextDirection.rtl),
              subtitle: Text('966551190202+', textDirection: TextDirection.rtl),
              trailing: CircleAvatar(backgroundImage: AssetImage('assetName')),
              dense: false,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => trasferForm(),
                    ));
              }),
            ),
            ListTile(
              leading: Icon(Icons.navigate_before),
              title: Text('نورة عبدالله', textDirection: TextDirection.rtl),
              subtitle: Text('966555555+', textDirection: TextDirection.rtl),
              trailing: CircleAvatar(backgroundImage: AssetImage('assetName')),
              dense: false,
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => trasferForm(),
                    ));
              }),
            ),

            // ElevatedButton(
            //   onPressed: () {},
            //   child: Icon(Icons.add),
            //   style: ElevatedButton.styleFrom(
            //     shape: CircleBorder(),
            //     padding: EdgeInsets.all(24),
            //   ),
            // ),
          ],
        ));
  }
}
