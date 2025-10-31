import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AppStorageManager {
  final SharedPreferences prefs;
  final FlutterSecureStorage secureStorage;

  AppStorageManager({required this.prefs, required this.secureStorage});

  static const _kProfileKey = 'user_profile_details';



  Future<void> saveOnboardingCompleted(bool completed) async {
    await prefs.setBool('onboarding_completed', completed);
  }

  Future<bool> isOnboardingCompleted() async {
    return prefs.getBool('onboarding_completed') ?? false;
  }

  Future<void> setLoggedIn(bool logInStatus) async {
    await prefs.setBool('loggedIn', logInStatus);
  }

  Future<bool> getLoggedIn() async {
    return prefs.getBool('loggedIn') ?? false;
  }


  Future<void> saveAccessToken(String token) async =>
      await secureStorage.write(key: 'access_token', value: token);

  Future<String?> getAccessToken() async =>
      await secureStorage.read(key: 'access_token');

  Future<void> saveRefreshToken(String token) async =>
      await secureStorage.write(key: 'refresh_token', value: token);

  Future<String?> getRefreshToken() async =>
      await secureStorage.read(key: 'refresh_token');
  // ======================= PROFILE METHODS =======================


  //This is saved whenever the getProfile endpoint is called
  // Future<void> saveProfile(ProfileModel profile) async {
  //   final jsonString = jsonEncode(profile.toJson());
  //   await prefs.setString(_kProfileKey, jsonString);
  // }
  //
  // ProfileModel? getProfile() {
  //   final jsonString = prefs.getString(_kProfileKey);
  //   if (jsonString != null) {
  //     final map = jsonDecode(jsonString);
  //     return ProfileModel.fromJson(map);
  //   }
  //   return null;
  // }
  //
  //
  // //This one is saved during sign in
  // Future<void> saveUserProfile(UserModel profile) async {
  //   final jsonString = jsonEncode(profile.toJson());
  //   await prefs.setString('user_profile', jsonString);
  // }



  // UserModel? getUserProfile() {
  //   final jsonString = prefs.getString('user_profile');
  //   if (jsonString != null) {
  //     final map = jsonDecode(jsonString);
  //     return UserModel.fromJson(map);
  //   }
  //   return null;
  // }

  //For recent transactions
  static const _kRecentSearchKey = 'recent_searches';

  /// Save the entire recent-search list
  Future<void> saveRecentSearches(List<String> list) async {
    await prefs.setStringList(_kRecentSearchKey, list);
  }

  /// Load the recent-search list
  List<String> getRecentSearches() {
    return prefs.getStringList(_kRecentSearchKey) ?? <String>[];
  }


  static const String _keyName = "name";
  static const String _keyProgram = "program";
  static const String _keyEmail = "email";
  static const String _keyUsername = "username";
  static const String _keyRating = "rating";
  static const String _keyEaseOfUse = "ease_of_use";
  static const String _keySatisfaction = "satisfaction";
  static const String _keyAccuracy = "accuracy";
  static const String _keyRecommend = "recommend";

  // Save Name
  static Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  // Retrieve Name
  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  // Save Program
  static Future<void> saveProgram(String program) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyProgram, program);
  }

  // Retrieve Program
  static Future<String?> getProgram() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyProgram);
  }

  // Save Email
  static Future<void> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  // Retrieve Email
  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  // Save Username
  static Future<void> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  // Retrieve Username
  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  // Save Rating
  static Future<void> saveRating(double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyRating, rating);
  }

  // Retrieve Rating
  static Future<double?> getRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyRating);
  }

  // Save Ease of Use
  static Future<void> saveEaseOfUse(String easeOfUse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEaseOfUse, easeOfUse);
  }

  // Retrieve Ease of Use
  static Future<String?> getEaseOfUse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEaseOfUse);
  }

  // Save Satisfaction
  static Future<void> saveSatisfaction(String satisfaction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySatisfaction, satisfaction);
  }

  // Retrieve Satisfaction
  static Future<String?> getSatisfaction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySatisfaction);
  }

  // Save Accuracy
  static Future<void> saveAccuracy(String accuracy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccuracy, accuracy);
  }

  // Retrieve Accuracy
  static Future<String?> getAccuracy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccuracy);
  }

  // Save Recommendation
  static Future<void> saveRecommend(String recommend) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRecommend, recommend);
  }

  // Retrieve Recommendation
  static Future<String?> getRecommend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRecommend);
  }


  // ======================= CLEAR ALL =======================

  Future<void> clearAll() async {
    bool onboardingCompleted = await isOnboardingCompleted();

    await prefs.clear();
    await secureStorage.deleteAll();

    // Restore the onboarding status
    await saveOnboardingCompleted(onboardingCompleted);
  }
}
