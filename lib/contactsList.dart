import 'package:flutter/material.dart';

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

class ListViewContacts extends StatelessWidget {
  const ListViewContacts({Key? key}) : super(key: key);

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
            ' جهات الاتصال ',
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

            // // Create a ListView widget with the list of ImageData objects
            // ListView.separated(
            //     itemCount:
            //         imageDataList.length, // Set the number of items in the list
            //     separatorBuilder: (BuildContext context, int index) =>
            //         const Divider(), // Add a divider between each item in the list
            //     itemBuilder: (BuildContext context, int index) {
            //       final imageData = imageDataList[
            //           index]; // Get the ImageData object at the current index
            //       return ListTile(
            //         leading: Image.asset(imageData
            //             .imagePath), // Display the image on the left side of the ListTile
            //         title: Text(imageData
            //             .name), // Display the name as the title of the ListTile
            //         subtitle: Text(imageData
            //             .description), // Display the description as the subtitle of the ListTile
            //       );
            //     }));
            ListView(
          children: [
            ListTile(
              leading: Text('دعوة'),
              title: Text('لينا الدميجي', textDirection: TextDirection.rtl),
              subtitle: Text('966551190202+', textDirection: TextDirection.rtl),
              trailing: CircleAvatar(backgroundImage: AssetImage('assetName')),

              dense: false,
              onTap: (() {}),
              enabled: false,
              //isThreeLine: true,
            ),
            ListTile(
              leading: Icon(Icons.navigate_before),
              title: Text('نورة عبدالله', textDirection: TextDirection.rtl),
              subtitle: Text('966555555555+', textDirection: TextDirection.rtl),
              trailing: CircleAvatar(backgroundImage: AssetImage('assetName')),

              dense: false,
              onTap: (() {}),

              //isThreeLine: true,
            ),
            ListTile(
              leading: Icon(Icons.navigate_before),
              title: Text('محمد عبدالعزيز', textDirection: TextDirection.rtl),
              subtitle: Text('966555555555+', textDirection: TextDirection.rtl),
              trailing: CircleAvatar(backgroundImage: AssetImage('assetName')),

              dense: false,
              onTap: (() {}),

              //isThreeLine: true,
            ),
            //navigate_next
          ],
        ));
  }
}
