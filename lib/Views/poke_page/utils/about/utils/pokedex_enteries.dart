import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon-specie.dart';

class PokedexEnteries extends StatelessWidget {
  const PokedexEnteries({super.key, this.flavorTextEnteries});
  final List<FlavorTextEntries>? flavorTextEnteries;

  @override
  Widget build(BuildContext context) {
    List<Widget> pdEnteries = [];
    if (flavorTextEnteries != null) {
      for (var entry in flavorTextEnteries!) {
        List<Widget> versions = [];
        if (entry.versions != null) {
          for (var version in entry.versions!) {
            versions.add(Text(capitalize(version)));
          }
        }
        pdEnteries.add(Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: SizedBox(
                  width: 110,
                  child: Column(
                    children: versions,
                  ),
                ),
              ),
              Expanded(child: Text(entry.flavorText ?? "N/A")),
            ],
          ),
        ));
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: pdEnteries,
    );
  }
}
