import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/item_data.dart';
import 'model/item.dart';
import 'item_list.dart';

class Home extends StatelessWidget {
  // Controller for the text input field
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter an item',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final newItemText = _textEditingController.text;
              if (newItemText.isNotEmpty) {
                final itemData = Provider.of<ItemData>(context, listen: false);
                final newItem = Item(item: newItemText);
                itemData.addItem(newItem);
                _textEditingController.clear();
              }
            },
            child: Text('Add Item'),
          ),
          Expanded(
            child: ItemList(),
          ),
        ],
      ),
    );
  }
}
