import 'dart:io';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_services/admin/admin_home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class AddService extends StatefulWidget {
  static const routeName = '/addService';
  AddService({
    super.key,
  });

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String imageUrl = '';
  File? image;
  String imageUrl2 = '';
  File? image2;
  String dropdownValue = "طبيب";
  String dropdownValue2 = "عظام";
  String dropdownValue3 = "عام";
  String dropdownValue4 = "مسنيين";
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var experienceController = TextEditingController();
  var appointmentController = TextEditingController();
  var specialityController = TextEditingController();

  @override
  Future pickImageFromDevice() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    final tempImage = File(xFile.path);
    setState(() {
      image = tempImage;
      print(image!.path);
    });

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refrenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await refrenceImageToUpload.putFile(File(xFile.path));

      imageUrl = await refrenceImageToUpload.getDownloadURL();
    } catch (error) {}
    print(imageUrl);
  }

  @override
  Future pickImageFromDevice2() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    final tempImage = File(xFile.path);
    setState(() {
      image2 = tempImage;
      print(image2!.path);
    });

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refrenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await refrenceImageToUpload.putFile(File(xFile.path));

      imageUrl2 = await refrenceImageToUpload.getDownloadURL();
    } catch (error) {}
    print(imageUrl2);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                        ),
                        Text("صاحب الخدمة"),
                        SizedBox(
                          width: 100.w,
                        ),
                        Text("صورة الكارنيه")
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          child: Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundColor:
                                        Color.fromARGB(255, 188, 204, 245),
                                    backgroundImage: image == null
                                        ? null
                                        : FileImage(image!),
                                  )),
                              Positioned(
                                  top: 110,
                                  left: 110,
                                  child: SizedBox(
                                    width: 50,
                                    child: RawMaterialButton(
                                        // constraints: BoxConstraints.tight(const Size(45, 45)),
                                        elevation: 10,
                                        fillColor: Color(0xFF2661FA),
                                        child: const Align(
                                            // ignore: unnecessary_const
                                            child: Icon(Icons.add_a_photo,
                                                color: Colors.white, size: 22)),
                                        padding: const EdgeInsets.all(15),
                                        shape: const CircleBorder(),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Choose option',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF2661FA))),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              pickImageFromDevice();
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .image,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Gallery',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              // pickImageFromCamera();
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .camera,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Camera',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove_circle,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Remove',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }),
                                  )),
                            ],
                          ),
                        ),
                        Align(
                          child: Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundColor:
                                        Color.fromARGB(255, 188, 204, 245),
                                    backgroundImage: image2 == null
                                        ? null
                                        : FileImage(image2!),
                                  )),
                              Positioned(
                                  top: 110,
                                  left: 110,
                                  child: SizedBox(
                                    width: 50,
                                    child: RawMaterialButton(
                                        // constraints: BoxConstraints.tight(const Size(45, 45)),
                                        elevation: 10,
                                        fillColor: Color(0xFF2661FA),
                                        child: const Align(
                                            // ignore: unnecessary_const
                                            child: Icon(Icons.add_a_photo,
                                                color: Colors.white, size: 22)),
                                        padding: const EdgeInsets.all(15),
                                        shape: const CircleBorder(),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Choose option',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF2661FA))),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              pickImageFromDevice2();
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .image,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Gallery',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              // pickImageFromCamera();
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .camera,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Camera',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            splashColor:
                                                                HexColor(
                                                                    '#FA8072'),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove_circle,
                                                                      color: Color(
                                                                          0xFF2661FA)),
                                                                ),
                                                                Text('Remove',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ))
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Color(0xFF2661FA)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),

                        // Step 3.
                        value: dropdownValue,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.arrow_drop_down,
                              color: Color(0xFF2661FA)),
                        ),

                        // Step 4.
                        items: ['طبيب', "ممرض", "جليس"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 21, color: Color(0xFF2661FA)),
                              ),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    dropdownValue == 'طبيب'
                        ? DecoratedBox(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Color(0xFF2661FA)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: SizedBox(),

                              // Step 3.
                              value: dropdownValue2,
                              icon: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(Icons.arrow_drop_down,
                                    color: Color(0xFF2661FA)),
                              ),

                              // Step 4.
                              items: [
                                "عظام",
                                "قلب",
                                "عيون",
                                "أطفال",
                                "مخ و أعصاب"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Color(0xFF2661FA)),
                                    ),
                                  ),
                                );
                              }).toList(),
                              // Step 5.
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                            ),
                          )
                        : dropdownValue == "ممرض"
                            ? DecoratedBox(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color(0xFF2661FA)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: SizedBox(),

                                  // Step 3.
                                  value: dropdownValue3,
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(Icons.arrow_drop_down,
                                        color: Color(0xFF2661FA)),
                                  ),

                                  // Step 4.
                                  items: [
                                    "عام",
                                    "جراحى",
                                    "نسائى",
                                    "وظيفى",
                                    "نفسى",
                                    "اسرى"
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Color(0xFF2661FA)),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue3 = newValue!;
                                    });
                                  },
                                ),
                              )
                            : DecoratedBox(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color(0xFF2661FA)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: SizedBox(),

                                  // Step 3.
                                  value: dropdownValue4,
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(Icons.arrow_drop_down,
                                        color: Color(0xFF2661FA)),
                                  ),

                                  // Step 4.
                                  items: [
                                    "مسنيين",
                                    "اطفال",
                                    "اعاقة او مرض مزمن"
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Color(0xFF2661FA)),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue4 = newValue!;
                                    });
                                  },
                                ),
                              ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 65.h,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: HexColor('#155564'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2661FA), width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          hintText: "اسم صاحب الخدمة",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 65.h,
                      child: TextField(
                        controller: experienceController,
                        decoration: InputDecoration(
                          fillColor: HexColor('#155564'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2661FA), width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          hintText: "الخبرة",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 65.h,
                      child: TextField(
                        controller: appointmentController,
                        decoration: InputDecoration(
                          fillColor: HexColor('#155564'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2661FA), width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          hintText: "المواعيد",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 65.h,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          fillColor: HexColor('#155564'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2661FA), width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          hintText: "رقم الهاتف",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: double.infinity, height: 65.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2661FA),
                        ),
                        onPressed: () async {
                          String name = nameController.text.trim();
                          String experience = experienceController.text.trim();
                          String appointment =
                              appointmentController.text.trim();
                          String phone = phoneController.text.trim();

                          if (name.isEmpty ||
                              experience.isEmpty ||
                              appointment.isEmpty ||
                              imageUrl.isEmpty ||
                              phone.isEmpty ||
                              imageUrl2.isEmpty) {
                            CherryToast.info(
                              title: Text('Please Fill all Fields'),
                              actionHandler: () {},
                            ).show(context);
                            return;
                          }

                          User? user = FirebaseAuth.instance.currentUser;

                          if (user != null) {
                            String uid = user.uid;
                            int date = DateTime.now().millisecondsSinceEpoch;

                            DatabaseReference companyRef = FirebaseDatabase
                                .instance
                                .reference()
                                .child('services');

                            String? id = companyRef.push().key;
                            if (dropdownValue == "طبيب") {
                              await companyRef.child(id!).set({
                                'imageUrl': imageUrl,
                                'id': id,
                                'name': name,
                                'experience': experience,
                                'appointment': appointment,
                                'type': dropdownValue,
                                'speciality': dropdownValue2,
                                'imageUrl2': imageUrl2,
                                'phone': phone,
                              });
                            } else if (dropdownValue == "ممرض") {
                              await companyRef.child(id!).set({
                                'imageUrl': imageUrl,
                                'id': id,
                                'name': name,
                                'experience': experience,
                                'appointment': appointment,
                                'type': dropdownValue,
                                'speciality': dropdownValue3,
                                'imageUrl2': imageUrl2,
                                'phone': phone,
                              });
                            }
                            {
                              await companyRef.child(id!).set({
                                'imageUrl': imageUrl,
                                'id': id,
                                'name': name,
                                'experience': experience,
                                'appointment': appointment,
                                'type': dropdownValue,
                                'speciality': dropdownValue4,
                                'imageUrl2': imageUrl2,
                                'phone': phone,
                              });
                            }
                          }
                          showAlertDialog(context);
                        },
                        child: Text(
                          'حفظ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget remindButton = TextButton(
    style: TextButton.styleFrom(
      primary: HexColor('#6bbcba'),
    ),
    child: Text("Ok"),
    onPressed: () {
      Navigator.pushNamed(context, AdminHome.routeName);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text("تم أضافة صاحب الخدمة"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
