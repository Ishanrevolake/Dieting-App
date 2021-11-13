class UpperBodyWorkout {
  final String name, imagepath, instructions;

  UpperBodyWorkout(
      {required this.imagepath,
      required this.name,
      required this.instructions});
}

final upperbody = [
  [
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: "Bench Press",
        instructions: "4 Sets - 6 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: "Dumbell Press",
        instructions: "4 Sets - 6 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: " Dips",
        instructions: "4 Sets - 6 repitions"),
  ],
  [
    UpperBodyWorkout(
        imagepath: "assets/back.png",
        name: "pull Ups",
        instructions: "4 Sets - 8 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/back.png",
        name: "Deadlift",
        instructions: "4 Sets - 8 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/back.png",
        name: "Curl",
        instructions: "4 Sets - 8 repitions"),
  ],
  [
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: "Bench Press",
        instructions: "4 Sets - 6 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: "Dumbell Press",
        instructions: "4 Sets - 6 repitions"),
    UpperBodyWorkout(
        imagepath: "assets/chest.png",
        name: " Dips",
        instructions: "4 Sets - 6 repitions"),
  ],
];
