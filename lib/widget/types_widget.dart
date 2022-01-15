import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/model/types_model.dart';

class TypesWidget extends StatelessWidget {

  TypesModel typesModel;
  TypesWidget(this.typesModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),

      child: Column(
        children:  [
           Container(
             width: 80.w,
             height: 80.h,
             decoration: const BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
             ),
             padding: const EdgeInsets.all(20),
             child: CircleAvatar(
               radius: 20,
              backgroundImage: AssetImage(typesModel.imgUrl),
          ),
           ),
           SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
                typesModel.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
                ,textAlign: TextAlign.center,
              ),
          ),
        ],
      ),
    );
  }
}
