import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/utils/bordered_text.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/Views/poke_page/utils/about/about.dart';
import 'package:pokedexer_flutter/controllers/stats/stats_portion.dart';
import 'package:pokedexer_flutter/controllers/types.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;
    final bool landscapeModeActive = screenWidth > screenHeight;
    return Scaffold(
      appBar: AppBar(
        title: BorderedText(
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
      bottomNavigationBar: Container(
        color: PokeColors.red,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: TabBar(
            controller: _tabController,
            labelColor: PokeColors.blue,
            // unselectedLabelColor: Colors.grey.shade300,
            unselectedLabelColor: Colors.grey.shade300,
            indicatorColor: PokeColors.blue,
            tabs: const [
              Tab(text: "About"),
              Tab(text: "Stats"),
              Tab(text: "Evolution"),
              Tab(text: "Moves"),
            ],
          ),
        ),
      ),
      body: Container(
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
                      child: Text(
                        "#${widget.pokemon.id}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: useMobileLayout ? 15 : 24),
                      ),
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
                  child: CarouselDemo(sprites: widget.pokemon.sprites)

                  // Image(
                  //   height:
                  //       useMobileLayout ? screenHeight * .235 : screenHeight * .3,
                  //   image: NetworkImage(
                  //       widget.pokemon.sprites!.origionalArtworkFrontDefault!),
                  // ),
                  ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(28))),
                    height: useMobileLayout
                        ? screenHeight * .57
                        : landscapeModeActive
                            ? screenHeight * .56
                            : screenHeight * .6,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        About(
                          pokemon: widget.pokemon,
                        ),
                        StatsPortion(
                            stats: widget.pokemon.stats,
                            baseExp: widget.pokemon.baseExperience),
                        // Container(),
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
            ],
          )),
    );
  }
}

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key, this.sprites});
  final Sprites? sprites;

  @override
  Widget build(BuildContext context) {
    // print(sprites);
    CarouselController buttonCarouselController = CarouselController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CarouselSlider(
          items: [
            Image.network(sprites!.origionalArtworkFrontDefault!),
            // sprites!.backDefault != null
            //     ? Image.network(sprites!.backDefault!)
            //     : const Center(child: Text("No Image")),
            // sprites!.frontDefault != null
            //     ? Image.network(sprites!.frontDefault!)
            //     : const Center(child: Text("No Image")),

            // sprites!.backShiny != null
            //     ? Image.network(sprites!.backShiny!)
            //     : const Center(child: Text("No Image")),
            // sprites!.frontShiny != null
            //     ? Image.network(sprites!.frontShiny!)
            //     : const Center(child: Text("No Image")),
            // sprites!.backFemale != null
            //     ? Image.network(sprites!.backShiny!)
            //     : const Center(child: Text("No Image")),
            // sprites!.frontFemale != null
            //     ? Image.network(sprites!.backShiny!)
            //     : const Center(child: Text("No Image")),
          ],
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 0,
          ),
        ),
        // ElevatedButton(
        //   onPressed: () => buttonCarouselController.nextPage(
        //       duration: Duration(milliseconds: 300), curve: Curves.linear),
        //   child: Text('→'),
        // )
      ],
    );
  }
}
