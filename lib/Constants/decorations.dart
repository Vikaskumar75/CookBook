import 'package:flutter/material.dart';

import '../Constants/textStyles.dart';

InputDecoration kSearchInputDecoration(BuildContext context) {
  return InputDecoration(
    hintText: 'Recipe, Cuisine',
    hintStyle: kSearchTextFieldStyle,
    contentPadding: EdgeInsets.all(0.0),
    fillColor: Colors.grey[250],
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
        )),
    prefixIcon: Icon(
      Icons.search,
      color: Theme.of(context).primaryColor,
    ),
  );
}
