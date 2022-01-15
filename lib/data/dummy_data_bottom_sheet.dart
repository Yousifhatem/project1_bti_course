
import 'package:easy_localization/src/public_ext.dart';
import 'package:project1_bti/model/authors_model.dart';
import 'package:project1_bti/model/bottom_sheet_model.dart';
import 'package:project1_bti/model/fav_mode.dart';
import 'package:project1_bti/model/types_model.dart';

List<BottomSheetModel> bottomSheets = [
  BottomSheetModel(
      title: 'financial'.tr(),
      imgUrlb: 'assets/images/img1.jpg',
      description: 'natasha'.tr()
  ),
  BottomSheetModel(
      title: 'minimalism'.tr(),
      imgUrlb: 'assets/images/img2.jpg',
      description: 'jane'.tr(),
  ),
  BottomSheetModel(
      title: 'bisnis'.tr(),
      imgUrlb: 'assets/images/img3.jpg',
      description: 'ronald'.tr(),
  ),
];

List<AuthorsModel> authorsSheets = [
  AuthorsModel(
      authorsName: 'jane'.tr(), authorsImg: 'assets/images/person.png'),
  AuthorsModel(
      authorsName: 'robert'.tr(), authorsImg: 'assets/images/person.png'),
  AuthorsModel(
      authorsName: 'anastacia'.tr(), authorsImg: 'assets/images/person.png'),
];


List<TypesModel> types = [
  TypesModel(imgUrl: 'assets/images/favorite.png', title: 'popular'.tr()),
  TypesModel(imgUrl: 'assets/images/trendingg.png', title: 'trending'.tr()),
  TypesModel(imgUrl: 'assets/images/history.png', title: 'recent'.tr()),
  TypesModel(imgUrl: 'assets/images/magic.png', title: 'magic'.tr()),

];

List<FavModel> favBarItems = [
  FavModel(favName: 'favorite'.tr(), barImg: 'assets/images/favorite.png'),
  FavModel(favName: 'trending'.tr(), barImg: 'assets/images/trendingg.png'),
  FavModel(favName: 'recent'.tr(), barImg: 'assets/images/history.png'),

];