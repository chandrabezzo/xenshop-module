import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xenshop_product/const/i18n/locales/product_en.dart';
import 'package:xenshop_product/const/i18n/locales/product_id.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static const fallbackLocale = Locale('id');

  static const Locale localizationEn = Locale('en');
  static const Locale localizationId = Locale('id');

  @override
  Map<String, Map<String, String>> get keys => {
    localizationEn.languageCode: productEn,
    localizationId.languageCode: productId
  };
}