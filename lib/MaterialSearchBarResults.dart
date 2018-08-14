import 'package:flutter/material.dart';
import 'MaterialSearchBarResultsItem.dart';
//adapted from https://hackernoon.com/flutter-iii-lists-and-items-6bfa7348ab1b

class MaterialSearchResults extends StatelessWidget {
  List<String> _items;
  Set<String> _selectedItems;
  State _state;

  MaterialSearchResults(this._items, this._selectedItems, this._state);

  /// Displays list of restaurant cards
  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor / 2.5;
    return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 20.0 * scaleFactor),
        children: _buildItemList(scaleFactor, context));
  }

  /// Creates a list of cards to be viewed on the Results Page
  List<MaterialSearchResultsItem> _buildItemList(
      double scaleFactor, BuildContext context) {
    List<MaterialSearchResultsItem> items = [];
    Icon _checkmark;
    for (String _item in _items) {
      _checkmark = null;
      if (this._selectedItems.contains(_item)) {
        print(_item + " was selected");
          _checkmark = new Icon(Icons.check, color: Colors.teal[400]);
      }
      items.add(MaterialSearchResultsItem(_item, scaleFactor, context, _selectedItems, _checkmark, _state));
    }
    return items;
  }
}