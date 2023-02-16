import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/poke_page.dart';
import 'package:pokedexer_flutter/Views/utils/bordered_text.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/controllers/types.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';
import '../models/all_pokemon.dart' as poke_info;
import '../models/extensions.dart' as my_extensions;

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Map<String, dynamic>>> pokeList = poke_info.getPokemon(baseUrl);
  bool dataLoaded = false;
  String? nextLink;
  String? prevLink;
  bool showPrevButton = false;
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
          toolbarHeight: 55,
          title: BorderedText(
            title: widget.title,
            color: PokeColors.yellow,
            borderColor: PokeColors.blue,
            size: 35,
            strokeWidth: 6,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: Icon(
                  Icons.search,
                  color: PokeColors.yellow,
                )),
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
                   
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        nextLink = data[0]["navigation"][0]["next"];

                        prevLink = data[0]["navigation"][1]["prev"];
                        if (prevLink != null) {
                          showPrevButton = true;
                        } else {
                          showPrevButton = false;
                        }
                      });
                    });

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
                                    Pokemon pokemon = data[1]['pokemon'][index];

                                    // var pokeId = pokemon["id"];
                                    // var pokeName = my_extensions
                                    //     .capitalize(pokemon["name"]);
                                    // String pokeImg = pokemon["sprites"]["other"]
                                    //     ["official-artwork"]["front_default"];
                                    // var pokeTypes = pokemon["types"];
                                    String pokeMainType =
                                        pokemon.types![0].type!.name!;

                                    late String pokeSecType;
                                    try {
                                      pokeSecType =
                                          pokemon.types![1].type!.name!;
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
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (_) => PokePage(
                                                            pokeId: pokemon.id!,
                                                            name: pokemon.name!,
                                                            mainType:
                                                                pokeMainType,
                                                            secType:
                                                                pokeSecType,
                                                          ))),
                                          child: Column(
                                            children: [
                                              Image(
                                                height: 135,
                                                image: NetworkImage(pokemon
                                                    .origionalArtworkFrontDefault!),
                                              ),
                                              SizedBox(
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          pokemon.name!,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    PokeTypes(
                                                        typeList:
                                                            pokemon.types!)
                                                    // Center(
                                                    //   child:
                                                    //       getTypes(pokeTypes),
                                                    // ),
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
                color: PokeColors.red,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * .05,
                      right: screenWidth * .05,
                      bottom: screenWidth * .05),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showPrevButton
                            ? ElevatedButton(
                                onPressed: () => updatePokeList(prevLink),
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
