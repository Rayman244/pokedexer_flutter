import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/utils/bordered_text.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/controllers/about/about.dart';
import 'package:pokedexer_flutter/controllers/about/about_portion.dart';
import 'package:pokedexer_flutter/controllers/types.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';
import '../models/all_pokemon.dart' as poke_info;

/// Pokemon personal page. Looks a pokemon up baised on there [pokeId] znd populates the appbar with the [name] of the pokemon
///
class PokePage extends StatefulWidget {
  const PokePage(
      {Key? key,
      required this.pokemon,
      required this.primaryColor,
      this.secondaryColor})
      : super(key: key);

  final Pokemon pokemon;
  final Color primaryColor;
  final Color? secondaryColor;

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:

            //     Text(capitalize(
            //   widget.pokemon.name!,
            // ))

            BorderedText(
                title: capitalize(widget.pokemon.name!),
                color: widget.primaryColor,
                borderColor: Colors.black,
                size: 34),
        // BorderedText(
        //     title: capitalize(widget.pokemon.name!),
        //     color: widget.primaryColor,
        //     borderColor: widget.secondaryColor ?? Colors.black,
        //     size: 34),
      ),
      body:
          // Container(
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //             begin: Alignment.topRight,
          //             end: Alignment.topLeft,
          //             colors: [
          //           widget.primaryColor,
          //           widget.secondaryColor ?? widget.primaryColor
          //         ])),
          //     child: SafeArea(
          //       child: Stack(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding: const EdgeInsets.only(top: 10, left: 8),
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     "# ${widget.pokemon.id!}",
          //                     style: const TextStyle(
          //                         fontSize: 24, fontWeight: FontWeight.bold),
          //                   ),
          //                   PokeTypes(typeList: widget.pokemon.types!)
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Align(
          //             alignment: Alignment.topCenter,
          //             child: Image(
          //               height: 200,
          //               image: NetworkImage(
          //                   widget.pokemon.origionalArtworkFrontDefault!),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ))

          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                    widget.primaryColor,
                    widget.secondaryColor ?? widget.primaryColor
                  ])),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("#${widget.pokemon.id}"),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(20),
                        //   child: Text(
                        //     widget.pokemon.name!,
                        //     style: const TextStyle(
                        //         fontSize: 24, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        PokeTypes(typeList: widget.pokemon.types!)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      height: 200,
                      image: NetworkImage(
                          widget.pokemon.origionalArtworkFrontDefault!),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28))),
                        height: screenHeight * .63,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            About(
                                height: widget.pokemon.height,
                                weight: widget.pokemon.weight,
                                species: widget.pokemon.species),

                            Container(),
                            Container(),
                            Container(),
                            // statsPortion(pokeinfo.data["stats"], baseExp, locations),
                            // evolutionsPortion(evolutions),
                            // const Text("different evolutions"),
                            // movesPortion(moves)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: screenHeight * .08,
                      decoration: BoxDecoration(
                        color: PokeColors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.red,
                          tabs: const [
                            Tab(text: "About"),
                            Tab(text: "Stats"),
                            Tab(text: "Evolution"),
                            Tab(text: "Moves"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
      // Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topRight,
      //             end: Alignment.topLeft,
      //             colors: [
      //           widget.primaryColor,
      //           widget.secondaryColor ?? widget.primaryColor
      //         ])),
      //     child: Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(20),
      //               child: Text("#${widget.pokemon.id}"),
      //             ),
      //             // Padding(
      //             //   padding: const EdgeInsets.all(20),
      //             //   child: Text(
      //             //     widget.pokemon.name!,
      //             //     style: const TextStyle(
      //             //         fontSize: 24, fontWeight: FontWeight.bold),
      //             //   ),
      //             // ),
      //             PokeTypes(typeList: widget.pokemon.types!)
      //           ],
      //         ),
      //         Center(
      //           child: Image(
      //             height: 200,
      //             image: NetworkImage(
      //                 widget.pokemon.origionalArtworkFrontDefault!),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 40,
      //           child: Container(
      //             decoration: const BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius:
      //                     BorderRadius.vertical(top: Radius.circular(28))),
      //             child: TabBar(
      //               controller: _tabController,
      //               labelColor: Colors.black,
      //               unselectedLabelColor: Colors.grey,
      //               indicatorColor: Colors.red,
      //               tabs: const [
      //                 Tab(text: "About"),
      //                 Tab(text: "Stats"),
      //                 Tab(text: "Evolution"),
      //                 Tab(text: "Moves"),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //             child: ColoredBox(
      //           color: Colors.white,
      //           child: TabBarView(
      //             controller: _tabController,
      //             children: [
      //               About(
      //                   height: widget.pokemon.height,
      //                   weight: widget.pokemon.weight,
      //                   species: widget.pokemon.species),
      //               // aboutPortion(widget.pokemon.height, widget.pokemon.weight,
      //               //     widget.pokemon.species, widget.pokemon.abilities, null),
      //               Container(),
      //               Container(),
      //               Container(),
      //               // statsPortion(pokeinfo.data["stats"], baseExp, locations),
      //               // evolutionsPortion(evolutions),
      //               // const Text("different evolutions"),
      //               // movesPortion(moves)
      //             ],
      //           ),
      //         )),
      //       ],
      //     )),
    );
  }
}
