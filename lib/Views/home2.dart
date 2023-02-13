import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/poke_page.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/controllers/my_widgets.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import '../models/all_pokemon.dart' as poke_info;
import '../models/extensions.dart' as my_extensions;

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Future<List<Map<String, dynamic>>> pokeList = poke_info.getPokemon(baseUrl);
  bool dataLoaded = false;
  String? nextLink;
  String? prevLink;
  void updatePokeList(url) {
    setState(() {
      pokeList = poke_info.getPokemon(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          title: const Text("Pokedexer"),
          actions: [
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Stack(
          children: [
            FutureBuilder(
                future: pokeList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    dataLoaded = true;
                    List<Map<String, dynamic>> data = snapshot.data!;
                    nextLink = data[0]["next"];
                    prevLink = data[1]["prev"];

                    // print(data[2]);
                    return Stack(children: [
                      Align(
                          alignment: const Alignment(0, 0),
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Map<String, dynamic> pokemon =
                                        data[index + 2];
                                    var pokeId = pokemon["id"];
                                    var pokeName = my_extensions
                                        .capitalize(pokemon["name"]);
                                    String pokeImg = pokemon["sprites"]["other"]
                                        ["official-artwork"]["front_default"];
                                    var pokeTypes = pokemon["types"];
                                    String pokeMainType =
                                        pokeTypes[0]["type"]['name'];

                                    late String pokeSecType;
                                    try {
                                      pokeSecType =
                                          pokeTypes[1]["type"]['name'];
                                    } catch (e) {
                                      pokeSecType = pokeMainType;
                                    }
                                    Color primaryColor =
                                        Color(typeColors[pokeMainType]!);
                                    Color secondryColor =
                                        Color(typeColors[pokeSecType]!.toInt());

                                    return Card(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          side: BorderSide(
                                              width: 2, color: Colors.black)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  primaryColor,
                                                  secondryColor
                                                ]),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: InkWell(
                                          splashColor: Colors.red,
                                          // onTap: () =>print( poke_info.getIndividualData(poke_url)),
                                          onTap: () =>
                                              // Navigator.push(ctx, PokePage());
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (_) => PokePage(
                                                        pokeId: pokeId,
                                                        name: pokeName,
                                                        mainType: pokeMainType,
                                                        secType: pokeSecType,
                                                      ))),
                                          child: Column(
                                            children: [
                                              Image(
                                                height: 135,
                                                image: NetworkImage(pokeImg),
                                              ),
                                              SizedBox(
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          pokeName,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Center(
                                                      child:
                                                          getTypes(pokeTypes),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }))),
                    ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: screenHeight * .08,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * .05,
                      right: screenWidth * .05,
                      bottom: screenWidth * .05),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        prevLink != nextLink
                            ? ElevatedButton(
                                onPressed: () =>
                                    updatePokeList(prevLink),
                                child: const Text("Prev"))
                            : const SizedBox.shrink(),
                        ElevatedButton(
                            onPressed: () => updatePokeList(nextLink),
                            child: const Text("Next")),
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}
