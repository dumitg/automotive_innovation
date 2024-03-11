import 'package:automotive_innovation/Services/Get/get_climate.dart';
import 'package:automotive_innovation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Climate extends StatelessWidget {
  Climate({super.key});
  final GetClimate controller = Get.put(GetClimate());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        height: double.infinity,
        width: double.infinity,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),),
                ),
                SizedBox(
                  width: Get.width * 0.25,
                ),
                text(
                  "CLIMA",
                  22,
                  Colors.white,
                  FontWeight.bold,
                  letterspacel: 6,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  circleButton(Icons.autorenew, "Auto", controller.auto.value,
                      () {
                    controller.setAuto();
                  }),
                  circleButton(
                      Icons.ac_unit_rounded, "Răcire", controller.cool.value,
                      () {
                    controller.setCool();
                  }),
                  circleButton(Icons.sunny, "Încălzire", controller.heat.value,
                      () {
                    controller.setHeat();
                  }),
                ],
              ),
            ),
            const Spacer(),
            Obx(
              () => SleekCircularSlider(
                innerWidget: (percentage) {
                  return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text(percentage.toInt().toString(), 50,
                                Colors.white, FontWeight.bold),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                      ));
                },
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                    gradientEndAngle: 100,
                    gradientStartAngle: 100,
                    trackColors: [
                      Colors.black,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent
                    ],
                    shadowColor: Colors.blue,
                    progressBarColors: [
                      Colors.black,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent,
                      Colors.red,
                      Colors.white,
                      Colors.green,
                      Colors.limeAccent,
                      Colors.pinkAccent
                    ],
                    shadowMaxOpacity: 10,
                    dotColor: Colors.red,
                    dynamicGradient: true,
                  ),
                  animationEnabled: true,
                  counterClockwise: true,
                  size: 280,
                  spinnerMode: false,
                  startAngle: 0,
                  angleRange: 359,
                ),
                initialValue: controller.value.value,
                max: 100,
                min: 0.0,
                onChange: (value) async {
                  controller.setValue(value);
                },
              ),
            ),
            const Spacer(),
            Obx(() => Container(
                  padding: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.ac.value
                          ? Colors.lightGreen
                          : Colors.grey.shade800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text(
                              controller.ac.value
                                  ? "AC este activ"
                                  : "AC este inactiv",
                              20,
                              Colors.white,
                              FontWeight.w500),
                          const SizedBox(
                            height: 10,
                          ),
                          text("   Actual ${controller.value.value.ceil()} C",
                              18, Colors.white.withOpacity(.5), FontWeight.w500)
                        ],
                      ),
                      Transform.scale(
                        scale: 1.0,
                        child: Switch(
                          activeColor: Colors.blue,
                          value: controller.ac.value,
                          onChanged: (value) => controller.setAc(),
                        ),
                      )
                    ],
                  ),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget circleButton(
      IconData icon, String text_, bool state, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: state ? 20 : 0,
                )
              ],
              color: state ? Colors.blue : Colors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        text(text_, 16, Colors.white, FontWeight.bold)
      ],
    );
  }
}
