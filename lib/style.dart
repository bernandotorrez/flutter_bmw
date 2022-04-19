import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF1C69D4);
const kBlackColor = Color(0xFF3E3F41);
const kAccentColor = Color(0xFF4483D9);
const kBackgroundColor = Color(0xFFF3F3F7);
const kBackgroundCardColor = Color(0xFFFAFBFB);

const kHeaderText = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: kBlackColor,
  letterSpacing: 1.2
);

const kCardtitle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: kPrimaryColor
);

const kCardDetail = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: kBlackColor
);

TextStyle kCarModelList(index, selectedIndex) {
  if(index == selectedIndex) {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        letterSpacing: 1.2
    );
  } else {
    return TextStyle(
        color: kBlackColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        letterSpacing: 1.2
    );
  }

}

const kDetailPagePowerText = TextStyle(color: kBackgroundColor, fontSize: 16);
const kDetailPageBoldText = TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);