import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';

class ScreenHeader extends StatefulWidget {
  const ScreenHeader({super.key});

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: 80.h,
      padding: EdgeInsets.all(15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(backImageAssetPath),
          const Spacer(),
          const Text(applicationName,style: TextStyle(color: Colors.white),),
          const Spacer(),
          Stack(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            children: [
              SizedBox(child: Image.asset(chosenBallImageAssetPath),width: 50.w,),
              Positioned(left: 2.w, child:SizedBox(child:  Image.asset(ballNo1ImageAssetPath),width: 18.w,)),
            ],

          ),
        ],
      ),
    );
  }
}
