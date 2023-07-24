import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';

class ScreenBody extends StatefulWidget {
  const ScreenBody({super.key});

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  GlobalKey key = GlobalKey();
   Color initialColor= Colors.white;
  @override
  Widget build(BuildContext context) {
    print(initialColor);
    return Padding(
      padding:  EdgeInsets.only(top: 55.h),
      child: Stack(
        children: [
          Image.asset(rectangleImageAssetPath,width: double.infinity),
        Column(
          children: [
            getHeaderIcons(),
            SizedBox(
              height: 5.h,
            ),
            Image.asset(aramithWordImage),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(gameImage,width: MediaQuery.of(context).size.width-50.w),
                Column(
                  children: [
                    Draggable(
                     childWhenDragging: Opacity(opacity: 0.5, child: Image.asset(ball1Image)),
                        feedback: Image.asset(ball1Image),
                    child: Image.asset(ball1Image)),
                    SizedBox(height: 5.h,),
                    GestureDetector(
                      key: key,
                        child: Image.asset(ball2Image),
                    ),
                    SizedBox(height: 5.h,),
                    Image.asset(ball3Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball4Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball5Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball6Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball7Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball8Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball9Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball10Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball11Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball12Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball13Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball14Image),
                    SizedBox(height: 5.h,),
                    Image.asset(ball15Image),
                  ],
                )
              ],
            )

          ],
        )

        ],
      ),
    );
  }

  Widget getHeaderIcons() =>  Padding(
    padding:  EdgeInsets.only(top: 15.h,left: 15.w,right: 15.w),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                        pickerColor: initialColor,
                        onColorChanged: (Color color){
                          setState(() {
                            initialColor = color;
                          });
                        },
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('DONE'),
                      onPressed: () {
                        Navigator.of(context).pop(); //dismiss the color picker
                      },
                    ),
                  ],
                ),
            );
          },
          icon: Image.asset(brushColorImageAssetPath),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {  },
          icon: Image.asset(bigBrushColorImageAssetPath),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {  },
          icon: Image.asset(smallBrushColorImageAssetPath),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {  },
          icon: Image.asset(resetImageAssetPath),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {  },
          icon: Image.asset(capturedImageAssetPath),
        ),
      ],
    ),
  );


}
