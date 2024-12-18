import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/TeacherPages/Notifications.dart';
import 'package:edu_academy/view/TeacherPages/PageOne/contents/Page/FirstPage.dart';
import 'package:edu_academy/view/TeacherPages/TeacherMainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.Refresh, required this.InitData});
  final Function()? Refresh;
  final Function()? InitData;

  @override
  Widget build(BuildContext context) {
    return (PageWidth(context) >= 550 && PageHeight(context) < 900)
        ? Expanded(
            child: CMaker(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 6,
                              spreadRadius: .03,
                              color: Color.fromARGB(82, 0, 0, 0)),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 50,
                              padding: const EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: InkWell(
                                  onTap: () {
                                    PageIndex = 0;
                                    Refresh!();
                                  },
                                  child: Image.asset("images/Book.png"))),
                        ),
                        Expanded(
                          flex: 5,
                          child: CMaker(
                            height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: CMaker(
                                    padding: const EdgeInsets.only(bottom: 13),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      TeacherData.name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 5, 123, 151)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 == "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 1;
                                          return CMaker(
                                            padding: const EdgeInsets.only(
                                                bottom: 13),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              TeacherData.Subject1,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 89, 89, 87)),
                                            ),
                                          );
                                        }
                                        if (TeacherData.Subject1 != "null" &&
                                            TeacherData.Subject2 != "null" &&
                                            TeacherData.Subject3 == "null") {
                                          TeacherData.numberOfSubjects = 2;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData.SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                TeacherData.SubjectThatIsSelected =
                                                    value.toString();
                                                InitData!();
                                                Refresh!();
                                              },
                                            ),
                                          );
                                        } else {
                                          TeacherData.numberOfSubjects = 3;
                                          return CMaker(
                                            alignment: Alignment.bottomCenter,
                                            child: DropdownButton(
                                              underline: const SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                              value: TeacherData.SubjectThatIsSelected,
                                              items: [
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject1,
                                                  child: Text(
                                                    TeacherData.Subject1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject2,
                                                  child: Text(
                                                    TeacherData.Subject2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: TeacherData.Subject3,
                                                  child: Text(
                                                    TeacherData.Subject3,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 89, 89, 87)),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                TeacherData.SubjectThatIsSelected =
                                                    value.toString();
                                                InitData!();
                                                Refresh!();
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.to(() => const TeacherNotificationsPage());
                          },
                          child: Container(
                            width: 70,
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            height: (PageWidth(context) < 550) ? 50 : 100,
                            child: Stack(
                              children: [
                                Positioned(
                                    right: 15,
                                    top: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (ThereIsNotifications)
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 7,
                                      width: 7,
                                    )),
                                Positioned(
                                  right: 15,
                                  top: 10,
                                  child: Icon(
                                    Icons.notifications,
                                    size: (PageWidth(context) < 550)
                                        ? 25
                                        : (PageHeight(context) < 900)
                                            ? 30
                                            : 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const TeacherFirstPageContenets()
                ],
              ),
            ),
          )
        : CMaker(
            child: ListView(
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 6,
                            spreadRadius: .03,
                            color: Color.fromARGB(82, 0, 0, 0)),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            padding: const EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: InkWell(
                                onTap: () {
                                  PageIndex = 0;
                                  Refresh!();
                                },
                                child: Image.asset("images/Book.png"))),
                      ),
                      Expanded(
                        flex: 5,
                        child: CMaker(
                          height: 80,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CMaker(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    TeacherData.teacher_profile_data["name"],
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 5, 123, 151)),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Builder(
                                    builder: (context) {
                                      if (TeacherData.Subject1 != "null" &&
                                          TeacherData.Subject2 == "null" &&
                                          TeacherData.Subject3 == "null") {
                                        TeacherData.numberOfSubjects = 1;
                                        return CMaker(
                                          padding:
                                              const EdgeInsets.only(bottom: 13),
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            TeacherData.Subject1,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 89, 89, 87)),
                                          ),
                                        );
                                      }
                                      if (TeacherData.Subject1 != "null" &&
                                          TeacherData.Subject2 != "null" &&
                                          TeacherData.Subject3 == "null") {
                                        TeacherData.numberOfSubjects = 2;
                                        return CMaker(
                                          alignment: Alignment.bottomCenter,
                                          child: DropdownButton(
                                            underline: const SizedBox(
                                              height: 0,
                                              width: 0,
                                            ),
                                            value: TeacherData.SubjectThatIsSelected,
                                            items: [
                                              DropdownMenuItem(
                                                value: TeacherData.Subject1,
                                                child: Text(
                                                  TeacherData.Subject1,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 89, 89, 87)),
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: TeacherData.Subject2,
                                                child: Text(
                                                  TeacherData.Subject2,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 89, 89, 87)),
                                                ),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              TeacherData.SubjectThatIsSelected =
                                                  value.toString();
                                              InitData!();
                                              Refresh!();
                                            },
                                          ),
                                        );
                                      } else {
                                        TeacherData.numberOfSubjects = 3;
                                        return CMaker(
                                          alignment: Alignment.bottomCenter,
                                          child: DropdownButton(
                                            underline: const SizedBox(
                                              height: 0,
                                              width: 0,
                                            ),
                                            value: TeacherData.SubjectThatIsSelected,
                                            items: [
                                              DropdownMenuItem(
                                                value: TeacherData.Subject1,
                                                child: Text(
                                                  TeacherData.Subject1,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 89, 89, 87)),
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: TeacherData.Subject2,
                                                child: Text(
                                                  TeacherData.Subject2,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 89, 89, 87)),
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: TeacherData.Subject3,
                                                child: Text(
                                                  TeacherData.Subject3,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 89, 89, 87)),
                                                ),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              TeacherData.SubjectThatIsSelected =
                                                  value.toString();
                                              InitData!();
                                              Refresh!();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Get.to(() => const TeacherNotificationsPage());
                        },
                        child: Container(
                          width: 70,
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          height: (PageWidth(context) < 550) ? 50 : 100,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 15,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (ThereIsNotifications)
                                            ? Colors.red
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 7,
                                    width: 7,
                                  )),
                              Positioned(
                                right: 15,
                                top: 10,
                                child: Icon(
                                  Icons.notifications,
                                  size: (PageWidth(context) < 550)
                                      ? 25
                                      : (PageHeight(context) < 900)
                                          ? 30
                                          : 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                const TeacherFirstPageContenets()
              ],
            ),
          );
  }
}
