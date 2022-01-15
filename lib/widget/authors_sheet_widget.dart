import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/model/authors_model.dart';

class AuthorsSheetWidget extends StatelessWidget {

  AuthorsModel authorsModel;
  AuthorsSheetWidget(this.authorsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(authorsModel.authorsImg),
          ),
          SizedBox(height: 10.h,),
          Text(
            authorsModel.authorsName,
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
