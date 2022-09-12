import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/controllers/evolutions/evolution_widgets.dart';

evolutionsPortion(evolutions) {
  return SingleChildScrollView(
    child: FutureBuilder(
                future: evolutions,
                builder: (BuildContext context, snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    children = evoTree(snapshot);
                  } else if (snapshot.hasError) {
                    children = const [Text("Error getting info")];
                    debugPrint(snapshot.error.toString());
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
  );
}
