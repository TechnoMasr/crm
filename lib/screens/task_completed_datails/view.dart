import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:flutter/material.dart';

class TasksCompletedDetails extends StatelessWidget {
  final String headTitle;
  final String clientName;
  final String clientPhone;
  final String time;

  TasksCompletedDetails(
      {Key? key,
      required this.headTitle,
      required this.clientName,
      required this.clientPhone,
      required this.time})
      : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "تفاصيل المهام المكتملة",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: kHomeColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSizedBox(height),
              buildText(text: headTitle, fontWeight: FontWeight.bold),
              buildSizedBox(height),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(
                  Icons.alarm_add_sharp,
                  color: kPrimaryColor,
                ),
                buildText(text: ' Due-date '),
                SizedBox(
                  width: width * 0.05,
                ),
                buildText(text: time),
              ]),
              buildSizedBox(height),
              Row(
                children: [
                  Container(
                    height: height * 0.044,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        buildText(
                          text: '\t\t $clientName \t\t\t',
                        ),
                        buildText(text: clientPhone)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'ملاحظات',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              NotesCustomTextField(
                onTap: () {},
                hint: 'كتابة ملاحظات',
              ),
              Center(
                  child: SmallButton(
                onPressed: () {},
                title: 'حفظ',
                color: kPrimaryColor,
              )),
            ],
          ),
        ),
      ),
    );
  }



















  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.02,
      );

  Text buildText({required String text, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 12,
          fontWeight: fontWeight,
          color: Colors.black),
    );
  }
}
