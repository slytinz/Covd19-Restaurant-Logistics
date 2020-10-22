import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.orange, // navigation bar color
    statusBarColor: Colors.orange, // status bar color
  ));
  runApp(MyApp());
}

var bannerItems = [
  "Burger Jam",
  "Jooshi",
  "I Never Fries",
  "Rice! Rice! Rice!"
];
var bannerImgs = [
  "images/burger1.jpg",
  "images/sushi1.jpg",
  "images/fries1.jpg",
  "images/friedrice1.jpg"
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YUM',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

// This widget is the home page of the application. It is stateful, meaning
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    // Returns a list of items from the JSON file containing data
    Future<List<Widget>> createList() async {
      List<Widget> item = new List<Widget>();
      // Grab data from JSON into string
      String data =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(data);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + " [ " + item + " ] ";
        });

        item.add(Padding(
          padding: EdgeInsets.all(2.0),
          // Container for Restaurant list
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  // Adds a Box Shadow on the Restaurant List
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            // End of the box shadow on Restaurant List
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Changes the border radius of the Restaurant List
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  // Displays images for Restaurant List
                  child: Image.asset(
                    object["placeImage"],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                // Printing our the Restaurant List Strings
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      // Restaurant Name
                      Text(object["placeName"], style: TextStyle(fontSize: 20)),
                      // Restaurant Type
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(
                          finalString,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                          maxLines: 1,
                        ),
                      ),

                      // Restaurant Min Order
                      Text(
                        "Minimum Order: ${object["minOrder"]}",
                        style: TextStyle(fontSize: 12.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
              // End of the box radius and image placement for Restaurant List
            ),
          ),
        ));
      });
      return item;
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  // Navigation Bar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Menu Icon Button
                      IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      // Application Title on NavBar
                      Text(
                        "YUM",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 50,
                            fontFamily: "Permanent Marker"),
                      ),
                      // Person Icon Button
                      IconButton(icon: Icon(Icons.person), onPressed: () {})
                    ],
                  ),
                ),
                BannerWidget(),
                Container(
                  child: FutureBuilder(
                      initialData: <Widget>[Text("")],
                      future: createList(),
                      builder: (context, snapshot) {
                        // Inserts padding for Restaurant List
                        if (snapshot.hasData) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListView(
                              primary: false,
                              shrinkWrap: true,
                              children: snapshot.data,
                            ),
                          );
                        }
                        //If not it will show a circle awaiting for data to load
                        else {
                          return CircularProgressIndicator();
                        }
                      }),
                ),
              ],
              // End of the Navigation Bar Code
            ),
          ),
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Manipulate which page is visible in a PageView
    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    // Creating an array for the hardcoded banners
    List<Widget> banner = new List<Widget>();

    // Looping through current Banner Items and placing it within our Banner Widget Array
    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // Places a Box shadow around the Banner images
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.pink[200],
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        spreadRadius: 1.0),
                  ],
                ),
              ),
              // End of Box Shadow

              // Displays the Banner Images
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(bannerImgs[i], fit: BoxFit.cover),
              ),
              // End of Displaying Images

              // Tinting the Banner Images
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black]),
                ),
              ),
              // End of Tinting

              // Diplay Banner Image Title
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[i],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      "Check-In now!",
                      style: TextStyle(fontSize: 15.0, color: Colors.white54),
                    )
                  ],
                ),
                // End of Banner Image Title display
              )
            ],
          ),
        ),
      );
      // Pushes view of Banner Items into the Banner Widget array
      banner.add(bannerView);
    }

    return Container(
      height: screenWidth / 1.8,
      width: screenWidth * 3,
      // Scrollable List
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banner,
      ),
    );
  }
}
