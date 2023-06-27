import 'package:bmi_calculator/BMI/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  BMIController controller = Get.put(BMIController());

  AnimationController? animationController;
  // AnimationController? animationController1;

  Animation<Alignment>? alignTween;
  Animation<Alignment>? alignTween1;
  Animation<Alignment>? alignTween2;

  @override
  void initState() {
    super.initState();  animationController = AnimationController(duration: Duration(seconds: 2),vsync: this);
    alignTween = Tween<Alignment>(begin: Alignment(20,0), end: Alignment(0,0)).animate(animationController!);
    alignTween1 = Tween<Alignment>(begin: Alignment(20,0), end: Alignment(0,0)).animate(animationController!);
    alignTween2 = Tween<Alignment>(begin: Alignment(-20,0), end: Alignment(0,0)).animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0A0E21),
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: Color(0xff0A0E21),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: alignTween2!.value,
                        child: InkWell(
                          onTap: () {
                            controller.selectm.value = true;
                            controller.selectf.value = false;
                          },
                          child: Container(
                            height: 23.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Color(0xff1A1F38)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Obx(() => Icon(
                                          Icons.male,
                                          color: controller.selectm.value == false
                                              ? Colors.white
                                              : Colors.pink,
                                          size: 50.sp,
                                        )),
                                  ),
                                SizedBox(height: 20),
                                Text(
                                  "MALE",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Align(
                        alignment: alignTween1!.value,
                        child: InkWell(
                          onTap: () {
                            controller.selectm.value = false;
                            controller.selectf.value = true;
                          },
                          child: Container(
                            height: 23.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Color(0xff1A1F38)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Obx(() => Icon(
                                          Icons.female,
                                          color: controller.selectf.value == false
                                              ? Colors.white
                                              : Colors.pink,
                                          size: 50.sp,
                                        )),
                                  ),
                                SizedBox(height: 20),
                                Text(
                                  "FEMALE",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: alignTween!.value,
              child: Container(
                height: 28.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Color(0xff1A1F38)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "HIEGHT",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Text(
                          '${controller.hieght.value.toStringAsPrecision(3)} cm',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    Obx(
                      () => Slider(
                        value: controller.hieght.value,
                        onChanged: (value) {
                          controller.hieght.value = value;
                        },
                        max: 200,
                        divisions: 200,
                        inactiveColor: Colors.indigo.shade300,
                        activeColor: Colors.pink,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Align(
                        alignment: alignTween2!.value,
                        child: Container(
                          height: 23.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Color(0xff1A1F38)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "WIEGHT",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    "${controller.wieght}",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.wieght.value--;
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.white,
                                        size: 30.sp,
                                      )),
                                  SizedBox(
                                    width: 15.sp,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.wieght.value++;
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 30.sp,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Align(
                        alignment: alignTween1!.value,
                        child: Container(
                          height: 23.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Color(0xff1A1F38)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    "${controller.age}",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.age.value--;
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.white,
                                        size: 30.sp,
                                      )),
                                  SizedBox(
                                    width: 15.sp,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.age.value++;
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 30.sp,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                double a = controller.hieght.value / 100;

                controller.result.value = (controller.wieght.value / (a * a));
                Get.toNamed('result', arguments: controller.result);
              },
              child: Container(
                height: 7.h,
                width: 90.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.sp),
                    color: Colors.pink),
                child: Text(
                  "CALCUTATE",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
