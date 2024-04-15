import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/add_service.dart';
import 'package:health_services/models/services_model.dart';
import 'package:health_services/user/booking_page.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FetchDoctors extends StatefulWidget {
  String speciality;
  static const routeName = '/fetchDoctors';
  FetchDoctors({required this.speciality});

  @override
  State<FetchDoctors> createState() => _FetchDoctorsState();
}

class _FetchDoctorsState extends State<FetchDoctors> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Services> servicesList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchServices();
  }

  @override
  void fetchServices() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = await database.reference().child("services");
    base.orderByChild("speciality").equalTo(widget.speciality).onChildAdded.listen((event) {
      print(event.snapshot.value);
      Services p = Services.fromJson(event.snapshot.value);
      servicesList.add(p);
      keyslist.add(event.snapshot.key.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                title: Text('بيانات صاحب الخدمة')),
            body: Column(children: [
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 15, left: 15, bottom: 10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(
                                          '${servicesList[index].imageUrl.toString()}',
                                          height: 100.h),
                                      SizedBox(height: 20.h),
                                      Image.network(
                                          '${servicesList[index].imageUrl2.toString()}',
                                          height: 100.h),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'اسم صاحب الخدمة : ${servicesList[index].name.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'نوع الخدمة : ${servicesList[index].type.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'الخبرة : ${servicesList[index].experience.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'المواعيد المتاحة : ${servicesList[index].appointment.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'رقم الهاتف : ${servicesList[index].phone.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: 120.w, height: 40.h),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF2661FA)),
                                          child: Text(
                                            "حجز موعد",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Booking(
                                                name: '${servicesList[index].name}', 
                                                type: '${servicesList[index].type}',
                                                
                                              );
                                            }));
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ])),
      ),
    );
  }
}
