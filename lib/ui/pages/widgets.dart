// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dieting_app/model/ingredients.dart';
import 'package:flutter/material.dart';

class widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            _Mealbox(
              mealtime: "Breakfast",
              calories: "50",
              imgpath: "assets/breakfast.png",
            ),
            _Mealbox(
              mealtime: "Lunch",
              calories: "84",
              imgpath: "assets/fried-rice.png",
            ),
            _Mealbox(
              mealtime: "Dinner",
              calories: "24",
              imgpath: "assets/dinner.png",
            ),
            _Mealbox(
              mealtime: "Snack",
              calories: "56",
              imgpath: "assets/snack.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _ProgressBars(
                    precentage: 0.4,
                    variation: "Carbs",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _ProgressBars(
                    precentage: 0.8,
                    variation: "Protien",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _ProgressBars(
                    precentage: 0.8,
                    variation: "Fat",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            _Add(),
            SizedBox(
              height: 50,
            ),
            _Ingredients(
              totalCalories: "555",
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

class _Mealbox extends StatelessWidget {
  final String mealtime;
  final String calories;
  final String imgpath;

  const _Mealbox(
      {Key? key,
      required this.mealtime,
      required this.calories,
      required this.imgpath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                )
              ]),
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                        height: 60, width: 60, child: Image.asset(imgpath)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add " + mealtime,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Reccomended :" + calories + "g protien",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ClipOval(
                      child: Material(
                        color: Colors.grey.shade300, // Button color
                        child: InkWell(
                          splashColor: Colors.blueGrey, // Splash color
                          onTap: () {},
                          child: SizedBox(
                              width: 40, height: 40, child: Icon(Icons.add)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBars extends StatelessWidget {
  final double precentage;
  final String variation;

  const _ProgressBars(
      {Key? key, required this.precentage, required this.variation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                child: TweenAnimationBuilder(
                    duration: Duration(seconds: 4),
                    tween: Tween(begin: 0.1, end: precentage),
                    builder: (context, double precentage, child) {
                      int percentage = (precentage * 100).ceil();
                      return Container(
                        width: width / 4,
                        height: width / 4,
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return SweepGradient(
                                    startAngle: 0.0,
                                    endAngle: 3.14 * 2,
                                    stops: [precentage, precentage],
                                    center: Alignment.center,
                                    colors: [
                                      Colors.black,
                                      Colors.grey.withOpacity(0.3)
                                    ]).createShader(rect);
                              },
                              child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white)),
                            ),
                            Center(
                              child: Container(
                                height: width / 4 - 10,
                                width: width / 4 - 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "$percentage" + "%",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  variation,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
              )
            ],
          )),
    );
  }
}

class _Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 60% of space => (6/(6 + 4))
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text("Text"), border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text("Text"), border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      )),
                    )),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Center(
                          child: Text(
                        'ADD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  final String totalCalories;

  const _Ingredients({
    Key? key,
    required this.totalCalories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "Servings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Row(
                      children: [
                        Text(
                          totalCalories,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          " kcal",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 8),
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/beaker.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INGREDIENTS ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "1 serve",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: inputs.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.lightGreen,
                                      size: 10,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              inputs[index].name,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  inputs[index].calories +
                                                      " kcal",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(" : "),
                                                Text(
                                                  inputs[index].desc + " kcal",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
