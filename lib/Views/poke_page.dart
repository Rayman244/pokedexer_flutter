import 'package:flutter/material.dart';
import 'package:intro_to_widgets/controllers/poke_info.dart';
import '../models/all_pokemon.dart' as poke_info;


/// Pokemon personal page. Looks a pokemon up baised on there [pokeId] znd populates the appbar with the [name] of the pokemon
///  
class PokePage extends StatefulWidget {
  const PokePage({Key? key, required this.pokeId, required this.name})
      : super(key: key);
       final int pokeId;
  final String name;

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> with TickerProviderStateMixin{
   late TabController _tabController;
   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
     final Future<Map<String, dynamic>> pokeinfo =
        poke_info.getIndividualData(widget.pokeId);
       

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      
        ),
      
      body: FutureBuilder<Map<String, dynamic>>(
          future: pokeinfo,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = infoPortion(snapshot, context,_tabController);
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



