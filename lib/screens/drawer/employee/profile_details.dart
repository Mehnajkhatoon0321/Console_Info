import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    final animationsMap = {
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    };
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(),
          ),
          backgroundColor: AppColors.primaryColour,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 29.0),
                    child: Text(
                      "Edit Profile",
                      style: FTextStyle.HeadingTxtWhiteStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),

        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 15),
          child: Container(
            height: MediaQuery.of(context).size.height/2,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: AppColors.FormFieldBackColour,
                  spreadRadius: 9,
                  blurRadius: 1,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Employee ID: ", style: FTextStyle.listTitleBig),
                    Text("Employee Code", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Name: ", style: FTextStyle.listTitleBig),
                    Text("Mehnaj Khatoon", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Email: ", style: FTextStyle.listTitleBig),
                    Text("mehnaj0321@gmail.com", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Branch: ", style: FTextStyle.listTitleBig),
                    Text("C.S.E", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Phone: ", style: FTextStyle.listTitleBig),
                    Text("969584484", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Designation: ", style: FTextStyle.listTitleBig),
                    Text("Flutter Developer", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Department: ", style: FTextStyle.listTitleBig),
                    Text("Mobile Application Department", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Date Of Birth: ", style: FTextStyle.listTitleBig),
                    Text("01-08-2003", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Date of Joining: ", style: FTextStyle.listTitleBig),
                    Text("22-08-2024", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Address: ", style: FTextStyle.listTitleBig),
                    Text("Lucknow", style: FTextStyle.listTitleSubBig),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
        )
        ,
      ),
    );
  }
}
