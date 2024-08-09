import 'package:get/get.dart';

class ArtistsViewModel extends GetxController {
  final allList = [
    {
      "image": "assets/img/ar_1.png",
      "name": "ماهر المعيقلي",
      "albums": "4 مجموعه",
      "songs": "38 مطلب"
    },
    {
      "image": "assets/img/ar_2.png",
      "name": "مشاري العفاسي",
      "albums": "2 مجموعه",
      "songs": "18 مطلب"
    },
    {
      "image": "assets/img/ar_3.png",
      "name": "إدريس أبكر",
      "albums": "5 مجموعه",
      "songs": "46 مطلب"
    },
    {
      "image": "assets/img/ar_4.png",
      "name": "سعد الغامدي",
      "albums": "10 مجموعه",
      "songs": "112 مطلب"
    },
    {
      "image": "assets/img/ar_5.png",
      "name": "أحمد العجمي",
      "albums": "3 مجموعه",
      "songs": "32 مطلب"
    },
    {
      "image": "assets/img/ar_6.png",
      "name": "اسلام صبحي",
      "albums": "1 مجموعه",
      "songs": "13 مطلب"
    }
  ].obs;

  final albumsArr = [
    {
      "image": "assets/img/ar_d_1.png",
      "name": "تاریخ اسلام",
      "year": "2019",
    },
    {
      "image": "assets/img/ar_d_2.png",
      "name": "پاسخ به شبهات",
      "year": "2018",
    },
    {
      "image": "assets/img/ar_d_3.png",
      "name": "احادیث ضعیف",
      "year": "2017",
    },
    {
      "image": "assets/img/ar_d_4.png",
      "name": "دلایل عقلی توحید",
      "year": "2016",
    },
  ];

  final playedArr = [
    {"duration": "3:56", "name": "تراك 1", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 2", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 3", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 4", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 5", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 6", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 7", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 8", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 9", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 10", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 11", "artists": "حسن انصاری"},
    {"duration": "3:56", "name": "تراك 12", "artists": "حسن انصاری"}
  ].obs;
}
