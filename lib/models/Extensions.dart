/// capitalize
///
///takes a [word] capitalizes the first letter and returns the whole string
String capitalize(String word) {
  return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
}

///dectofit
///
///takes the total [decameters] a pokemon is and converts it to feet.
///
String dectoft(int decameters) {
  double ft = 0.3280839895;

  return (decameters * ft).toStringAsFixed(2);
}

/// converts hectograms to pounds
///
heToLb(int hectogram) {
  double lb = 0.220462;

  return (hectogram * lb).toStringAsFixed(2);
}
