library services;

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deborduurshop/src/models/models.dart';
import 'package:deborduurshop/src/utils/const.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:retrofit/retrofit.dart';

part 'api/gpt_api.dart';
part 'firestore/firestore_services.dart';
part 'servicesg.dart';
part 'storage_service/storage_service.dart';
part 'utility_services/device_info_service.dart';

class Api {
  static const _baseUrl = 'https://api.openai.com/v1';
  static const _apiKey = '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';
  static const _timeOut = Duration(milliseconds: 50000);

  static final client = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
    ),
  )..interceptors.add(AuthInterceptor());
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(options, handler) {
    options.headers['Authorization'] = 'Bearer ${Api._apiKey}';
    return handler.next(options);
  }
}
