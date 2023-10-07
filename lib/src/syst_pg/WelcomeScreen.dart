///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:mmt_cv_sochi/src/login/Login.dart';
import 'package:mmt_cv_sochi/src/login/Register.dart';
import 'package:mmt_cv_sochi/src/main_pg/CVModel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5b6c74),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 620),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:                    Image(
                              image: AssetImage("assets/images/Untitled-1.png"),
                              height: 150,
                              width: 250,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints: const BoxConstraints(minWidth: 150, maxWidth: 400),
                              child: 
                              const Text(
                                "Приветствуем в",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(minWidth: 150, maxWidth: 400),
                              child: 
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Text(
                                  "MMT-CV",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 28,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(minWidth: 120, maxWidth: 400),
                              child: 
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: Text(
                                  "Работайте с изображениями по-новому: точная модель, низкие требования к оборудованию",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    color: Color(0xffcdcdcd),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                            const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                            child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Login()),
                                    );
                                  },
                                  color: const Color(0xffd6fbe8),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  textColor: const Color(0xff393939),
                                  height: 50,
                                  child: const Text(
                                    "Войти",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 6,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Register()),
                                    );
                                  },
                                  color: const Color(0x00697a71),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                    side: const BorderSide(
                                        color: Color(0xff373636), width: 2),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  textColor: const Color(0xffdcffec),
                                  height: 50,
                                  child: const Text(
                                    "Создать аккаунт",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Text(
                                      "Ёще не готовы?",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xffc7c4c4),
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CVModel()),
                                      );
                                    },
                                    color: const Color(0x00ffffff),
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    textColor: const Color(0xffd9fcea),
                                    height: 40,
                                    minWidth: 90,
                                    child: const Text(
                                      "Тогда попробуйте",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
