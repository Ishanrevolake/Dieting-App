// ignore_for_file: prefer_const_constructors

import 'package:dieting_app/model/meal.dart';
import 'package:dieting_app/ui/pages/meal_detailScreem.dart';
import 'package:dieting_app/ui/pages/widgets.dart';
import 'package:dieting_app/ui/pages/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
            iconSize: 20,
            selectedIconTheme: IconThemeData(color: const Color(0xFF200087)),
            unselectedIconTheme: IconThemeData(color: Colors.black12),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.home),
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.search),
                  ),
                  title: Text(
                    "search",
                    style: TextStyle(color: Colors.white),
                  )),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        title: Text(
                          "${DateFormat("EEEE").format(today)},  ${DateFormat("d MMMM").format(today)}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26),
                        ),
                        subtitle: Text(
                          "Hello Rajitha",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        trailing: ClipOval(
                            child: Image.asset(
                          "assets/user.jpg",
                          width: 50,
                          height: 50,
                        ))),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => widgets()),
                            );
                          },
                          child: _Radialprogress(
                            width: width * 0.28,
                            height: width * 0.28,
                            progress: 0.9,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                                width: width * 0.4,
                                ingredient: "protien",
                                leftAmount: 72,
                                progress: 0.3,
                                progresscolor: Colors.green),
                            _IngredientProgress(
                                width: width * 0.4,
                                ingredient: "Carbs",
                                leftAmount: 252,
                                progress: 0.2,
                                progresscolor: Colors.red),
                            _IngredientProgress(
                                width: width * 0.4,
                                ingredient: "Fat",
                                leftAmount: 61,
                                progress: 0.1,
                                progresscolor: Colors.yellow),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.36,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 32, right: 16),
                    child: Text(
                      "Meals Forr Today",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i < meal.length; i++)
                            _Mealcard(meal: meal[i]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: OpenContainer(
                    closedElevation: 3,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 500),
                    closedColor: const Color(0xFFE9E9E9),
                    openBuilder: (context, _) {
                      return WorkOutScreen();
                    },
                    closedBuilder: (context, VoidCallback openConatiner) {
                      return GestureDetector(
                        onTap: openConatiner,
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 32, right: 32),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xFF20008B),
                                    const Color(0xFF200087)
                                  ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 16),
                                child: Text(
                                  "YOUR NEXT WORKOUT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 16),
                                child: Text(
                                  "UPPER BODY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        child: Image.asset(
                                          "assets/chest.png",
                                          width: 40,
                                          height: 40,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/back.png",
                                          width: 40,
                                          height: 40,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/biceps.png",
                                          width: 40,
                                          height: 40,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xFF5B4D9D),
                                        ),
                                        child: Image.asset(
                                          "assets/chest.png",
                                          width: 40,
                                          height: 40,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progresscolor;

  const _IngredientProgress(
      {Key? key,
      required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progresscolor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: progresscolor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Text("${leftAmount}g left")
          ],
        )
      ],
    );
  }
}

class _Mealcard extends StatelessWidget {
  final Meal meal;

  const _Mealcard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailSScreen(meal: meal)));
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      meal.imagepath,
                      width: 150,
                      fit: BoxFit.fill,
                    )),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          meal.mealTime,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          meal.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Text(
                          "${meal.kiloCaloriesBurnt} kcal",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              size: 15,
                              color: Colors.black12,
                            ),
                            Text("${meal.timeTaken} min",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _Radialprogress extends StatelessWidget {
  final double height, width, progress;

  const _Radialprogress(
      {Key? key,
      required this.height,
      required this.width,
      required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "1735",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF200087))),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "kcal",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF200087))),
              ])),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


// Start with time 1.18