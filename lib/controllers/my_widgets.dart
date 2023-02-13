import 'package:flutter/material.dart';

import '../models/extensions.dart' as my_extensions;
import 'package:pokedexer_flutter/models/poke_lists.dart';

/// gets a lost od all types and returns a list of widgets composed of he info of each type
///
/// the [typeList] is the list of all associated types with that pokemon
///

Widget getTypes(List typeList) {
  List<Widget> pokeTypes = [];
  for (var type in typeList) {
    var typeName = my_extensions.capitalize(type["type"]['name']);
    pokeTypes.add(Padding(
      padding: const EdgeInsets.all(5.0),
      child: typeChecker(typeName),
    ));
  }
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: pokeTypes,
  );
}
// Widget getTypes(List typeList) {
//   List<Widget> pokeTypes = [const Spacer()];
//   for (var type in typeList) {
//     var typeName = my_extensions.capitalize(type["type"]['name']);
//     pokeTypes.add(Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: typeChecker(typeName),
//     ));
//   }
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: pokeTypes,
//   );
// }

/// checks the [type] of a pokemon and return the color corrisponding to the type
Widget typeChecker(String type) {
  Color typeColor = Color(typeColors[type.toLowerCase()]!.toInt());

  return Container(
    decoration: BoxDecoration(
      color: typeColor,
      border: Border.all(color: Colors.black),
      borderRadius: const BorderRadius.all(Radius.elliptical(12, 12)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        type,
        // style: TextStyle(
        //   // backgroundColor: typeColor,
        //   ),
      ),
    ),
  );
}
