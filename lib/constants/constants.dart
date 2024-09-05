import 'package:flutter/material.dart';

List<String> categories = [
  "Home",
  "Beauty",
  "Fragrances",
  "Furniture",
  "Groceries",
];

List<String> categoriesUrl = [
  "lib/assets/home.png",
  "lib/assets/beauty.png",
  "lib/assets/fragrances.png",
  "lib/assets/furniture.png",
  "lib/assets/groceries.png",
  "lib/assets/store.png",
];

// Colors
const kPrimaryColor = Colors.deepPurpleAccent;
const kSecondaryColor = Colors.purple;
const kTextColor = Colors.black54;
const kSubtitleColor = Colors.black45;
const kButtonTextColor = Colors.white;
const kPriceColor = Colors.black;
const kDiscountColor = Colors.deepPurpleAccent;
const kEmptyCartMessageColor = Colors.black45;

// Text Styles
const kAppBarTitleStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
const kProductTitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor);
const kBrandTextStyle = TextStyle(color: kSubtitleColor, fontWeight: FontWeight.bold);
const kPriceTextStyle = TextStyle(color: kPriceColor, fontSize: 22);
const kDiscountTextStyle = TextStyle(color: kDiscountColor, fontSize: 16);
const kStockTextStyle = TextStyle(fontSize: 12, color: kSubtitleColor);
const kBoldStockTextStyle = TextStyle(fontSize: 12, color: kSubtitleColor, fontWeight: FontWeight.bold);
const kProductDescriptionStyle = TextStyle(fontSize: 14, color: kSubtitleColor);
const kTotalLabelStyle = TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold);
const kTotalAmountStyle = TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold);
const kWarrantyTextStyle = TextStyle(color: kDiscountColor, fontWeight: FontWeight.w600);

// Padding and Margins
const kPaddingAll = EdgeInsets.all(8.0);
const kPaddingSymmetricHorizontal = EdgeInsets.symmetric(horizontal: 15);
const kPaddingVertical = EdgeInsets.symmetric(vertical: 10);
const kPaddingProductTile = EdgeInsets.symmetric(vertical: 4, horizontal: 12);

// Sizes
const kAppBarIconSize = 25.0;
const kCartIconSpacing = 15.0;
const kCardElevation = 1.0;
