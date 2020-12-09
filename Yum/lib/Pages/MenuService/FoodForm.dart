import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:yum/constants.dart';
import 'package:yum/models/MenuItem.dart';

class FoodForm extends StatefulWidget {
  final bool update;

  FoodForm({@required this.update});

  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // To Edit sub Ingredients
  List _ingredients = [];
  //To Edit current food item
  Food _currFood;
  // To Display & Edit Food Item Image
  String _img;
  File _imgFile;
  // Controller for Ingredients
  TextEditingController ingredientController = new TextEditingController();

  // Initializing State
  @override
  void initState() {
    super.initState();
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context, listen: false);

    if (foodNotif.currentFood != null) {
      _currFood = foodNotif.currentFood;
      // Set sub-ingredients
      _ingredients.addAll(_currFood.subIngredients);
      _img = foodNotif.currentFood.image;
    } else {
      _currFood = Food();
      // Set sub-ingredients
    }
  }

  _addIngredient(String i) {
    if (i.isNotEmpty) {
      setState(
        () {
          _ingredients.add(i);
        },
      );
      ingredientController.clear();
    }
  }

  _getImage() async {
    File imgFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imgFile != null) {
      setState(
        () {
          _imgFile = imgFile;
        },
      );
    }
  }

  _saveMenuItem(context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    print('form saved');

    _currFood.subIngredients = _ingredients;

    uploadFoodAndImage(_currFood, widget.update, _imgFile, _onFoodUploaded);

    print("name: ${_currFood.name}");
    print("category: ${_currFood.category}");
    print("subingredients: ${_currFood.subIngredients.toString()}");
    print("_imageFile ${_imgFile.toString()}");
    print("_imageUrl $_img");
  }

  _onFoodUploaded(Food food) {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    foodNotifier.addFood(food);
    Navigator.pop(context);
  }

  // Edit the current name of food
  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'FOOD ITEM NAME:'),
      initialValue: _currFood.name,
      keyboardType: TextInputType.text,
      style: TextStyle(
          color: Color(0xFF171311), fontSize: 20, fontFamily: "Passion One"),
      validator: (String value) {
        if (value.isEmpty) {
          return 'NAME IS REQUIRED!';
        }

        if (value.length < 3 || value.length > 100) {
          return 'NAME MUST BE LESS THAN 100 CHARACTERS!';
        }
        return null;
      },
      onSaved: (String value) {
        _currFood.name = value;
      },
    );
  }

  // Edit the current category of food
  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'CATEGORY:'),
      initialValue: _currFood.category,
      keyboardType: TextInputType.text,
      style: TextStyle(
          color: Color(0xFF171311), fontSize: 20, fontFamily: "Passion One"),
      validator: (String value) {
        if (value.isEmpty) {
          return 'CATEGORY IS REQUIRED!';
        }

        if (value.length < 3 || value.length > 50) {
          return 'CATEGORY MUST BE LESS THAN 50 CHARACTERS!';
        }
        return null;
      },
      onSaved: (String value) {
        _currFood.category = value;
      },
    );
  }

  // Edit sub ingredients for the food
  Widget _buildIngredientField() {
    return SizedBox(
      width: 200,
      child: TextField(
          controller: ingredientController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'SUB-INGREDIENTS'),
          style: TextStyle(
              color: Color(0xFF171311),
              fontSize: 20,
              fontFamily: "Passion One")),
    );
  }

  // Displays the image
  _showImage() {
    if (_imgFile == null && _img == null) {
      return Text(
        'NO IMAGE FOUND',
        style: TextStyle(
            color: Color(0xFF171311), fontSize: 20, fontFamily: "Passion One"),
      );
    } else if (_imgFile != null) {
      print("showing image from file");
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imgFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FlatButton(
              color: Colors.white70,
              child: Text(
                'CHANGE IMAGE',
                style: TextStyle(
                  color: Color(0xFF171311),
                  fontSize: 20,
                  fontFamily: "Oswald",
                ),
              ),
              onPressed: () {
                _getImage();
              },
            ),
          ),
        ],
      );
    } else if (_img != null) {
      print('showing image from URL');
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _img,
            fit: BoxFit.cover,
            height: 250,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FlatButton(
              color: Colors.white70,
              child: Text(
                'CHANGE IMAGE',
                style: TextStyle(
                  color: Color(0xFF171311),
                  fontSize: 20,
                  fontFamily: "Oswald",
                ),
              ),
              onPressed: () {
                _getImage();
              },
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT MENU",
          style: TextStyle(
              color: Color(0xFF171311),
              fontSize: 30,
              fontFamily: "Permanent Marker"),
        ),
        backgroundColor: kPrimaryButtonColor,
        elevation: 0.0,
        actions: <Widget>[
          // action button
          // FlatButton.icon(
          //   icon: Icon(Icons.fastfood_outlined),
          //   label: Text('EDIT'),
          //   onPressed: () async {},
          // ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          // autovalidate: true,
          child: Column(
            children: <Widget>[
              _showImage(),
              SizedBox(
                height: 16,
              ),
              Text(
                widget.update ? "Edit Food" : "Create Food",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF171311),
                    fontSize: 30,
                    fontFamily: "Passion One"),
              ),
              SizedBox(
                height: 15,
              ),
              _imgFile == null && _img == null
                  ? ButtonTheme(
                      child: RaisedButton(
                        onPressed: () {
                          _getImage();
                        },
                        child: Text(
                          'Add Image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox(height: 5),
              _buildNameField(),
              _buildCategoryField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildIngredientField(),
                  ButtonTheme(
                    child: RaisedButton(
                      onPressed: () {
                        _addIngredient(ingredientController.text);
                      },
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: _ingredients
                    .map(
                      (ingredient) => Card(
                        color: kPrimaryColor,
                        child: Center(
                          child: Text(
                            ingredient,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kPrimaryIconColor,
                              fontSize: 15,
                              fontFamily: "Oswald",
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveMenuItem(context);
        },
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}
