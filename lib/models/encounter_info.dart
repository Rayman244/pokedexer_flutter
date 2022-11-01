import 'package:pokeapi/model/pokemon/pokemon.dart';

Map<String, String> encounterMethods = {
  "https://pokeapi.co/api/v2/encounter-method/1/":
      "Walking in tall grass or a cave",
  "https://pokeapi.co/api/v2/encounter-method/2/": "Fishing with an Old Rod",
  "https://pokeapi.co/api/v2/encounter-method/3/": "Fishing with a Good Rod",
  "https://pokeapi.co/api/v2/encounter-method/4/": "Fishing with a Super Rod",
  "https://pokeapi.co/api/v2/encounter-method/5/": "Surfing",
  "https://pokeapi.co/api/v2/encounter-method/6/": "Smashing rocks",
  "https://pokeapi.co/api/v2/encounter-method/7/": "Headbutting trees",
  "https://pokeapi.co/api/v2/encounter-method/8/": "Walking in dark grass",
  "https://pokeapi.co/api/v2/encounter-method/9/": "Walking in rustling grass",
  "https://pokeapi.co/api/v2/encounter-method/10/": "Walking in dust clouds",
  "https://pokeapi.co/api/v2/encounter-method/11/": "Walking in bridge shadows",
  "https://pokeapi.co/api/v2/encounter-method/12/": "Fishing in dark spots",
  "https://pokeapi.co/api/v2/encounter-method/13/": "An dunklen stellen surfen",
  "https://pokeapi.co/api/v2/encounter-method/14/": "Walking in yellow flowers",
  "https://pokeapi.co/api/v2/encounter-method/15/": "Walking in purple flowers",
  "https://pokeapi.co/api/v2/encounter-method/16/": "Walking in red flowers",
  "https://pokeapi.co/api/v2/encounter-method/17/": "Walking on rough terrain",
  "https://pokeapi.co/api/v2/encounter-method/18/": "Receive as a gift",
  "https://pokeapi.co/api/v2/encounter-method/19/": "Receive egg as a gift",
  "https://pokeapi.co/api/v2/encounter-method/20/":
      "Static encounter, only one chance",
  "https://pokeapi.co/api/v2/encounter-method/21/": "Playing Pokéflute",
  "https://pokeapi.co/api/v2/encounter-method/22/":
      "Headbutting a low encounter rate tree",
  "https://pokeapi.co/api/v2/encounter-method/23/":
      "Headbutting a normal encounter rate tree",
  "https://pokeapi.co/api/v2/encounter-method/24/":
      "Headbutting a high encounter rate tree",
  "https://pokeapi.co/api/v2/encounter-method/25/":
      "Using the Squirt Bottle on a Sudowoodo",
  "https://pokeapi.co/api/v2/encounter-method/26/":
      "Using the Wailmer Pail on a Sudowoodo",
  "https://pokeapi.co/api/v2/encounter-method/27/": "Diving on seaweed",
  "https://pokeapi.co/api/v2/encounter-method/28/":
      "On any overworld patch of grass",
  "https://pokeapi.co/api/v2/encounter-method/29/":
      "On any overworld water tile",
  "https://pokeapi.co/api/v2/encounter-method/30/": "Using Devon Scope",
  "https://pokeapi.co/api/v2/encounter-method/31/": "Fishing in a Feebas Tile",
};

