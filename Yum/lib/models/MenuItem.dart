import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class Food {
  String id;
  String name;
  String category;
  String image;
  List subIngredients;
  Timestamp created;
  Timestamp updated;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    subIngredients = data['subIngredients'];
    created = data['created'];
    updated = data['updated'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'subIngredients': subIngredients,
      'created': created,
      'updated': updated
    };
  }
}
