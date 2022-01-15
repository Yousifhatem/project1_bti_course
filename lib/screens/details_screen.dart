
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/data/dummy_data_bottom_sheet.dart';
import 'package:project1_bti/widget/fav_bar_widget.dart';

class DetailsScreen extends StatelessWidget {
  String imgUrl;
  String text;
  DetailsScreen(this.imgUrl, this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(imgUrl,width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height * 0.5, fit: BoxFit.cover,),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon:  Align(
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                    alignment: Alignment(0,50.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),maxLines: 2,),
                            SizedBox(width: 5.w,),
                            Expanded(
                              child: Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(20),
                                margin: EdgeInsets.only(right: 10.w),
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/images/play.png'),
                                ),
                              ),
                            ),
                          ],
                      ),
                      SizedBox(height: 15.h,),
                       Text('text'.tr(), style: const TextStyle(color: Colors.grey, fontSize: 18), maxLines: 3,
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/images/person.png'),
                          ),
                          SizedBox(width: 15.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text('jane'.tr(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('followers'.tr(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            children: favBarItems.map((e) => FavBarWidget(e)).toList(),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
