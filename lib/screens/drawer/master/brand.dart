import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Brand extends StatefulWidget {
  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  List<Map<String, dynamic>> listData = [
    {"ID": 1, "brand_name": "Brand A"},
    {"ID": 2, "brand_name": "Brand B"},
    {"ID": 3, "brand_name": "Brand C"},
    {"ID": 4, "brand_name": "Brand D"},
    {"ID": 5, "brand_name": "Brand E"},
    {"ID": 6, "brand_name": "Brand F"},
    {"ID": 7, "brand_name": "Brand G"},
    {"ID": 8, "brand_name": "Brand H"},
    {"ID": 9, "brand_name": "Brand I"},
    {"ID": 10, "brand_name": "Brand J"},
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
                    "Brand",
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
                _showEditDialog(-1);
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
                  hintText: 'Search brand',
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
                            const Text("ID: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["ID"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Brand Name: ", style: FTextStyle.listTitle),
                            Text("${listData[index]["brand_name"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () {
                                _showEditDialog(index);
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



  void _showEditDialog(int index) {
    // Clear or set the controller's text based on the action
    if (index == -1) {
      _editController.clear();
    } else {
      _editController.text = listData[index]["brand_name"];
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          title: Text(
            index == -1 ? "Add Brand Name" : "Edit Brand Name",
            style: FTextStyle.preHeadingStyle,
          ),
          content: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _editController,
                  decoration: InputDecoration(
                    hintText: index == -1 ? "Enter new brand name" : "Update brand name",
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
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
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
            const SizedBox(width: 10), // Add spacing between buttons
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColour,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextButton(
                child: const Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (_editController.text.isNotEmpty) {
                    setState(() {
                      if (index == -1) {
                        listData.add({"brand_name": _editController.text});
                      } else {
                        listData[index]["brand_name"] = _editController.text;
                      }
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Brand name cannot be empty.")),
                    );
                  }
                },
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
            ),
          ],
        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!);
      },
    );
  }


  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Are you sure you want to delete?", style: FTextStyle.preHeadingStyle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.FormFieldBackColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("OK", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          listData.removeAt(index);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

