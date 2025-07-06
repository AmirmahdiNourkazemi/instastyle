import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instastyle/feature/status/data/model/status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final ValueNotifier<String> firstTokenNotifier = ValueNotifier('');
  static final ValueNotifier<String?> finalTokenNotifier = ValueNotifier(null);
  static final ValueNotifier<bool> isDark = ValueNotifier(false);
  static final ValueNotifier<StatusModel?> statusNotifier = ValueNotifier(null);
  static final ValueNotifier<String> userMobileNumberNotifier =
      ValueNotifier('');
  static final ValueNotifier<String> ImageUrlNotifier = ValueNotifier('');
  static final ValueNotifier<int?> freeUsageCount = ValueNotifier(1);
  static final ValueNotifier<int?> storeMessageCount = ValueNotifier(4);
  static final ValueNotifier<bool> isPaid = ValueNotifier(false);

  Future<void> saveStoreMessageCount(int count) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('storeMessageCount', count);
    loadStoreMessageCount();
  }

  Future<int?> loadStoreMessageCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    storeMessageCount.value = prefs.getInt('storeMessageCount');
  }

  Future<void> saveTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', theme);
    loadTheme();
  }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark.value = prefs.getBool('theme') ?? false;
  }

  Future<void> saveApproToken(String firstToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('approToken', firstToken);
    loadApproToken();
  }

  Future<void> loadApproToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTokenNotifier.value = prefs.getString('approToken') ?? '';
  }

  Future<void> saveFinalToken(String finalToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('finalToken', finalToken);
    loadFinalToken();
  }

  Future<void> loadFinalToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    finalTokenNotifier.value = prefs.getString('finalToken');
  }

  Future<void> saveStatus(StatusModel status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String statusJson = jsonEncode(status.toJson());
    prefs.setString('statusEntity', statusJson);
    statusNotifier.value = status;
    isPaid.value = status.products == null
        ? false
        : status.products!.isNotEmpty
            ? true
            : false;
    loadStatus();
  }

  Future<StatusModel?> loadStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? statusJson = prefs.getString('statusEntity');
    if (statusJson != null) {
      Map<String, dynamic> statusMap = jsonDecode(statusJson);
      return StatusModel.fromJson(statusMap);
    }
    return null; // Return null if not found
  }

  Future<void> saveUserMobileNumber(String userMobileNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userMobileNumber', userMobileNumber);
    loadUserMobileNumber();
  }

  Future<void> loadUserMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userMobileNumberNotifier.value = prefs.getString('userMobileNumber') ?? '';
  }

  Future<void> saveImageUrl(String image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image', image);
    loadImageUrl();
  }

  Future<void> loadImageUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ImageUrlNotifier.value = prefs.getString('image') ?? '';
  }

  Future<void> saveFreeUsageCount(int number) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('freeUsageCount', number);
    loadFreeUsageCount();
  }

  Future<int?> loadFreeUsageCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    freeUsageCount.value = prefs.getInt('freeUsageCount');
  }
}