Map<String, String> conditionMap = {
  'https://pokeapi.co/api/v2/encounter-condition-value/1/': 'During a swarm',
  'https://pokeapi.co/api/v2/encounter-condition-value/2/':
      'Not during a swarm',
  'https://pokeapi.co/api/v2/encounter-condition-value/3/': 'In the morning',
  'https://pokeapi.co/api/v2/encounter-condition-value/4/': 'During the day',
  'https://pokeapi.co/api/v2/encounter-condition-value/5/': 'At night',
  'https://pokeapi.co/api/v2/encounter-condition-value/6/': 'Using PokÃ©Radar',
  'https://pokeapi.co/api/v2/encounter-condition-value/7/':
      'Not using PokÃ©Radar',
  'https://pokeapi.co/api/v2/encounter-condition-value/8/': 'No game in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/9/': 'Ruby in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/10/':
      'Sapphire in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/11/':
      'Have an Event Arceus in the party',
  'https://pokeapi.co/api/v2/encounter-condition-value/12/':
      'Emerald in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/13/':
      'FireRed in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/14/':
      'LeafGreen in slot 2',
  'https://pokeapi.co/api/v2/encounter-condition-value/15/': 'Radio off',
  'https://pokeapi.co/api/v2/encounter-condition-value/16/': 'Hoenn radio',
  'https://pokeapi.co/api/v2/encounter-condition-value/17/': 'Sinnoh radio',
  'https://pokeapi.co/api/v2/encounter-condition-value/18/': 'During Spring',
  'https://pokeapi.co/api/v2/encounter-condition-value/19/': 'During Summer',
  'https://pokeapi.co/api/v2/encounter-condition-value/20/': 'During Autumn',
  'https://pokeapi.co/api/v2/encounter-condition-value/21/': 'During Winter',
  'https://pokeapi.co/api/v2/encounter-condition-value/22/':
      'Bulbasaur as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/23/':
      'Squirtle as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/24/':
      'Charmander as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/25/':
      'Chespin as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/26/':
      'Fennekin as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/27/':
      'Froakie as starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/28/':
      'Chose â€˜Blueâ€™ on the TV news report',
  'https://pokeapi.co/api/v2/encounter-condition-value/29/':
      'Chose â€˜Redâ€™ on the TV news report',
  'https://pokeapi.co/api/v2/encounter-condition-value/30/':
      'Awakened the legendary beasts at Burned Tower',
  'https://pokeapi.co/api/v2/encounter-condition-value/31/':
      'Visited Lake Verity after defeating Team Galactic at Mt. Coronet',
  'https://pokeapi.co/api/v2/encounter-condition-value/32/':
      'Talked to Professor Oak at Eterna City',
  'https://pokeapi.co/api/v2/encounter-condition-value/33/':
      'Visited the PokÃ©mon Fan Club with Copycatâ€™s doll',
  'https://pokeapi.co/api/v2/encounter-condition-value/34/':
      'Met Tornadus or Thundurus in a cutscene',
  'https://pokeapi.co/api/v2/encounter-condition-value/35/':
      'Beat the Elite 4 for the second time',
  'https://pokeapi.co/api/v2/encounter-condition-value/36/':
      'Enter the Hall of Fame',
  'https://pokeapi.co/api/v2/encounter-condition-value/37/': 'None',
  'https://pokeapi.co/api/v2/encounter-condition-value/38/':
      'Acquired National PokÃ©dex',
  'https://pokeapi.co/api/v2/encounter-condition-value/39/': 'None',
  'https://pokeapi.co/api/v2/encounter-condition-value/40/':
      'Beat the PokÃ©mon league after knocking out Snorlax at Route 11',
  'https://pokeapi.co/api/v2/encounter-condition-value/41/':
      'Playing on the Virtual Console Release',
  'https://pokeapi.co/api/v2/encounter-condition-value/42/':
      'Cure the nightmares of Eldritchâ€™s Son',
  'https://pokeapi.co/api/v2/encounter-condition-value/43/':
      'Talk to Cynthiaâ€™s grandmother',
  'https://pokeapi.co/api/v2/encounter-condition-value/44/':
      'No item requirement',
  'https://pokeapi.co/api/v2/encounter-condition-value/45/':
      'Have Adamant Orb in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/46/':
      'Have Lustrous Orb in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/47/':
      'Have Helix Fossil in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/48/':
      'Have Dome Fossil in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/49/':
      'Have Old Amber in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/50/':
      'Have Root Fossil in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/51/':
      'Have Claw Fossil in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/52/': 'Defeat Jupiter',
  'https://pokeapi.co/api/v2/encounter-condition-value/53/':
      'Defeat Team Galactic at Iron Island',
  'https://pokeapi.co/api/v2/encounter-condition-value/54/':
      'Input correct password',
  'https://pokeapi.co/api/v2/encounter-condition-value/55/':
      'Obtained Zephyr badge',
  'https://pokeapi.co/api/v2/encounter-condition-value/56/': 'Defeat Red',
  'https://pokeapi.co/api/v2/encounter-condition-value/57/':
      'Received a Kanto Starter',
  'https://pokeapi.co/api/v2/encounter-condition-value/58/':
      'Received TM59 From Claire',
  'https://pokeapi.co/api/v2/encounter-condition-value/59/':
      'Have Regirock, Regice and Registeel in the party',
  'https://pokeapi.co/api/v2/encounter-condition-value/60/': 'Sunday',
  'https://pokeapi.co/api/v2/encounter-condition-value/61/': 'Monday',
  'https://pokeapi.co/api/v2/encounter-condition-value/62/': 'Tuesday',
  'https://pokeapi.co/api/v2/encounter-condition-value/63/': 'Wednesday',
  'https://pokeapi.co/api/v2/encounter-condition-value/64/': 'Thursday',
  'https://pokeapi.co/api/v2/encounter-condition-value/65/': 'Friday',
  'https://pokeapi.co/api/v2/encounter-condition-value/66/': 'Saturday',
  'https://pokeapi.co/api/v2/encounter-condition-value/67/':
      'The first PokÃ©mon in the playerâ€™s party has a high friendship stat',
  'https://pokeapi.co/api/v2/encounter-condition-value/68/':
      'Beat Mars for the first time',
  'https://pokeapi.co/api/v2/encounter-condition-value/69/':
      'Have Odd Keystone in bag',
  'https://pokeapi.co/api/v2/encounter-condition-value/70/':
      'Has talked to at least 32 people in the underground',
  'https://pokeapi.co/api/v2/encounter-condition-value/71/':
      'Returned Machine Part to Power Plant'
};
// ConditionValues;