
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/model/bottom_sheet_model.dart';
import 'package:project1_bti/screens/details_screen.dart';

class BottomSheetWidget extends StatelessWidget {

  BottomSheetModel bottomSheetModel;
  BottomSheetWidget(this.bottomSheetModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    width: 100.w,
                    height: 100.h,
                    clipBehavior: Clip.antiAlias,
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: GestureDetector(
                        child: Image.asset(bottomSheetModel.imgUrlb,fit: BoxFit.cover,),
                      onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  DetailsScreen(bottomSheetModel.imgUrlb, bottomSheetModel.title)));
                      },
                    ),
                  ),
                   SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bottomSheetModel.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(height: 10.h,),
                      Text(bottomSheetModel.description, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),),
                    ],
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
