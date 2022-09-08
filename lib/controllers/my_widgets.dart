import 'package:flutter/material.dart';

import '../models/Extensions.dart' as my_extensions;
import 'package:intro_to_widgets/models/poke_lists.dart';


/// gets a lost od all types and returns a list of widgets composed of he info of each type
///
/// the [typeList] is the list of all associated types with that pokemon
///
List<Widget> getTypes(List typeList) {
  List<Widget> pokeTypes = [];
  for (var type in typeList) {
    var typeName = my_extensions.capitalize(type["type"]['name']);
    pokeTypes.add(Padding(
      padding: const EdgeInsets.all(12.0),
      child: typeChecker(typeName),
    ));
  }
  return pokeTypes;
}


/// checks the [type] of a pokemon and return the color corrisponding to the type
Widget typeChecker(String type) {
  Color typeColor = Color(typeColors[type.toLowerCase()]!.toInt());

  return Text(
    type,
    style: TextStyle(backgroundColor: typeColor),
  );
}