import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/admin_services.dart';
import 'package:health_services/auth/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminHome extends StatefulWidget {
  static const routeName = '/adminHome';
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                title: Center(child: Text('الصفحة الرئيسية',style: TextStyle(
                  color: Colors.white
                ),)),
                actions: [
                      IconButton(
                        icon: const Icon(Icons.logout),
                        tooltip: 'Open shopping cart',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('تأكيد'),
                                  content: Text('هل انت متأكد من تسجيل الخروج'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pushNamed(
                                            context, LoginScreen.routeName);
                                      },
                                      child: Text('نعم'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('لا'),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                ),
                body:Column(
          children: [
            Image.asset('assets/images/doctor.jpg',height: 300.h),
            Text(
              'الخدمات المتاحة',
              style: TextStyle(fontSize: 27, color: HexColor('#32486d')),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(children: [
              SizedBox(width: size.width * 0.04),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AdminServices.routeName);
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
                      child: Text("أضافة صاحب خدمة",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              InkWell(
                onTap: () {
                
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
                      child: Text("الحجوزات",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
          ),
        ));
  }
}
