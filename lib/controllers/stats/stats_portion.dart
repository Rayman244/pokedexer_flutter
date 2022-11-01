import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

import 'stats_widgets.dart';

/// this is the layout to all the [stats] like [baseExp] and hp, [locations] to get each pokemon.
statsPortion(List<Stats>? stats, int baseExp, locations) {
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
                          "HP",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Attack",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Defense",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Special-Attack",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Special-Defense",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Speed",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Base Exp",
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
              child: Column(
                children: statsNum(stats, baseExp),
              ),
            ),
            // const Spacer(),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Locations",
                    style: TextStyle(
                        // fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 70,
                      child: Text('Version:'),
                    ),
                    SizedBox(
                      width: 35,
                      child: Text("Level"),
                    ),
                    SizedBox(width: 40, child: Text("Odds")),
                    SizedBox(child: Text("Condition")),
                    Expanded(child: Center(child: Text("Method"))),
                  ],
                ),
              ),
              FutureBuilder(
                future: locations,
                builder: (BuildContext context, snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    children = locationsPortion(snapshot.data);
                  } else if (snapshot.hasError) {
                    children = const [Text("Error getting info")];
                    debugPrint("Error getting data");
                  } else {
                    children = [
                      const Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ];
                  }
                  return Column(
                    children: children,
                  );
                },
              ),
            ],
          ),
        ),
        // Future builder with location enteries
      ],
    ),
  );
}
