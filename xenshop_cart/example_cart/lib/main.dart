import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xenshop_core/xenshop_core.dart';

import 'app_pages.dart';
import 'translation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xenshop Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      getPages: pageRoutes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      initialBinding: BindingsBuilder(() {
        Get.put<NetworkInfo>(NetworkInfoImpl());
        Get.put<ErrorHandler>(
          ErrorHandlerImpl(networkInfo: Get.find<NetworkInfo>()),
          permanent: true,
        );
        Get.put<Dio>(
          Dio(
            BaseOptions(
              baseUrl: 'https://fakestoreapi.com',
              connectTimeout: const Duration(minutes: 1).inMilliseconds,
            ),
          )..interceptors.addAll([
              DioLoggingInterceptor(
                compact: true,
                level: Level.body,
                logPrint: (value) => developer.log(value.toString()),
              ),
            ]),
          permanent: true,
        );
      }),
    );
  }
}
