import 'dart:io';
import 'package:ebook_app/controller/api.dart';
import 'package:ebook_app/view/login/ebook_login.dart';
import 'package:ebook_app/view/textfield_main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class EbookRegister extends StatefulWidget {
  EbookRegister({Key? key}) : super(key: key);

  @override
  State<EbookRegister> createState() => EbookRegisterState();
}

class EbookRegisterState extends State<EbookRegister> {
  File _file = File('');
  final imgPicker = ImagePicker();
  bool visibleLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register(
      {required TextEditingController name,
      required TextEditingController email,
      required TextEditingController password,
      required BuildContext context,
      required Widget widget}) async {
    setState(() {
      visibleLoading = true;
    });

    String getName = name.text;
    String getEmail = email.text;
    String getPassword = password.text;

    var req = http.MultipartRequest(
        'POST', Uri.parse(ApiConstant().baseUrl() + ApiConstant().register));
    var photo = await http.MultipartFile.fromPath('photo', _file.path);
    req.fields['name'] = getName;
    req.fields['email'] = getEmail;
    req.fields['password'] = getPassword;
    req.files.add(photo);
    var reponse = await req.send();

    if (reponse.statusCode == 200) {
      setState(() {
        visibleLoading = false;
      });
      //Add back login page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EbookLogin()));
    } else {
      setState(() {
        visibleLoading = false;
      });

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Name or email already on database',
                style: TextStyle(color: Colors.blue),
              ),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text('Okey'),
                )
              ],
            );
          });
    }
  }

  void imagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.library_add,
                  color: Colors.blue,
                ),
                title: Text(
                  'Photo from Gallery',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: Colors.blue,
                ),
                title: Text(
                  'Photo from camera',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  imageFromGallery() async {
    var imgFromGallery = await imgPicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 100,
        maxWidth: 100);
    setState(() {
      if (imgFromGallery != null) {
        _file = File(imgFromGallery.path);
      } else {
        print('This file dont have any data');
      }
    });
  }

  imageFromCamera() async {
    var imgFromCamera = await imgPicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 100,
        maxWidth: 100);
    setState(() {
      if (imgFromCamera != null) {
        _file = File(imgFromCamera.path);
      } else {
        print('This file dont have any data');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Create your account right now',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  imagePicker(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _file.path == ''
                          ? Image.asset(
                              'asset/images/register.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              _file,
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              TextFiledMain(
                  hintText: 'Enter your name',
                  textController: name,
                  iconFiled: Icons.account_circle_outlined),
              TextFiledMain(
                  hintText: 'Enter your email',
                  textController: email,
                  iconFiled: Icons.email_outlined),
              TextFiledMain(
                  textController: password,
                  hintText: 'Enter your password',
                  typePassword: true,
                  iconFiled: Icons.lock_outline),
              GestureDetector(
                onTap: () {
                  if (_file.path == "" ||
                      name.text == "" ||
                      email.text == "" ||
                      password.text == "") {
                    msgError("Warning", "You can't fileds empty");
                  } else {
                    register(
                        name: name,
                        email: email,
                        password: password,
                        context: context,
                        widget: widget);
                  }
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 20, left: 20, top: 17, bottom: 5),
                  padding:
                      EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 1.5.h),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: !visibleLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Create account',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Visibility(
                          visible: visibleLoading,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                      right: 20, left: 20, bottom: 5, top: 1.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => EbookLogin()),
                              (route) => false);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future msgError(String title, String description) {
    return Alert(
        context: context,
        type: AlertType.warning,
        onWillPopActive: true,
        title: title,
        desc: description,
        style: AlertStyle(
          animationType: AnimationType.fromBottom,
          backgroundColor: Colors.white,
          titleStyle: TextStyle(color: Colors.black),
          descStyle: TextStyle(color: Colors.black54), // Textstyle
        ),
        buttons: [
          DialogButton(
            padding: EdgeInsets.all(1),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ]).show();
  }
}
