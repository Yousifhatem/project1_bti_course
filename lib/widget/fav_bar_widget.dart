
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/model/fav_mode.dart';

class FavBarWidget extends StatelessWidget {

  FavModel favModel;
  FavBarWidget(this.favModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
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
              backgroundImage: AssetImage(favModel.barImg),
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
            favModel.favName,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
