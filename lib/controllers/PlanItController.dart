import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_screenshot_ext/native_screenshot_ext.dart';

class PlanItController extends GetxController{



  Color changeColor(Color initialColor,Color newColor){
    initialColor=newColor;
    update();
    return initialColor;
  }

  Offset getNewOffsetToPaint({required Offset newOffset,required Offset oldOffset}) {
    oldOffset = newOffset;
    update();
    return oldOffset;
  }


  }