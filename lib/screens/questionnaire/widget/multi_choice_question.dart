import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MultiChoiceQuestionnaireComponent extends StatefulWidget {
  MultiChoiceQuestionnaireComponent({Key? key}) : super(key: key);


  @override
  State<MultiChoiceQuestionnaireComponent> createState() => _MultiChoiceQuestionnaireState();
}

class _MultiChoiceQuestionnaireState extends State<MultiChoiceQuestionnaireComponent> {
  List<String> images=["assets/images/rate1.png","assets/images/rate2.png","assets/images/rate3.png","assets/images/rate4.png","assets/images/rate5.png",];
  List<String> imagesSelected=[];

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal,children: images.map((e) => GestureDetector(
      onTap: () {
        imagesSelected.clear();
        imagesSelected.add(e);
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
        height: 80.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
               height: 50.h,
              child: Opacity(
                opacity: imagesSelected.contains(e) ? 1 : .3,
                child: Image.asset(
                  e,
                ),
              ),
            ),
            Text("answer "),
          ],
        ),
      ),
    )).toList(),);
  }
}
