import 'package:flutter/material.dart';
import 'package:ui_chatbot/config/app_colors.dart';
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
      backgroundColor: AppColor.backgroundColor,
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
                    title: Text("H O M E"),
                    leading: Icon(Icons.home),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),

                ),

              //Query History
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("HISTORY"),
                  leading: const Icon(Icons.history_outlined),
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const QueryHistoryPage()));

                  },
                ),

              ),

              //Feedback tile
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("F E E D B A C K"),
                  leading: const Icon(Icons.feedback),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const FeedbackScreen()));

                  },
                ),

              ),

                //settings list tile
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: Text("S E T T I N G S"),
                    leading:  Icon(Icons.settings),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
                    },
                  ),
                ),

              ],
            ),
          //log out
          Padding(
            padding: EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading:  Icon(Icons.logout),
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
