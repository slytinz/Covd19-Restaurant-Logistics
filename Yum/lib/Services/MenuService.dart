import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
// import 'package:uuid/uuid.dart';
import 'package:yum/models/MenuItem.dart';

getFood(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('MenuItem').getDocuments();
  List<Food> _foodList = [];

  snapshot.documents.forEach((document) {
    Food food = Food.fromMap(document.data);
    _foodList.add(food);
  });

  foodNotifier.foodList = _foodList;
}

// Function that uploads food to the database/storage in firebase
uploadFood(Food food, bool update, File file) async {
  if (file != null) {
    print("uploading foot item");

    var fileExt = path.extension(file.path);
    print(fileExt);

    // Creates an id
    var uid = Uuid().v4();
    // Grabs the storage that contains the food images on firebase
    final StorageReference storage =
        FirebaseStorage.instance.ref().child('FoodItems/images/$uid$fileExt');
    // Placing the image into the storage
    await storage.putFile(file).onComplete.catchError((onError) {
      print(onError);
      return false;
    });

    String img = await storage.getDownloadURL();
    print('downloading url: $img');
    // Updates food image
    _uploadFood(food, update, imgURL: img);
  } else {
    print('image upload skipped!');
    // Does not update food image
    _uploadFood(food, update);
  }
}

_uploadFood(Food food, bool update, {String imgURL}) async {
  CollectionReference foodCollection =
      Firestore.instance.collection('MenuItem');

  if (imgURL != null) {
    food.image = imgURL;
  }

  if (update) {
    food.updated = Timestamp.now();
    await foodCollection.document(food.id).updateData(food.toMap());
    print('update food with id: ${food.id}');
  } else {
    food.created = Timestamp.now();
    DocumentReference docRef = await foodCollection.add(food.toMap());

    // Set ID when creating new food
    food.id = docRef.documentID;
    print('uploaded food successfully! ${food.toString()}');

    // Merge into db...adds new data
    await docRef.setData(food.toMap(), merge: true);
  }
}
