import 'package:flutter/material.dart';

evoTree(evolutions) {
  List<Widget> evoTree = [];
  for (Map evo in evolutions.data) {
    Widget evoRow;
    if (evo["mapName"] == "evo") {
      evoRow = Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Text("# ${evo['id'].toString()}"),
              Text(evo['name']),
              const Spacer(),

            ],
          ),
          Image(
            height: 200,
            image: NetworkImage(evo["img"]),
          ),
          
          
        ],
      );
      evoTree.add(Padding(
        padding: const EdgeInsets.only(top:40,bottom: 8.0),
        child: evoRow,
      ));
    } else {
       evoRow = Column(
            children: [
              Text(evo['trigger']),
              Text(evo['lvl'].toString()),
          const  Icon(
          Icons.arrow_downward_sharp,
            size: 100,
            // color: Colors.red,
            
          ),
        ],
      );
      evoTree.add(evoRow);
      
    }

   
  }

  return evoTree;
}
