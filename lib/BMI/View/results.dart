import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/bmi_controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  BMIController controller = Get.put(BMIController());


 RxDouble r = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0A0E21),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15.sp),
              IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,weight: 5,)),
              SizedBox(height: 40.sp),
              Text("Your Results",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.sp),
              Container(
                height: 40.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                  color: Color(0xff1A1F38)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r<18.5?'UNDERWEIGHT':r>=18.5 && r<25?'NORMAL':'OVERWEIGHT',style: TextStyle(fontSize: 20.sp,color: Colors.green,fontWeight: FontWeight.bold),),
                      Text('${r.toStringAsFixed(3)}',style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('You have aNormal Body Wieght',style: TextStyle(fontSize: 16.sp,color: Colors.green,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1.5.h),
                          Text('Good...',style: TextStyle(fontSize: 16.sp,color: Colors.green,fontWeight: FontWeight.bold),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(alignment:Alignment.center,child: FloatingActionButton.extended(onPressed: (){
                controller.hieght.value=10;
                controller.wieght.value=20;
                controller.age.value=10;
                Get.back();
              },label: Text("Re-Calculate"),backgroundColor:Colors.pink,))
            ],
          ),
        ),
      ),
    );
  }
}
