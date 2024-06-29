import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  SubjectPage({super.key, required this.SubjectIndex, required this.Subjects});
  int SubjectIndex;
  List<List> Subjects;
  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: const Color.fromARGB(115, 0, 0, 0))
                ],
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 8, 147, 189)),
            child: Row(
              children: [
                Expanded(child: Container()),
                Image.asset(widget.Subjects[widget.SubjectIndex][0]),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  widget.Subjects[widget.SubjectIndex][1],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          InkWell(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          color: const Color.fromARGB(115, 0, 0, 0))
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 18, 207, 60)),
                child: Text(
                  "عرض الكتب",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              child: Text(
                "الحصص المسجلة",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 253, 63, 120)),
              )),
          Padding(padding: EdgeInsets.only(top: 15)),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 10,
                              color: const Color.fromARGB(115, 0, 0, 0))
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 6, 122, 153)),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          "الحصص رقم  ${index+1}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 18)),
                        MaterialButton(color: Color.fromARGB(255, 18, 207, 60),onPressed: (){},
                        child: Text(
                          "تشغيل",
                          // 
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
