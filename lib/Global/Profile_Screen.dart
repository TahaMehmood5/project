import 'package:discipline_committee/Global/Widgets/constant.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/screens/Admin/NewReport.dart';
import 'package:discipline_committee/screens/HOC/Add_Committee.dart';
import 'package:discipline_committee/screens/Student/AppealForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  //

  //
  //Shared Preference start
  bool _hasDengue = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeSetting();
  }

  void _loadDarkModeSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _hasDengue = prefs.getBool('Has_Dengue') ?? false;
    });
  }

  // ignore: non_constant_identifier_names
  void _DengueStatussetting(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Has_Dengue', value);
  }

  //Shared Preference End
  //User? u = loggedInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 242, 242),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            // user card
            BigUserCard(
              cardRadius: 20,
              backgroundMotifColor: Colors.white,
              settingColor: Colors.amber,
              //userName: loggedInUser!.name,
              userName: "Dr Naseer Ahmad Sajid",
              userProfilePic: AssetImage("assets/images.png"),
              // userProfilePic: NetworkImage(
              //   "",
              //   //imgpath + loggedInUser!.image!,
              // ),

              userMoreInfo: TextWidget(
                title: "",
                //title: loggedInUser!.email,
                txtSize: 10,
                txtColor: txtColor,
              ),

              role: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 35,
                  width: 160,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: bkColor,
                      // backgroundColor: loggedInUser!.role == "admin"
                      //     ? tbtnColor
                      //     : loggedInUser!.role == "Officer"
                      //         ? greenColor
                      //         : loggedInUser!.role == "user"
                      //             ? txtColor
                      //             : ScfColor,
                      shadowColor: const Color.fromARGB(255, 255, 255, 255),
                      //elevation: 5,
                    ),
                    onPressed: (() {}),
                    child: Text(
                      "Committee Member",
                      // loggedInUser!.role,
                      style: GoogleFonts.gemunuLibre(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: btnColor,

              cardActionWidget: SettingsItem(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ProfileEditScreen(),
                  //   ),
                  // );
                },
                icons: CupertinoIcons.pencil,
                iconStyle: IconStyle(
                  backgroundColor: btnColor,
                ),
                title: 'Modify',
                subtitle: "Tap here to change your data",
              ),
            ),
            SettingsGroup(items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.pencil_outline,
                iconStyle: IconStyle(),
                title: 'Change Password',
                subtitle: "Change Previous Password",
              ),
              SettingsItem(
                backgroundColor: btnColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewReport_Screen(),
                    ),
                  );
                },
                icons: Icons.admin_panel_settings_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.red,
                ),
                title: 'New Case',
                subtitle: "Add New Case Against Student",
              ),
              // SettingsItem(
              //   onTap: () {},
              //   icons: _hasDengue
              //       ? Icons.sentiment_very_dissatisfied
              //       : Icons.emoji_emotions_outlined,
              //   iconStyle: IconStyle(
              //     iconsColor: Colors.white,
              //     withBackground: true,
              //     backgroundColor: Colors.red,
              //   ),
              //   title: 'Status',
              //   subtitle: "Do you have Dengue?",
              //   trailing: Switch.adaptive(
              //     inactiveTrackColor:
              //         const Color.fromARGB(255, 255, 255, 255),
              //     inactiveThumbColor:
              //         const Color.fromARGB(255, 246, 195, 195),
              //     //enableFeedback: true,
              //     activeColor: btnColor,
              //     value: _hasDengue,
              //     onChanged: (value) {
              //       setState(
              //         () {
              //           _hasDengue = value;
              //           _DengueStatussetting(value);
              //         },
              //       );
              //     },
              //   ),
              // ),
              SettingsItem(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const AboutUs_Screen(),
                  //   ),
                  // );
                },
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.purple,
                ),
                title: 'About',
                subtitle: "Learn more about us",
              ),
              //     SettingsItem(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (context) => const AppealForm_Screen(),
              //           ),
              //         );
              //       },
              //       icons: Icons.info_rounded,
              //       iconStyle: IconStyle(
              //         backgroundColor: Colors.purple,
              //       ),
              //       title: 'Appeal',
              //       subtitle: "Learn more about us",
              //     ),
              //   ],
              // ),

              // You can add a settings title
            ]),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    // loggedInUser = null;
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const LoginScreen(),
                    //   ),
                    // );
                  },
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  title: "Log Out",
                  subtitle: "You will be logged out.",
                ),

                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.repeat,
                //   title: "Change email",
                // ),
                // SettingsItem(
                //   onTap: () {
                //     //Dialog
                //     showDialog(
                //       //useSafeArea: true,
                //       //To disable alert background
                //       barrierDismissible: false,
                //       context: context,
                //       builder: (context) => AlertDialog(
                //         //title: const Text("Alert Dialog Box"),
                //         //content: const Text("Do you want to login?"),
                //         actions: <Widget>[
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               IconButton(
                //                 onPressed: (() {
                //                   Navigator.of(context).pop();
                //                 }),
                //                 icon: const Icon(Icons.cancel_outlined),
                //               ),
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           TextWidget(
                //             title: "Do you want to delete your account?",
                //             txtSize: 20,
                //             txtColor: txtColor,
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               TextButton(
                //                 onPressed: () {
                //                   // Navigator.push(
                //                   //     context,
                //                   //     MaterialPageRoute(
                //                   //       builder: (context) =>
                //                   //           const OfficersListScreen(),
                //                   //     ));
                //                 },
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     color: btnColor,
                //                     borderRadius: BorderRadius.circular(25),
                //                   ),
                //                   padding: const EdgeInsets.symmetric(
                //                     horizontal: 25,
                //                     vertical: 10,
                //                   ),
                //                   child: const TextWidget(
                //                       title: "No",
                //                       txtSize: 15,
                //                       txtColor: Colors.white),
                //                 ),
                //               ),
                //               TextButton(
                //                 onPressed: () {
                //                   Navigator.of(context).pop();
                //                 },
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     color: btnColor,
                //                     borderRadius: BorderRadius.circular(25),
                //                   ),
                //                   padding: const EdgeInsets.symmetric(
                //                     horizontal: 25,
                //                     vertical: 10,
                //                   ),
                //                   child: const TextWidget(
                //                       title: "Yes",
                //                       txtSize: 15,
                //                       txtColor: Colors.white),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                //   icons: CupertinoIcons.delete_solid,
                //   iconStyle: IconStyle(
                //     backgroundColor: Colors.redAccent,
                //   ),
                //   title: "Delete account",
                //   titleStyle: const TextStyle(
                //     color: Colors.red,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   subtitle: "Your data will be be removed.",
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
