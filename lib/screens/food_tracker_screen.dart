import 'package:flutter/material.dart';

class FoodTrackerScreen extends StatefulWidget {
  @override
  _FoodTrackerState createState() => _FoodTrackerState();
}

class _FoodTrackerState extends State<FoodTrackerScreen> {
  final List<String> _foodItems = [];

  final _foodController = TextEditingController();

  void _addFoodItem() {
    if (_foodController.text.isNotEmpty) {
      setState(() {
        _foodItems.add(_foodController.text);
        _foodController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Tracker')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _foodController,
                    decoration: InputDecoration(labelText: 'Enter food item'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addFoodItem,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_foodItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
