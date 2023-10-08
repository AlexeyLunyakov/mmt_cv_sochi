import 'dart:convert';
import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mmt_cv_sochi/src/login/ProfileScreen.dart';
import 'package:mmt_cv_sochi/src/main_pg/Left_Menu.dart';
import 'package:mmt_cv_sochi/src/main_pg/MEGAMEN.dart';
import 'package:mmt_cv_sochi/src/main_pg/Uploaded_files.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:file_picker/file_picker.dart'; 
// import 'package:open_file/open_file.dart';

// // Выбор изображения
Future<void> uploadImage() async {
  final picker = ImagePicker();
  List<XFile>? imageFileList = [];

  final List<XFile>? selectedImages = await picker.pickMultiImage();
  if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
  }
  List<String>? base64list = [];
  for (var i = 0; i < imageFileList.length; i++) {
    // print(imageFileList[i]);
    final imageBytes1 = await imageFileList[i].readAsBytes();
    final base64Image1 = base64.encode(imageBytes1);
    base64list.add(base64Image1);
  }
  // for (var i = 0; i < base64list.length; i++) {
  //   print(base64list[i]);
  //   print('\n\n\n\n new object \n\n\n\n');
  // }
  final json = {'files': base64list};
  final response = await http.post(
      Uri.parse('http://172.20.192.1:8080/text'),
      // headers: {HttpHeaders.contentTypeHeader: 'multipart/form-data'},
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(json),
    );
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (response.statusCode == 200) {
      print('Image uploaded successfully!');
    } else {
      print('Failed to upload image.');
    }

  // if (pickedFile != null) {
  //   final imageBytes = await pickedFile.readAsBytes();
  //   final base64Image = base64.encode(imageBytes);
  //   print(pickedFile);
  //   final json = {'files': base64Image};
    // print(base64Image);
    // final json = {'text': "hsdofhskjdf"};
    // final response = await http.post(
    //   Uri.parse('http://172.20.192.1:8080/text'),
    //   // headers: {HttpHeaders.contentTypeHeader: 'multipart/form-data'},
    //   headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    //   body: jsonEncode(json),
    // );

    // if (response.statusCode == 200) {
    //   print('Image uploaded successfully!');
    // } else {
    //   print('Failed to upload image.');
    // }
  // }
}

// Future<void> sendFilesToServer() async {
//   late List<File> newfiles;
//   FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);  
//   if (result != null) {
//     newfiles = result.paths.map((path) => File(path!)).toList();
//     print(newfiles);
//   } else {
//     // User canceled the picker
//   }

//   var request = http.MultipartRequest('POST', Uri.parse('http://172.20.192.1:8080/get_result'));
//   // request.files.addAll(newfiles);

//   var response = await request.send();

//   if (response.statusCode == 200) {
//     print('Files uploaded successfully');
//   } else {
//     print('Error uploading files');
//   }
// }


class CVModel extends StatelessWidget {
  final pageController = PageController();

  CVModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9fbe9),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff5c6e76),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xffdafbea),
            size: 24,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Left_Menu()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child:  IconButton(
              icon: const Icon(
                Icons.person,
                color: Color(0xffd9fae9),
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0x00000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MEGAMEN()),
                      );
                    },
                    color: const Color(0xff5c6d75),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    textColor: const Color(0xffd7fae7),
                    height: 60,
                    minWidth: 180,
                    child: const Text(
                      "MEGAMEN TEAM",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Uploaded_files()),
                              );
                            },
                            color: const Color(0xff5d6e76),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            padding: const EdgeInsets.all(10),
                            textColor: const Color(0xffd8fbe9),
                            height: 45,
                            minWidth: 130,
                            child: const Text(
                              "База Данных устройства",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: MaterialButton(
                            onPressed: () {
                              uploadImage();
                              // sendFilesToServer();
                            },
                            color: const Color(0xff5c6d75),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            padding: const EdgeInsets.all(10),
                            textColor: const Color(0xffdbfeeb),
                            height: 45,
                            minWidth: 130,
                            child: const Text(
                              "Ваши файлы",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 20, 30, 10),
                child: Text(
                  "Недавние изображения, распознанные моделью",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xff393939),
                  ),
                ),
              ),
              SizedBox(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                "assets/images/Untitled-1.png",
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 5,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                            dotColor: Color(0xff3b3a3a),
                            activeDotColor: Color(0xff5e6f76),
                            dotHeight: 10,
                            dotWidth: 10,
                            radius: 16,
                            spacing: 7,
                            expansionFactor: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Таблица предсказаний:",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 17,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                            child: Text(
                              "Предсказание",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Text(
                              "Имя файла",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                child: Text(
                  "Загруженные изображения",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xff393939),
                  ),
                ),
              ),
              GridView(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff5f7078),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child:
                          Image(
                        image: AssetImage("assets/images/Untitled-1.png"),
                        height: 100,
                        width: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff5d6e76),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child:
                          Image(
                        image: AssetImage("assets/images/Untitled-1.png"),
                        height: 100,
                        width: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff5e6f76),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child:
      
                          Image(
                        image: AssetImage("assets/images/Untitled-1.png"),
                        height: 100,
                        width: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff5d6e76),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child:
      
                          Image(
                        image: AssetImage("assets/images/Untitled-1.png"),
                        height: 100,
                        width: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xff808080),
                height: 16,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff5e6f76),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          Image(
                        image: AssetImage("assets/images/Untitled-1.png"),
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "ЮФО 2023",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffd8fae8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
