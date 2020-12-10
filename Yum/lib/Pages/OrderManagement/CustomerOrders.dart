import 'package:flutter/material.dart';
import 'package:yum/constants.dart';

class CustomerOrder extends StatefulWidget {
  @override
  _CustomerOrderState createState() => _CustomerOrderState();
}

class _CustomerOrderState extends State<CustomerOrder> {
  final List<String> _orderList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ORDERS',
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

  void _addOrderItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _orderList.add(title);
    });
    _textFieldController.clear();
  }

  // Generate list of orders
  Widget _buildOrderItem(String title) {
    return ListTile(title: Text(title));
  }

  // Generate a single order item
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add an order'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter order here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addOrderItem(_textFieldController.text);
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
    final List<Widget> _orderWidgets = <Widget>[];
    for (String title in _orderList) {
      _orderWidgets.add(_buildOrderItem(title));
    }
    return _orderWidgets;
  }
}
