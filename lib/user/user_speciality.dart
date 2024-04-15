import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/admin_services.dart';
import 'package:health_services/auth/login_screen.dart';
import 'package:health_services/user/user_doctors.dart';
import 'package:health_services/user/user_services.dart';
import 'package:hexcolor/hexcolor.dart';

class UserSpeciality extends StatefulWidget {
  static const routeName = '/userSpeciality';
  const UserSpeciality({super.key});

  @override
  State<UserSpeciality> createState() => _UserSpecialityState();
}

class _UserSpecialityState extends State<UserSpeciality> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              backgroundColor: Color(0xFF2661FA),
              title: Center(
                  child: Text(
                "التخصصات",
                style: TextStyle(color: Colors.white),
              )),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(children: [
                  SizedBox(width: size.width * 0.04),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, UserDoctors.routeName);
                    },
                    child: Container(
                      child: Container(
                        width: size.width * 0.45,
                        height: size.height * 0.30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xfff1665f),
                              Color(0xFF2661FA),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text("طبيب",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserServices(
                          type: "ممرض",
                        );
                      }));
                    },
                    child: Container(
                      child: Container(
                        width: size.width * 0.45,
                        height: size.height * 0.30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xfff1665f),
                              Color(0xFF2661FA),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text("ممرض",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: size.height * 0.04,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UserServices(
                        type: "جليس",
                      );
                    }));
                  },
                  child: Container(
                    child: Container(
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfff1665f),
                            Color(0xFF2661FA),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text("جليس",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
