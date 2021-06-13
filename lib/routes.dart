import 'package:flutter/material.dart';
import 'package:mod/pages/ar/ar_page.dart';
import 'package:mod/pages/auth/login_page_default.dart';
import 'package:mod/pages/auth/verify_phone_page.dart';
import 'package:mod/pages/cart/cart_page.dart';
import 'package:mod/pages/favorite/favorite_page.dart';
import 'package:mod/pages/shop/shop_filter.dart';
import 'package:mod/pages/shop/shop_items.dart';

import 'pages/auth/login_page.dart';
import 'pages/auth/register_page.dart';
import 'pages/home/product_detail.dart';
import 'pages/home/home_page.dart';
import 'pages/onboard/onboard_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/shop/shop_page.dart';
import 'pages/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  HomePage.routeName: (context) => HomePage(),
  ProductDetail.routeName: (context) => ProductDetail(),
  ProfilePage.routeName: (context) => ProfilePage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  OnboardPage.routeName: (context) => OnboardPage(),
  VerifyPhonePage.routeName: (context) => VerifyPhonePage(),
  LoginPageDefault.routeName: (context) => LoginPageDefault(),
  ShopPage.routeName: (context) => ShopPage(),
  ShopItems.routeName: (context) => ShopItems(),
  ShopFilter.routeName: (context) => ShopFilter(),
  ArPage.routeName: (context) => ArPage(),
  CartPage.routeName: (context) => CartPage(),
  FavoritePage.routeName: (context) => FavoritePage(),
};
