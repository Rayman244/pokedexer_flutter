import 'package:flutter/material.dart';
import '../models/Extensions.dart' as my_extensions;
import '../models/all_pokemon.dart' as poke_info;


class PokePage extends StatelessWidget {
  final int pokeId;
  final String name;
  // final String poke_url;
  // ignore: non_constant_identifier_names
  const PokePage({Key? key, required this.pokeId, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<Map<String, dynamic>> pokeinfo =
        poke_info.getIndividualData(pokeId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(name)),
      body: FutureBuilder<Map<String, dynamic>>(
          future: pokeinfo,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = infoPortion(snapshot, context);
            } else if (snapshot.hasError) {
              children = [];
              // ignore: avoid_print
              print("Error populating list");
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ];
            }
            return GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 1,
              children: children,
            );
          }),
     
    );
  }
}
infoPortion(pokeinfo, context) {
  List<Widget> info = [];
  var pokeId = pokeinfo.data["id"];
  var pokeName = pokeinfo.data!['name'];
  var pokeImg =
      pokeinfo.data["sprites"]["other"]["official-artwork"]["front_default"];
  var baseExp = pokeinfo.data["base_experience"];
  var pokeHeight = pokeinfo.data["height"];

  info.add(
    Column(
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image(
                height: 200,
                image: NetworkImage("$pokeImg"),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("ID: $pokeId"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(pokeName),
                    ),

                  ],
                ),
                Text("Height: $pokeHeight"),
                Text("Base Experience: $baseExp"),
              ],
            ),
          ],
        ),
       
      ],
    ),
  );
  return info;
}