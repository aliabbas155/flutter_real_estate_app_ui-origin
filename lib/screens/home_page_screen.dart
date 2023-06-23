import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_real_estate_app_ui/common/color_constants.dart';
import 'package:flutter_real_estate_app_ui/common/constants.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/filter_widget.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/floating_widget.dart';
import 'package:flutter_real_estate_app_ui/custom_widgets/image_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatelessWidget {
  final filterArray = [
    "Family Cars",
    "Small Cars",
    "Big Cars",
    "Automatic Cars",
  ];

  HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.kWhiteColor,
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingWidget(
        leadingIcon: Icons.explore,
        txt: "Map view",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                "Welcome To CarDekhlo Showrooms",
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: ColorConstant.kGreyColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Honda Series",
                style: GoogleFonts.notoSans(
                  fontSize: 36,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: .3,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: filterArray.length,
                  itemBuilder: (context, index) {
                    return FilterWidget(
                      filterTxt: filterArray[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  Constants.carsList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ImageWidget(
                        Constants.carsList[index],
                        index,
                        Constants.imageList,
                        Constants.carImageList[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
