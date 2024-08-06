import 'package:consol_info/screens/drawer/employee/leave/apply_leave.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class AllLeaves extends StatefulWidget {
  const AllLeaves({super.key});

  @override
  State<AllLeaves> createState() => _AllLeavesState();
}

class _AllLeavesState extends State<AllLeaves> {
  List<Map<String, dynamic>> listData = [
    { "fromDate": "02-12-2024","toDate":"09-11-2024" ,"status":"Pending","days":"4","reasonForLive":"Sick Leaves"},
    { "fromDate": "02-12-2024","toDate":"09-11-2024" ,"status":"Approved","days":"4","reasonForLive":"Sick Leaves"},
    { "fromDate": "02-12-2024","toDate":"09-11-2024" ,"status":"Pending","days":"4","reasonForLive":"Sick Leaves"},
    { "fromDate": "02-12-2024","toDate":"09-11-2024" ,"status":"Approved","days":"4","reasonForLive":"Sick Leaves"},
    { "fromDate": "02-12-2024","toDate":"09-11-2024" ,"status":"Pending","days":"4","reasonForLive":"Sick Leaves"},

  ];

  TextEditingController _editController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  bool _isTextEmpty = true;

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

  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextEmpty = _controller.text.isEmpty;
      });
    });
    _editController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dividerColor,
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
                    "Leaves",
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplyLeave()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.add,
                      //   color: Colors.black,
                      //   size: 20.0,
                      // ),
                      // SizedBox(width: 4.0),
                      Text(
                        "Apply Leave",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: FTextStyle.formhintTxtStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.FormFieldHintColour, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.FormFieldHintColour, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.primaryColour, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 18.0),
                  suffixIcon: _isTextEmpty
                      ? const Icon(Icons.search, color: AppColors.FormFieldHintColour)
                      : IconButton(
                    icon: const Icon(Icons.clear, color: AppColors.FormFieldHintColour),
                    onPressed: _clearText,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _isTextEmpty = value.isEmpty;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Container(
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
                        Row(
                          children: [
                            const Text("Sr.No. : ", style: FTextStyle.listTitle),
                            Text("${index + 1}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("From: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["fromDate"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("To Date: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["toDate"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Days: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["days"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Reasons for leaves: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["reasonForLive"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),

                        const SizedBox(height: 5),


                        Row(
                          children: [
                            const Text("Status: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["status"]}", style: listData[index]["status"]=='Pending'?FTextStyle.listTitleSub.copyWith(color: Colors.red): FTextStyle.listTitleSub.copyWith(color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }



}
