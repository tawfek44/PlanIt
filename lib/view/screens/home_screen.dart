
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:native_screenshot_ext/native_screenshot_ext.dart';
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
      ImageModel(image: Image.asset(ball1Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball2Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball3Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball4Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball5Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball6Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball7Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball8Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball9Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball10Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball11Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball12Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball13Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball14Image),x: Offset.zero.dx,y: Offset.zero.dx),
      ImageModel(image: Image.asset(ball15Image),x: Offset.zero.dx,y: Offset.zero.dx),
    ];
    super.initState();
  }
  GlobalKey globalKey=GlobalKey();
  Color initialColor = Colors.white;
  Offset ballTwoOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          Stack(
            children: [
              const ScreenHeader(),
              getPlayGroundDesign(),
            ],
          )
        ],
      )
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
          onPressed: () async{
            final path = await NativeScreenshot.takeScreenshot();
            if( path == null || path.isEmpty ) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error taking the screenshot :('),
                    backgroundColor: Colors.red,
                  )
              ); // showSnackBar()

              return;
            } // if error

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('The screenshot has been saved'),
                  backgroundColor: Colors.green,
                )
            );
          },
          icon: Image.asset(capturedImageAssetPath),
        ),
      ],
    ),
  );
  Widget getBalls() =>Column(
    children: imageModelList.map((e) {
      return SizedBox(
        height: 40.h,
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
      );
    }).toList(),
  );
  Widget getGameSurface() =>DragTarget<ImageModel>(
    builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
      return Image.asset(gameImage,width: MediaQuery.of(context).size.width-50.w);
    },
  );
  Widget getPlayGroundDesign()=>  Padding(
    padding: EdgeInsets.only(top: 55.h),
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
            Stack(
              //alignment: AlignmentDirectional.topStart,
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
