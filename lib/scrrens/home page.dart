import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planet_app/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  // late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
      // lowerBound: 0,
      // upperBound: 1
    );
    Timer(const Duration(milliseconds: 1), () {
      animationController.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GALAXY PLANETS"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff3383fc),
                Color(0xff00c6ff),
              ],
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 25,
            ),
            onPressed: () {}),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_sharp,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff3e3963),
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Container(
              height: 210,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10, left: 15, bottom: 10),
              //color: Colors.transparent,
              // color: Colors.grey,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black12.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff434273).withOpacity(0.920),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 75),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    planets[i].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            '/detail',
                                            arguments: planets[i]);
                                      },
                                      icon: Icon(
                                        Icons.more_vert_outlined,
                                        size: 30,
                                        color: Colors.white.withOpacity(0.7),
                                      ))
                                ],
                              ),
                              Text(
                                "Milkyway Galaxy",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 3.5,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    planets[i].distanceFromSun,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.compare_arrows,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    planets[i].gravity,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 42.5,
                    left: 0,
                    child: RotationTransition(
                      turns: animationController,
                      child: Image.asset(
                        planets[i].iconImage,
                        height: 120,
                        width: 120,
                        scale: planets[i].position.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: planets.length,
        ),
      ),
    );
  }
}
