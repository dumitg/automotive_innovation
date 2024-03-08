import 'package:automotive_innovation/Services/Get/get_car.dart';
import 'package:automotive_innovation/widget/car_part.dart';
import 'package:automotive_innovation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Car extends StatelessWidget {
  Car({super.key});

  final GetCar controller = Get.put(GetCar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue.shade200,
              Colors.black12,
            ])),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    left: 20,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 300,
                        width: 400,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bmwx5.png'))),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 70,
                      left: 30,
                      right: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            "Asistență la Conducere",
                            18,
                            Colors.white,
                            FontWeight.bold,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0)),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/application_logo.png'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.darken),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Asistență la Conducere',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(children: [
                                              Text(
                                                'Sistemul de asistență la conducere oferă funcții avansate pentru siguranță și confort:',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  height: 1.5,
                                                ),
                                              ),
                                              Text(
                                                '-> detectarea indicatoarelor auto pentru informare în timp real',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  height: 1.5,
                                                ),
                                              ),
                                              Text(
                                                '-> monitorizarea benzilor de circulație pentru prevenirea abaterilor',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white10,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.traffic, color: Colors.white),
                    label: Text('Indicatoare Auto'),
                    onPressed: () => controller.setEngine(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade700,
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.linear_scale, color: Colors.white),
                    label: Text('Benzi de Circulație'),
                    onPressed: () => controller.setDoor(),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade700,
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("CONTROALE", 18, Colors.white, FontWeight.w500),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => CarPart(
                            name: "Motor",
                            state: controller.engin.value,
                            onTap: () {
                              controller.setEngine();
                            },
                          ),
                        ),
                        Obx(
                          () => CarPart(
                              name: "Climă",
                              state: controller.door.value,
                              onTap: () => controller.setDoor()),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
