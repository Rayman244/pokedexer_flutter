import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/poke_page/poke_page.dart';
import 'package:pokedexer_flutter/Views/utils/bordered_text.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/controllers/types.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';
import '../models/all_pokemon.dart' as poke_info;

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
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;
    final bool landscapeModeActive = screenWidth > screenHeight;

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
        bottomNavigationBar: Container(
          color: PokeColors.red,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 15.0, bottom: 15, left: 15, top: 4),
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
                          child: SafeArea(
                            child: SizedBox(
                              height: screenHeight * .95,
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: useMobileLayout
                                        ? 2
                                        : landscapeModeActive
                                            ? 5
                                            : 4,
                                  ),
                                  itemCount: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Pokemon pokemon = data[1]['pokemon'][index];
                                    String pokeMainType =
                                        pokemon.types![0].type!.name!;

                                    String? pokeSecType;
                                    Color? secondryColor;
                                    try {
                                      pokeSecType =
                                          pokemon.types![1].type!.name;
                                    } catch (e) {
                                      // pokeSecType = pokeMainType;
                                    }
                                    Color primaryColor =
                                        Color(typeColors[pokeMainType]!);
                                    try {
                                      secondryColor =
                                          Color(typeColors[pokeSecType]!);
                                    } catch (e) {
                                      // print(e);
                                    }

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
                                                  secondryColor ?? primaryColor
                                                ]),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: GestureDetector(
                                          // onTap: () =>print( poke_info.getIndividualData(poke_url)),
                                          onTap: () =>
                                              // Navigator.push(ctx, PokePage());
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (_) => PokePage(
                                                            pokemon: pokemon,
                                                            primaryColor:
                                                                primaryColor,
                                                            secondaryColor:
                                                                secondryColor,
                                                          ))),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Image(
                                                      width: (screenWidth /
                                                              (useMobileLayout
                                                                  ? 2
                                                                  : landscapeModeActive
                                                                      ? 5
                                                                      : 3.9)) *
                                                          .65,
                                                      image: NetworkImage(pokemon
                                                          .sprites!
                                                          .origionalArtworkFrontDefault!),
                                                    ),
                                                    SizedBox(
                                                      child: Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                capitalize(
                                                                    pokemon
                                                                        .name!),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        useMobileLayout
                                                                            ? 18
                                                                            : 24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          PokeTypes(
                                                              typeList: pokemon
                                                                  .types!)
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
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, top: 8),
                                                  child: Text(
                                                    "# ${pokemon.id}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            useMobileLayout
                                                                ? 15
                                                                : 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )),
                    ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
  }
}
