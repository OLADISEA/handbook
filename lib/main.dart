import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/service/consts.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/splash_screen/splash_screen.dart';
import 'firebase_options.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//final GlobalKey<BottomNavBarScreenState> bottomNavKey = GlobalKey();
//const String apiKey = String.fromEnvironment('API_KEY');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await QueryHistoryDB.initialize();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Gemini.init(apiKey: apiKey);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context)=> AuthBloc()),
    //BlocProvider(create: (context)=> QueryHistoryBloc(queryHistoryDB: QueryHistoryDB()))
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
