import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/admin_services.dart';
import 'package:health_services/auth/login_screen.dart';
import 'package:health_services/models/doctors_model.dart';
import 'package:health_services/user/fetch_doctors.dart';
import 'package:health_services/user/user_services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class UserDoctors extends StatefulWidget {
  static const routeName = '/userDoctors';
  const UserDoctors({super.key});

  @override
  State<UserDoctors> createState() => _UserDoctorsState();
}

class _UserDoctorsState extends State<UserDoctors> {
  List<Doctors> doctors = [
    Doctors(
      name: 'عظام',
    ),
    Doctors(
      name: "قلب",
    ),
    Doctors(
      name: "عيون",
    ),
    Doctors(
      name: "أطفال",
    ),
    Doctors(
      name: "مخ و أعصاب",
    ),
  ];
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
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 15.w,
                      right: 15.w,
                      bottom: 15.h,
                    ),
                    crossAxisCount: 6,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FetchDoctors(
                                speciality: doctors[index].name,
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
                                child: Text("${doctors[index].name}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(3, index.isEven ? 3 : 3),
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 3.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
