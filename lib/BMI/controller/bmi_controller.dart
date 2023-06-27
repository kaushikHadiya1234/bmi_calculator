
import 'package:get/get.dart';

class BMIController extends GetxController
{
  RxBool selectm = true.obs;
  RxBool selectf = false.obs;

  RxDouble wieght = 20.0.obs;
  RxDouble age = 10.0.obs;

  RxDouble hieght = 10.0.obs;

  RxDouble result = 0.0.obs;

}