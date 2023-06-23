import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app_ui/common/color_constants.dart';
import 'package:flutter_real_estate_app_ui/models/data_model.dart';
import 'package:flutter_real_estate_app_ui/screens/item_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ImageWidget extends StatelessWidget {
  cars house;
  int imgpath_index;
  List<String> imageList;
  List<String> carImageList;

  ImageWidget(
    this.house,
    this.imgpath_index,
    this.imageList,
    this.carImageList,
  );

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("##,###,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailScreen(
                  house,
                  imgpath_index,
                  carImageList,
                ),
              ),
            );
          },
          child: Container(
            height: 200,
            width: screenWidth,
            padding: EdgeInsets.only(left: 16, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageList[imgpath_index],
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: ColorConstant.kWhiteColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "PKR " + "${oCcy.format(house.Price)}",
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                house.Car,
                style: GoogleFonts.notoSans(
                  fontSize: 15,
                  color: ColorConstant.kGreyColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
          child: Text(
            house.Engine.toString() +
                " (Engine) / " +
                house.Model.toString() +
                " (Model) / " +
                house.HorsePower.toString() +
                " (HorsePower) / " +
                house.Mileage.toString() +
                " (Mileage)",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
