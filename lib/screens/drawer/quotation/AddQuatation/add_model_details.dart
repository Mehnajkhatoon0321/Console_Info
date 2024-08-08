import 'package:consol_info/screens/drawer/master/product_screen/product_edit.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class AddModelDetails extends StatefulWidget {
  String screenFlag;
   AddModelDetails({required this.screenFlag,super.key});

  @override
  State<AddModelDetails> createState() => _AddModelDetailsState();
}

class _AddModelDetailsState extends State<AddModelDetails> {
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
  List<Map<String, dynamic>> productCategories = [
    {
      "id": "1",
      'name': "Mahi Khan",
      "whatsappNumber": "98765432123",

    },
    {
      "id": "2",
      'name': "John Doe",
      "whatsappNumber": "98765432124",

    },
    // Add more categories as needed
  ];
  bool _isTextEmpty = true;
  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }
  Map<String, dynamic>? selectedProductCategory;
  bool isProductCategoryFieldFocused = false;
  late final FocusNode _productCategoryNode = FocusNode();
  late final TextEditingController _controller = TextEditingController();
  late final TextEditingController productCategory = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be as tall as needed
      builder: (BuildContext context) {
        return Container(
          // color: Colors.white,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,// Light grey background color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), // Apply border radius to top-left corner
              topRight: Radius.circular(8.0), // Apply border radius to top-right corner
            ),

          ),
          height: MediaQuery.of(context).size.height/2,// Full width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with close icon and title
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                // color: AppColors.primaryColour,
                decoration: BoxDecoration(
                  color: AppColors.primaryColour,// Light grey background color
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0), // Apply border radius to top-left corner
                    topRight: Radius.circular(8.0), // Apply border radius to top-right corner
                  ),
                  border: Border.all(
                    color: AppColors.primaryColour,// Border color
                    width: 1.0, // Border width
                  ),
                ),// Light grey background for header
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    ),
                    Expanded(
                      child: Center(
                        child:Text(
                          'Select Customer' ,
                          style: FTextStyle.HeadingTxtWhiteStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Spacing between header and search field

              // Search field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  15, vertical: 10),
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
              const SizedBox(height: 10), // Spacing between search field and list

              // List of categories
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: productCategories.asMap().entries.map((entry) {
                    int index = entry.key;
                    var category = entry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity, // Full width
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100, // Light grey background color
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            border: Border.all(
                              color: Colors.grey.shade300, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedProductCategory = category;
                                productCategory.text = category['name'] ?? '';
                                // whatsApp.text = category['whatsappNumber'] ?? '';
                                // address.text = category['Address'] ?? '';
                              });
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Name: ", style: FTextStyle.listTitle),
                                      Text(category['name'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Text("WhatsApp Number: ", style: FTextStyle.listTitle),
                                      Text(category['whatsappNumber'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),
                                  const SizedBox(height: 5),

                                  // Row(
                                  //   children: [
                                  //     const Text("Address: ", style: FTextStyle.listTitle),
                                  //     Text(category['Address'] ?? '', style: FTextStyle.listTitleSub),
                                  //   ],
                                  // ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Add a divider if it's not the last item
                        if (index < productCategories.length - 1)
                          Divider(height: 1, color: Colors.grey.shade300),
                        const SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor:Colors.white,
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
                    widget.screenFlag.isEmpty ? 'Add Model Details' : 'Edit Model Details',
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

      ),
      body: SingleChildScrollView(
        child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
             child: Form(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment:MainAxisAlignment.start ,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Model Name" ,
                         style: FTextStyle.formLabelTxtStyle,
                       ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                       SizedBox(
                         height: (MediaQuery.of(context).size.width >= 1024) ? 60 : 27,
                         child: ElevatedButton(
                           onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder:(context) => ProductEdit(
        
                               screenFlag :"edit",
                               productDescription:"",
                               barandname:   "",
                               model: "",
                               warranty:  "",
        
                             )));
                           },
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18),
                             ),
                             backgroundColor: AppColors.primaryColour,
                           ),
                           child: Text(
                             '+ Product',
                             style: FTextStyle.loginBtnStyle,
                           ),
                         ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                       ),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     child: GestureDetector(
                       onTap: () {
                         _showBottomSheet(); // Open the bottom sheet when tapped
                       },
                       child: AbsorbPointer(
                         child: TextFormField(
                           key: _productCategoryKey,
                           focusNode: _productCategoryNode,
                           controller: productCategory,
                           decoration: FormFieldStyle.dropDown.copyWith(
                             hintText: "Select Model" ,
                             suffixIcon: const Icon(Icons.arrow_drop_down),
                           ),
        
                           onTap: () {
                             setState(() {
                               isProductCategoryFieldFocused = true;
        
                             });
                             _showBottomSheet(); // Open the bottom sheet when tapped
                           },
                         ),
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
    );
  }
}
