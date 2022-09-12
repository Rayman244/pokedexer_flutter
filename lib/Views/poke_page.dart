import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/controllers/poke_info.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import '../models/all_pokemon.dart' as poke_info;


/// Pokemon personal page. Looks a pokemon up baised on there [pokeId] znd populates the appbar with the [name] of the pokemon
///  
class PokePage extends StatefulWidget {
  const PokePage({Key? key, required this.pokeId, required this.name,required this.mainType,required this.secType})
      : super(key: key);
       final int pokeId;
  final String name;
  final String mainType;
  final String? secType;



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
       
           Color primaryColor = Color(typeColors[widget.mainType]!.toInt());
    Color secondryColor = Color(typeColors[widget.secType]!.toInt());

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red,
      
        ),
        // backgroundColor: Color(typeColors[widget.mainType]!.toInt()),
      
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [primaryColor, secondryColor])),
        child: FutureBuilder<Map<String, dynamic>>(
            future: pokeinfo,
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              Widget children;
              if (snapshot.hasData) {
                children = infoPortion(snapshot, context,_tabController);
              } else if (snapshot.hasError) {
                children = const Text("Couldnt get Pokemon info ");
                debugPrint("Couldnt get pokemon info");
              } else {
                children = const SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(child: CircularProgressIndicator()),
                  )
                ;
              }
              return Container(
                child: children,
              );
            }),
      ),
     
    );
  }
}



