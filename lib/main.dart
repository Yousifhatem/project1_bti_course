
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1_bti/widget/authors_sheet_widget.dart';
import 'package:project1_bti/widget/bottom_sheet_widget.dart';
import 'package:project1_bti/widget/types_widget.dart';

import 'data/dummy_data_bottom_sheet.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // دائما عند استخدام ال async await في main يجب كتابة السطر هذا

  await EasyLocalization
      .ensureInitialized(); // يتم انشاء مكتبة تعدد اللغات قبل تشغيل التطبيق
  //final List<Locale> systemLocales = WidgetsBinding.instance.window.locales; // Returns the list of locales that user defined in the system settings.
  //String locale = Intl.getCurrentLocale();
  //String locale = Intl.systemLocale;

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 820),
      builder: () => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: double.infinity.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/backg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
                        child: const Icon(Icons.list,  color: Colors.white,),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){

                          if (context.locale == const Locale('en')) {
                            context.setLocale(const Locale('ar'));
                          } else {
                            context.setLocale(const Locale('en'));
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'lang'.tr(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Text(
                            'browse'.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                           SizedBox(height: 15.h,),
                          Text(
                            'find_prodcast'.tr(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.bold, fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.h,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                fillColor: Colors.amberAccent,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(width: 1, color: Colors.white),
                                ),
                                hintText: 'typeKey'.tr(),
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                contentPadding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 20.h),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.w,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: types.map((elements) => TypesWidget(elements)).toList(),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                return Align(
                  alignment: const Alignment(0,0.85),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all( const EdgeInsets.all(7),),
                      backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                    ),
                    child: Text('show_bottom_sheet'.tr()),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.white,
                        context: context,
                        clipBehavior: Clip.antiAlias,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //color: Colors.red
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                            child: ListView(
                              children: [
                                Text('handpicked'.tr(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                SizedBox(height: 20.h,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: bottomSheets.map((e) => BottomSheetWidget(e)).toList(),
                                ),
                                SizedBox(height: 20.h,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Text('top_authors'.tr(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                                SizedBox(height: 20.h,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: authorsSheets.map((e) => AuthorsSheetWidget(e)).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ]
      ),
    );
  }
}