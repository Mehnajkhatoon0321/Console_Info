import 'package:consol_info/screens/drawer/master/product_combo/combo_product_edit.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class ComboProductScreen extends StatefulWidget {
  const ComboProductScreen({super.key});

  @override
  State<ComboProductScreen> createState() => _ComboProductScreenState();
}

class _ComboProductScreenState extends State<ComboProductScreen> {
  List<Map<String, dynamic>> listData = [
    {"combo_name": "Wering Parameter",},
    {"combo_name": "Lp Camera",},
    {"combo_name": "LP Data",},
    {"combo_name": "Wering Parameter",},
    {"combo_name": "Wering Parameter",},
    {"combo_name": "Wering Parameter",},
    {"combo_name": "Wering Parameter",},



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
                    "Combo Product",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>   ComboProductEdit(screenFlag:""),
                  ),
                );
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
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        "ADD",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
              ),
            ),
          ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Sr. No. : ", style: FTextStyle.listTitle),
                            Text("${index + 1}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Combo Name: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["combo_name"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>   ComboProductEdit(screenFlag:"edit"),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteDialog(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  ),
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
