import 'package:flutter/material.dart';
import '../../models/extensions.dart';
import 'about_widgets.dart';

aboutPortion(height, weight, species, abilities, pdEnteries) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 40),
              child: SizedBox(
                width: 160,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Height",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Weight",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Species",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Abilities",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizedBox(
                width: 160,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("${dectoft(height)} ft"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("${heToLb(weight)} lb"),
                      ],
                    ),
                    FutureBuilder(
                      future: species,
                      builder: (BuildContext context, snapshot) {
                        List<Widget> children = [];
                        if (snapshot.hasData) {
                          children = speciesPortion(snapshot);
                        } else if (snapshot.hasError) {
                          children = const [Text("Error getting info")];
                          debugPrint("Error getting data");
                        }
                        return Row(
                          children: children,
                        );
                      },
                    ),
                    Row(
                      children: abilitiesPortion(abilities),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Pokedex Enteries",
                    style: TextStyle(
                        // fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              FutureBuilder(
                  future: pdEnteries,
                  builder: (BuildContext context, snapshot) {
                    List<Widget> children = [];
                    if (snapshot.hasData) {
                      children = pdEnteriesPortion(snapshot);
                    } else if (snapshot.hasError) {
                      children = const [Text("Error getting info")];
                      debugPrint("Error getting data");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: children,
                      ),
                    );
                  })
            ],
          ),
        ),
      ],
    ),
  );
}
