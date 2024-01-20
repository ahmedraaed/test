import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiSelectedComponent extends StatefulWidget {
  const MultiSelectedComponent({Key? key}) : super(key: key);

  @override
  State<MultiSelectedComponent> createState() => _MultiSelectedComponentState();
}

class _MultiSelectedComponentState extends State<MultiSelectedComponent> {
  List<bool> currentValue=[false,false,false,false,false,];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
        return Row(
          children: [
            Checkbox(value: currentValue[index], onChanged: (value) {
              setState(() {
                currentValue[index]=value!;
              });
            },),
            SizedBox(width: 10.w,),
            Text("answer ${index}"),
          ],
        );
      }, separatorBuilder: (context, index) {
        return SizedBox(height: 10.h,);
      }, itemCount: currentValue.length);
  }
}
