import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/admin_list.dart';
import 'package:health_services/admin/admin_services.dart';
import 'package:health_services/auth/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminCount extends StatefulWidget {
  static const routeName = '/adminCount';
  const AdminCount({super.key});

  @override
  State<AdminCount> createState() => _AdminCountState();
}

class _AdminCountState extends State<AdminCount> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<String> userlist = [];
  List<String> bookinglist = [];
  List<String> doctorslist = [];
  List<String> nurseslist = [];
  List<String> sitterslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchServices();
    fetchBookings();
    fetchDoctors();
    fetchnurses();
    fetchsitters();
  }

  void fetchServices() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = await database.reference().child("users");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      userlist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  void fetchBookings() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = await database.reference().child("bookings");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      bookinglist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  void fetchDoctors() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("services");
    base.orderByChild("type").equalTo("طبيب").onChildAdded.listen((event) {
      doctorslist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  void fetchnurses() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("services");
    base.orderByChild("type").equalTo('ممرض').onChildAdded.listen((event) {
      nurseslist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  void fetchsitters() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("services");
    base.orderByChild("type").equalTo('جليس').onChildAdded.listen((event) {
      sitterslist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

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
                "الأحصائيات",
                style: TextStyle(color: Colors.white),
              )),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 170.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(children: [
                              SizedBox(height: 30.h),
                              Text(
                                'عدد المرضى',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                '${userlist.length}',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          width: 150.w,
                          height: 170.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(children: [
                              SizedBox(height: 30.h),
                              Text(
                                "عدد الحجوزات",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                '${bookinglist.length}',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ]),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 170.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(children: [
                              SizedBox(height: 30.h),
                              Text(
                                "عدد الاطباء",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                '${doctorslist.length}',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          width: 150.w,
                          height: 170.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(children: [
                              SizedBox(height: 30.h),
                              Text(
                                "عدد الممرضين",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                '${nurseslist.length}',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ]),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Container(
                    width: 150.w,
                    height: 170.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(children: [
                        SizedBox(height: 30.h),
                        Text(
                          "عدد الجليسات",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          '${sitterslist.length}',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
