
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:native_screenshot_ext/native_screenshot_ext.dart';
import 'package:plan_it/controllers/PlanItController.dart';
import 'package:plan_it/view/widgets/screen_header.dart';

import '../../core/constants/constants.dart';
import '../../models/image_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ImageModel>imageModelList;
  @override
  void initState() {
    // TODO: implement initState
    imageModelList=[
      ImageModel(image: Image.asset(ball1Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball2Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball3Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball4Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball5Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball6Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball7Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball8Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball9Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball10Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball11Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball12Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball13Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball14Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball15Image,width: 30.w,),x: Offset.zero.dx,y: Offset.zero.dx),
    ];
    super.initState();
  }
  GlobalKey globalKey=GlobalKey();
  Color initialColor = Colors.white;
  Offset ballTwoOffset = Offset.zero;
  Offset startTouchOffset = Offset.zero;
  Offset endTouchOffset = Offset.zero;
  Color colorPickerButtonBackgroundColor=Colors.transparent;
  Color bigBrushButtonBackgroundColor=Colors.transparent;
  Color smallBrushButtonBackgroundColor=Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PlanItController>(
        init: PlanItController(),
        builder: (context) =>ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            Stack(
              children: [
                const ScreenHeader(),
                getPlayGroundDesign(context),
              ],
            )
          ],
        ),
      )
    );

  }
  Widget getHeaderIcons(context) =>  Padding(
    padding: EdgeInsets.only(top: 15.h,left: 15.w,right: 15.w),
    child: Row(
      children: [
        getColorPickerButton(),
        const Spacer(),
        getBigBrushButton(),
        const Spacer(),
        getDrawSmallBrushButton(),
        const Spacer(),
        getResetPlayButton(),
        const Spacer(),
        getScreenShootButton(context),
      ],
    ),
  );

  Widget getColorPickerButton() =>CircleAvatar(
    backgroundColor: colorPickerButtonBackgroundColor,
    child: IconButton(
      onPressed: () {
        colorPickerButtonBackgroundColor = Get.find<PlanItController>().changeColor(colorPickerButtonBackgroundColor, Colors.grey[500]!);
        showDialog(
          context: context,
          builder: (context) => getAlertDialogForColorPicker(),
        );
      },
      icon: Image.asset(brushColorImageAssetPath),
    ),
  );

  Widget getAlertDialogForColorPicker() => AlertDialog(
    title: const Text('Pick a color!'),
    content: SingleChildScrollView(
      child: ColorPicker(
        pickerColor: initialColor,
        onColorChanged: (Color color){
          initialColor = Get.find<PlanItController>().changeColor(initialColor, color);
        },
      ),
    ),
    actions: <Widget>[
      ElevatedButton(
        child: const Text('DONE'),
        onPressed: () {
          colorPickerButtonBackgroundColor = Get.find<PlanItController>().changeColor(colorPickerButtonBackgroundColor, Colors.transparent);
          Navigator.of(context).pop(); //dismiss the color picker
        },
      ),
    ],
  );
  Widget getBigBrushButton () => CircleAvatar(
    backgroundColor: bigBrushButtonBackgroundColor,
    child: IconButton(
      onPressed: () {
        smallBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(smallBrushButtonBackgroundColor, Colors.transparent);
        if(bigBrushButtonBackgroundColor == Colors.transparent) {
          bigBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(bigBrushButtonBackgroundColor, Colors.grey[500]!);
        } else {
          bigBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(bigBrushButtonBackgroundColor, Colors.transparent);
        }
      },
      icon: Image.asset(bigBrushColorImageAssetPath),
    ),
  );
  Widget getDrawSmallBrushButton() =>  CircleAvatar(
    backgroundColor: smallBrushButtonBackgroundColor,
    child: IconButton(
      onPressed: () {
        bigBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(bigBrushButtonBackgroundColor, Colors.transparent);
        if(smallBrushButtonBackgroundColor == Colors.transparent) {
          smallBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(smallBrushButtonBackgroundColor, Colors.grey[500]!);
        } else {
          smallBrushButtonBackgroundColor = Get.find<PlanItController>().changeColor(smallBrushButtonBackgroundColor, Colors.transparent);
        }
      },
      icon: Image.asset(smallBrushColorImageAssetPath),
    ),
  );
  Widget getResetPlayButton() => IconButton(
    onPressed: () {  },
    icon: Image.asset(resetImageAssetPath),
  );
  Widget getScreenShootButton(context) => IconButton(
    onPressed: () async{
      final path = await NativeScreenshot.takeScreenshot();
     if( path == null || path.isEmpty ) {
       ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text('Error taking the screenshot :('),
             backgroundColor: Colors.red,
           )
       );
       return null;// showSnackBar()
     }
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('The screenshot has been saved'),
           backgroundColor: Colors.green,
         )
     );
    },
    icon: Image.asset(capturedImageAssetPath),
  );
  Widget getBalls() =>Padding(
    padding:  EdgeInsets.only(right: 10.w),
    child: Column(
      children: imageModelList.map((e) {
        return Padding(
          padding:  EdgeInsets.only(bottom: 5.h),
          child: SizedBox(
            height: 30.h,
            width: 40.w,
            child: Stack(
              children: [
                Positioned(
                  top: e.x,
                  right: e.y,
                  child: Draggable<ImageModel>(
                    data: e,
                    feedback: e.image,
                    child: e.image,
                    onDragUpdate: (d){
                      setState(() {
                        e.y=d.globalPosition.dy;
                        e.x=d.globalPosition.dx;
                        print(e.x);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
  Widget getGameSurface() =>DragTarget<ImageModel>(
    builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
      return Stack(
        children: [
          Image.asset(gameImage,width: MediaQuery.of(context).size.width-50.w,height: 450.h,),
          if(bigBrushButtonBackgroundColor !=Colors.transparent||smallBrushButtonBackgroundColor!=Colors.transparent)...[
            GestureDetector(
              onPanStart: (details){
                startTouchOffset = Get.find<PlanItController>().getNewOffsetToPaint(newOffset: details.localPosition, oldOffset: startTouchOffset);
              },
              onPanUpdate: (details){
                endTouchOffset = Get.find<PlanItController>().getNewOffsetToPaint(newOffset: details.localPosition, oldOffset: endTouchOffset);
              },
              child: bigBrushButtonBackgroundColor !=Colors.transparent? CustomPaint(
                foregroundPainter: LinePainter(start: startTouchOffset,end: endTouchOffset,lineColor: initialColor,
                    strokeWidth: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width-50.w,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
              ) :
              smallBrushButtonBackgroundColor !=Colors.transparent?CustomPaint(
                foregroundPainter: LinePainter(start: startTouchOffset,end: endTouchOffset,lineColor: initialColor,
                    strokeWidth: 3),
                child: Container(
                  width: MediaQuery.of(context).size.width-50.w,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
              ):null,
            )
          ]
        ],
      );
    },
  );
  Widget getPlayGroundDesign(context)=>  Padding(
    padding: EdgeInsets.only(top: 55.h),
    child: Stack(
      children: [
        Image.asset(rectangleImageAssetPath,width: double.infinity),
        Column(
          children: [
            getHeaderIcons(context),

            Image.asset(aramithWordImage),
            Stack(
              children: [
                getGameSurface(),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: getBalls(),
                )
              ],
            )
          ],
        )
      ],
    ),
  );

}

class LinePainter extends CustomPainter{
  const LinePainter({required this.start,required this.end,required this.lineColor,required this.strokeWidth});
  final Offset start,end;
  final Color lineColor ;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth;

    Offset start = this.start;
    Offset end = this.end;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}
