class Meal {
  final String mealTime, name, imagepath, kiloCaloriesBurnt, timeTaken;
  final String peparation;
  final List ingredients;

  Meal({
    required this.mealTime,
    required this.imagepath,
    required this.kiloCaloriesBurnt,
    required this.name,
    required this.timeTaken,
    required this.peparation,
    required this.ingredients,
  });
}

final meal = [
  Meal(
      mealTime: "Brakfast",
      imagepath: "assets/fruitone.jpg",
      kiloCaloriesBurnt: "200",
      name: "Fruit Granola",
      timeTaken: "10",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisings",
        "1 b of honey"
      ],
      peparation:
          '''Generating random paragraphs can be an excellent way for writers to get  their creative flow going at the beginning of the day. The writer has no idea what topic the random paragraph will be about when it appears. This forces the writer to use creativity to complete one of three common writing challenges. The writer can usethe paragraph as the first one of a short story and build upon it.A second option is to use the random paragraph somewhere in a shortstory they create. The third option is to have the random paragraphbe the ending paragraph in a short story. No matter which of these challenges is undertaken, the writer is forced to use creativity toincorporate the paragraph into their writing.'''),
  Meal(
      mealTime: "Dinner",
      imagepath: "assets/fruittwo.jpg",
      kiloCaloriesBurnt: "500",
      name: "Fruit Mango",
      timeTaken: "20",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisings",
        "1 b of honey"
      ],
      peparation:
          '''Generating random paragraphs can be an excellent way for writers to get  their creative flow going at the beginning of the day. The writer has no idea what topic the random paragraph will be about when it appears. This forces the writer to use creativity to complete one of three common writing challenges. The writer can usethe paragraph as the first one of a short story and build upon it.A second option is to use the random paragraph somewhere in a shortstory they create. The third option is to have the random paragraphbe the ending paragraph in a short story. No matter which of these challenges is undertaken, the writer is forced to use creativity toincorporate the paragraph into their writing.'''),
  Meal(
      mealTime: "Lunch",
      imagepath: "assets/fruitthree.jpg",
      kiloCaloriesBurnt: "700",
      name: "Fruit Apple",
      timeTaken: "30",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisings",
        "1 b of honey"
      ],
      peparation:
          '''Generating random paragraphs can be an excellent way for writers to get  their creative flow going at the beginning of the day. The writer has no idea what topic the random paragraph will be about when it appears. This forces the writer to use creativity to complete one of three common writing challenges. The writer can usethe paragraph as the first one of a short story and build upon it.A second option is to use the random paragraph somewhere in a shortstory they create. The third option is to have the random paragraphbe the ending paragraph in a short story. No matter which of these challenges is undertaken, the writer is forced to use creativity toincorporate the paragraph into their writing.''')
];
