import 'package:flutter/material.dart';
import 'package:intro_to_widgets/models/extensions.dart';

import '../models/Extensions.dart' as my_extensions;

///  list of all the pokemon info [pokeinfo] and gets it ready to be displayed
List<Widget> infoPortion(
    pokeinfo, BuildContext context, TabController tabController) {
  List<Widget> info = [];
  int pokeId = pokeinfo.data["id"];
  String pokeName = my_extensions.capitalize(pokeinfo.data!['name']);
  String pokeImg =
      pokeinfo.data["sprites"]["other"]["official-artwork"]["front_default"];
  int baseExp = pokeinfo.data["base_experience"];
  int pokeHeight = pokeinfo.data["height"];
  int weight = pokeinfo.data["weight"];

  List<Widget> abilities = [];

  pokeinfo.data["abilities"].forEach((ability) {
    abilities.add(Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(my_extensions.capitalize(ability["ability"]["name"])),
    ));
  });

  List<Widget> stats = [];
  pokeinfo.data["stats"].forEach((stat) {
    stats
        .add(Text("${capitalize(stat['stat']['name'])}: ${stat["base_stat"]}"));
  });

  info.add(
    Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(pokeName),
            ),
            Text("ID: $pokeId"),
          ],
        ),
        Center(
          child: Image(
            height: 200,
            image: NetworkImage(pokeImg),
          ),
        ),
        SizedBox(
          height: 40,
          child: TabBar(
            controller: tabController,
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
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,top:40),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            // need to change for individual pokemons
                            Row(
                              children: const [
                                Text(
                                  "Species",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Height",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text("Weight"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            // need to change for individual pokemons
                            Row(
                              children: const [
                                Text("Monster/Seed"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("${my_extensions.dectoft(pokeHeight)} ft"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("${my_extensions.heToLb(weight)} lb"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: const[
                    //         Text("Monster/Seed"),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text("${my_extensions.dectoft(pokeHeight)} ft"),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text("${my_extensions.heToLb(weight)} lb"),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(left: 20, top: 40, bottom: 20),
                    //   child: Row(
                    //     children: const [
                    //       Text(
                    //         "Species",
                    //         style: TextStyle(color: Colors.grey),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, bottom: 20),
                    //   child: Row(
                    //     children: [
                    //       const Text(
                    //         "Height",
                    //       ),
                    //       const Spacer(),
                    //       Text("${my_extensions.dectoft(pokeHeight)} ft"),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, bottom: 20),
                    //   child: Row(
                    //     children: [
                    //       const Text("Weight"),
                    //       const Spacer(),
                    //       Text("${my_extensions.heToLb(weight)} lb"),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, bottom: 20),
                    //   child: Row(
                    //     children: [
                    //       const Text("Abilities"),
                    //       const Spacer(),
                    //       Row(
                    //         children: abilities,
                    //       ),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     Text("Height: ${my_extensions.dectoft(pokeHeight)} ft"),
              //     Text("Weight: ${my_extensions.heToLb(weight)} lb"),
              //     Text("Base Experience: $baseExp"),
              //   ],
              // ),
              Column(
                children: stats,
              ),
              const Text("different evolutions"),
              const Text("All Moves"),
            ],
          ),
        ),
      ],
    ),
  );
  return info;
}
