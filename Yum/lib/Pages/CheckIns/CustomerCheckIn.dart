import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:time_formatter/time_formatter.dart';
import 'package:yum/constants.dart';
// import 'package:yum/constants.dart';

class CustomerCheckIn extends StatefulWidget {
  @override
  _CustomerCheckInState createState() => _CustomerCheckInState();
}

class _CustomerCheckInState extends State<CustomerCheckIn> {
  final List<String> _checkInList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHECK-INS',
          style: TextStyle(
              color: Color(0xFF171311),
              fontSize: 30,
              fontFamily: "Permanent Marker"),
        ),
        backgroundColor: kPrimaryButtonColor,
      ),
      body: ListView(
        children: _getItems(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _addCheckIn(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _checkInList.add(title);
    });
    _textFieldController.clear();
  }

  // Generate list of orders
  Widget _buildCheckIn(String title) {
    var time = DateTime.now();
    String formatted = time.toString();
    return ListTile(
      title: Text(title),
      trailing: Text(formatted),
    );
  }

  // Generate a single order item
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Customer Name'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter name here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addCheckIn(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _checkInWidgets = <Widget>[];
    for (String title in _checkInList) {
      _checkInWidgets.add(_buildCheckIn(title));
    }
    return _checkInWidgets;
  }
}
