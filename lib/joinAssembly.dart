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

class ListViewjoin extends StatelessWidget {
  const ListViewjoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of ImageData objects
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/images/transparent.png",
        name: "جمعية تويوتا",
        description:
            "\n غرض هذه الجمعية هو تجميع تمويل لشراء سيارة تويوتا\n السعر: 3000 المدة: 23 شهر \n",
      ),
      ImageData(
        imagePath: "assets/images/transparent.png",
        name: " شقق عقار",
        description:
            "\n  غرض هذه الجمعية شراء شقق عقار\n السعر: 10,000 المدة: 30 شهر \n ",
      ),
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
            "\n  غرض هذه الجمعية الادخار\n السعر: 1,000 المدة: 20 شهر \n ",
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
            'انضم لجمعية ',
          ),
          leading: IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: (() {}),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
              onPressed: () {
                // clearForm();
                Navigator.of(context).pop();
              },
            ),
          ],
          // elevation: 15,
        ),
        body:

            // Create a ListView widget with the list of ImageData objects
            ListView.separated(
                itemCount:
                    imageDataList.length, // Set the number of items in the list
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(), // Add a divider between each item in the list
                itemBuilder: (BuildContext context, int index) {
                  final imageData = imageDataList[
                      index]; // Get the ImageData object at the current index
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ListTile(
                      onTap: (() {
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
                }));
  }
}
