import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get baseUrl => dotenv.env['BASE_URL']!;

  static String get signUp => dotenv.env['SIGN_UP']!;
  static String get signIn => dotenv.env['SIGN_IN']!;
  static String get verifySignIn => dotenv.env['VERIFY_SIGN_IN']!;
  static String get signOut => dotenv.env['SIGN_OUT']!;
  static String get otp => dotenv.env['OTP']!;
  static String get resendOtp => dotenv.env['RESEND_OTP']!;
  static String get deleteAccount => dotenv.env['DELETE_ACCOUNT']!;
  static String get logOut => dotenv.env['LOG_OUT']!;
  static String get updateProfile => dotenv.env['UPDATE_PROFILE']!;
  static String get getProfile => dotenv.env['GET_PROFILE']!;
  static String get getDeliveryAddress => dotenv.env['GET_DELIVERY_ADDRESS']!;
  static String get getReferral => dotenv.env['GET_REFERRAL']!;
  static String get searchProduct => dotenv.env['SEARCH_PRODUCT']!;
  static String get globalSearch => dotenv.env['GLOBAL_SEARCH']!;
  static String get getProducts => dotenv.env['GET_PRODUCTS']!;
  static String get getOrderTracking => dotenv.env['GET_ORDER_TRACKING']!;
  static String get getOngoingOrder => dotenv.env['GET_ONGOING_ORDER']!;
  static String get review => dotenv.env['REVIEW']!;
  static String get orderSummary => dotenv.env['ORDER_SUMMARY']!;
  static String get faq => dotenv.env['FAQ']!;
  static String get wallet => dotenv.env['WALLET']!;
  static String get vendorTypes => dotenv.env['VENDOR_TYPES']!;
  static String get serviceTypes => dotenv.env['SERVICE_TYPES']!;
  static String get vendors => dotenv.env['VENDORS']!;
  static String get rating => dotenv.env['RATING']!;
  static String get serviceVendor => dotenv.env['SERVICE_VENDOR']!;
  static String get servicePayment => dotenv.env['SERVICE_PAYMENT']!;
  static String get carPayment => dotenv.env['CAR_PAYMENT']!;
  static String get maintenancePayment => dotenv.env['MAINTENANCE_PAYMENT']!;
  static String get reservation => dotenv.env['RESERVATION']!;
  static String get carService => dotenv.env['CAR_SERVICE']!;
  static String get maintenanceServiceStyle => dotenv.env['MAINTENANCE_SERVICE_STYLE']!;
  static String get carServiceSummary => dotenv.env['CAR_SERVICE_SUMMARY']!;
  static String get maintenanceServiceSummary => dotenv.env['MAINTENANCE_SERVICE_SUMMARY']!;
  static String get orderHistory => dotenv.env['ORDER_HISTORY']!;
  static String get cancelReservation => dotenv.env['CANCEL_RESERVATION']!;
  static String get orderHistoryDetails => dotenv.env['ORDER_HISTORY_DETAILS']!;
  static String get carTripType => dotenv.env['CAR_TRIP_TYPE']!;
  static String get favourites => dotenv.env['FAVOURITES']!;
  static String get singleVendor => dotenv.env['SINGLE_VENDOR']!;
}


