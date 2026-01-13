import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_chatbot/config/app_colors.dart';
import 'package:ui_chatbot/core/constants/app_assets.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import '../features/auth/presentation/view/login_page.dart';
import '../features/feedback/feedback_page.dart';
import '../features/settings/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut(BuildContext context) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

    // try{
    //   auth.signOut();
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    // }catch(e){
    //   print("An error has occurred");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
            //logo
            DrawerHeader(
                child: Icon(Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                )),


                //home tile
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: AppText(text: "Home"),
                    leading:  SvgPicture.asset(
                      AppAssets.home,
                      width: 25.sp,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),

                ),

              //Query History
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: AppText(text: "History"),
                  leading: const Icon(Icons.history_outlined),
                  onTap: (){
                    Navigator.pop(context); // close main drawer

                    // open history drawer (ChatGPT-style)
                    Scaffold.of(context).openEndDrawer();
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const QueryHistoryPage()));

                  },
                ),

              ),

              //Feedback tile
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: AppText(text: "Feedback"),
                  leading:  SvgPicture.asset(AppAssets.support, width: 25.sp,),

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const FeedbackScreen()));

                  },
                ),

              ),

                //settings list tile
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: AppText(text: "Privacy Settings"),
                    leading:  SvgPicture.asset(AppAssets.settings, width: 25.sp,),

                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(

                      )));
                    },
                  ),
                ),

              ],
            ),
          //log out
          Padding(
            padding: EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              title: const AppText(
                text: "Sign out",
                color: AppColors.red,
              ),
              leading:  SvgPicture.asset(
                  AppAssets.signOut,
                width: 25.sp,
              ),
              onTap: (){
                logOut(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
