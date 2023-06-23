// import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_real_estate_app_ui/common/color_constants.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/floating_widget.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/house_widget.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/menu_widget.dart';
import 'package:flutter_real_estate_app_ui/models/data_model.dart';
import 'package:intl/intl.dart';

import 'package:google_fonts/google_fonts.dart';

class ItemDetailScreen extends StatelessWidget {
  cars car;
  List<String> imageList;
  int imgpath_index;
  ItemDetailScreen(this.car, this.imgpath_index, this.imageList, {Key? key})
      : super(key: key);
  final carArray = [
    "2023",
    "Steel",
    "10/10",
    "Super",
    "Best",
  ];
  final typeArray = [
    "Model",
    "Frame",
    "Design",
    "H-power",
    "Mileage",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = NumberFormat("##,###,###", "en_INR");
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.kWhiteColor,
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingWidget(
              leadingIcon: Icons.mail,
              txt: "Message",
            ),
            FloatingWidget(
              leadingIcon: Icons.phone,
              txt: "Call",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: SizedBox(
                      height: 200.0,
                      width: screenWidth,
                      child: AnotherCarousel(
                        images: [
                          ExactAssetImage(imageList[0]),
                          ExactAssetImage(imageList[1]),
                          ExactAssetImage(imageList[2]),
                          ExactAssetImage(imageList[3]),
                        ],
                        showIndicator: true,
                        borderRadius: false,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                        overlayShadow: false,
                        overlayShadowColors: Colors.white,
                        overlayShadowSize: 0.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MenuWidget(
                            iconImg: Icons.arrow_back,
                            iconColor: ColorConstant.kWhiteColor,
                            conBackColor: Colors.transparent,
                            onbtnTap: () {
                              Navigator.of(context).pop(false);
                            }),
                        MenuWidget(
                          iconImg: Icons.star,
                          iconColor: Colors.yellow,
                          conBackColor: Colors.transparent,
                          onbtnTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PKR ${oCcy.format(car.Price)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.red),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            car.Car,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Registered",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  "Car Information",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    color: ColorConstant.kBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: carArray.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: HouseWidget(
                        type: typeArray[index],
                        number: carArray[index].toString(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "WELCOME",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: ColorConstant.kGreyColor,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
