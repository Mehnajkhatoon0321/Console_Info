import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class QuotationList extends StatefulWidget {
  const QuotationList({super.key});

  @override
  State<QuotationList> createState() => _QuotationListState();
}

class _QuotationListState extends State<QuotationList> {
  List<Map<String, dynamic>> listData = [
    { "customerID": "1","mobileNumber":"9695844884","validity":"12-08-2020","Date":"16-09-2003","status":"Pending","name":"Mahi khan"},
    { "customerID": "1","mobileNumber":"9695844884","validity":"12-08-2020","Date":"16-09-2003","status":"Pending","name":"Mahi khan"},
    { "customerID": "1","mobileNumber":"9695844884","validity":"12-08-2020","Date":"16-09-2003","status":"Pending","name":"Mahi khan"},
    { "customerID": "1","mobileNumber":"9695844884","validity":"12-08-2020","Date":"16-09-2003","status":"Pending","name":"Mahi khan"},
    { "customerID": "1","mobileNumber":"9695844884","validity":"12-08-2020","Date":"16-09-2003","status":"Pending","name":"Mahi khan"},


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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                    "Quotation List",
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
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        actions: [

        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
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
                  hintText: 'Search quotation',
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
                final item = listData[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 5),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.FormFieldBackColour,
                            spreadRadius: 9,
                            blurRadius: 1,
                            offset: Offset(0, 9),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row for Customer ID and Status
                          Row(
                            children: [
                               Expanded(
                                child: Row(
                                  children: [
                                    Text("Customer ID: ", style: FTextStyle.listTitle),
                                    Expanded(child: Text("${item["customerID"]}", style: FTextStyle.listTitleSub)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text("Status: ", style: FTextStyle.listTitle),
                              Text(
                                "${listData[index]["status"]}",
                                style: listData[index]["status"] == 'Pending'
                                    ? FTextStyle.listTitleSub.copyWith(color: Colors.red)
                                    : FTextStyle.listTitleSub.copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),

                          // Row for Name
                          Row(
                            children: [
                              const Text("Name: ", style: FTextStyle.listTitle),
                              Text("${item["name"]}", style: FTextStyle.listTitleSub),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Row for Mobile Number
                          Row(
                            children: [
                              const Text("Mobile Number: ", style: FTextStyle.listTitle),
                              Text("${item["mobileNumber"]}", style: FTextStyle.listTitleSub),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Row for Date and Validity
                          Row(
                            children: [
                               Expanded(
                                child: Row(
                                  children: [
                                    Text("Date: ", style: FTextStyle.listTitle),
                                    Expanded(child: Text("${item["Date"]}", style: FTextStyle.listTitleSub)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text("Validity: ", style: FTextStyle.listTitle),
                              Text("${item["validity"]}", style: FTextStyle.listTitleSub),
                            ],
                          ),



                          // Row for Edit and Delete buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.black),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder:(context) => ProductEdit(
                                  //   screenFlag :"edit",
                                  //   productDescription:item["product_description"],
                                  //   barandname: item["brand"],
                                  //   model: item["model"],
                                  //   warranty: item["model"],
                                  // )));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _showDeleteDialog(index),
                              ),
                            ],
                          ),
                        ],
                      ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                    )

                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }



  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text("Are you sure you want to delete?", style: FTextStyle.preHeadingStyle),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.FormFieldBackColour,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextButton(
                child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColour,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextButton(
                child: const Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    listData.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
            ),
          ],
        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!);
      },
    );
  }
}
