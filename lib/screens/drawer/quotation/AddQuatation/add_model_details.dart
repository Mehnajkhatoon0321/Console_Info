import 'package:consol_info/screens/drawer/master/product_screen/product_edit.dart';
import 'package:consol_info/screens/drawer/quotation/AddQuatation/create_quotation.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      "Model":"DHI-NVR1108HS-S3/h",
      'brandName': "Camera ",
      "description": "4 MP Demo Full Colour Silver",
      "price":"4850",
      "waranty":"2 year",
      "quantity":"2",
      "total":"3200"



    },
     {
      "id": "2",
      "Model":"DHI-NVR1108HS-S3/h",
      'brandName': "Camera ",
      "description": "4 MP Demo Full Colour Silver",
      "price":"4850",
      "waranty":"2 year",
      "quantity":"2",
      "total":"3200"



    },

    // Add more categories as needed
  ];
  bool _isTextEmpty = true;
  final ValueNotifier<int> total = ValueNotifier<int>(0);
  bool isButtonEnabled = false;
  int quantity = 1;
  late final FocusNode _gstTypeNode = FocusNode();
  String price = '';
  List<String> gstCategories = [
    'Included',
    'Excluded',

  ];
  String? selectGstType;
  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }

  @override
  void initState() {
    if (gstCategories.isNotEmpty) {
      selectGstType = gstCategories[0]; // Set default value to the first item
    }
    // TODO: implement initState
    super.initState();
  }
  late final GlobalKey<FormFieldState<String>> _descriptionsKey =
  GlobalKey<FormFieldState<String>>();
  Map<String, dynamic>? selectedProductCategory;
  bool isProductCategoryFieldFocused = false;
  bool isWarrantyFieldFocused = false;
  bool isQuantityFieldFocused = false;
  bool isDescriptionFieldFocused = false;
  bool isModelFieldFocused = false;
  late final FocusNode _productCategoryNode = FocusNode();
  late final FocusNode _brandNode = FocusNode();
  late final FocusNode _warrantyNode = FocusNode();
  late final FocusNode _descriptionNode = FocusNode();
  late final FocusNode _priceNode = FocusNode();
  late final FocusNode _quantityNode = FocusNode();
  late final TextEditingController _controller = TextEditingController();
  late final TextEditingController brand = TextEditingController();
  late final TextEditingController productCategory = TextEditingController();
  late final TextEditingController descriptions = TextEditingController();
  late final TextEditingController warranty = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController gst = TextEditingController();
  late final GlobalKey<FormFieldState<String>> gstKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _brandKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _warrantyKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _priceKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _quantityKey =
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
                                productCategory.text = category['Model'] ?? '';
                                descriptions.text = category['description'] ?? '';
                                priceController.text = category['price'] ?? '';
                                brand.text = category['brandName'] ?? '';
                                quantityController.text = category['quantity'] ?? '';
                                warranty.text = category['waranty'] ?? '';
                                total.value = int.tryParse(category['total'] ?? '0') ?? 0;
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
                                      const Text("Model: ", style: FTextStyle.listTitle),
                                      Text(category['Model'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Text("Brand: ", style: FTextStyle.listTitle),
                                      Text(category['brandName'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),
                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("Description: ", style: FTextStyle.listTitle),
                                      Text(category['description'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      const Text("Price: ", style: FTextStyle.listTitle),
                                      Text(category['price'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),




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
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
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

               onChanged: () {
                 if (selectedProductCategory != null && selectedProductCategory!.isNotEmpty
                     && ValidatorUtils.isValidCommon(brand.text) && ValidatorUtils.isValidCommon(warranty.text)
                     && ValidatorUtils.isValidCommon(priceController.text) && ValidatorUtils.isValidCommon(quantityController.text)
                     && ValidatorUtils.isValidCommon(gst.text)
                     && ValidatorUtils.isValidCommon(descriptions.text)
                 ) {
                   setState(() {
                     isButtonEnabled = true;
                   });
                 } else {
                   setState(() {
                     isButtonEnabled = false;
                   });
                 }

                 if (isProductCategoryFieldFocused == true) {
                   _productCategoryKey.currentState!.validate();
                 }

                 if (isWarrantyFieldFocused == true) {
                   _warrantyKey.currentState!.validate();
                 }

                 if (isDescriptionFieldFocused == true) {
                   _descriptionsKey.currentState!.validate();
                 }










               },




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
                   Text(
                     "Product Description ",
                     style: FTextStyle.formLabelTxtStyle,
                   ).animateOnPageLoad(
                       animationsMap['imageOnPageLoadAnimation2']!),


                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     child: TextFormField(
                       key: _descriptionsKey,
                       focusNode: _descriptionNode,
                       keyboardType: TextInputType.multiline, // Allow multiline input
                       // maxLines: 5, // Display a maximum of 5 lines
                       decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                         hintText: "Enter description",
                       ),
                       inputFormatters: [NoSpaceFormatter()],
                       controller: descriptions,
                       validator: ValidatorUtils.model,
                       onTap: () {
                         setState(() {
                           isProductCategoryFieldFocused = false;

                           isDescriptionFieldFocused = true;

                         });
                       },
                     ).animateOnPageLoad(
                       animationsMap['imageOnPageLoadAnimation2']!,
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Expanded(
                         child: Text(
                           "Brand",
                           style: FTextStyle.formLabelTxtStyle,
                         ).animateOnPageLoad(
                             animationsMap['imageOnPageLoadAnimation2']!),
                       ),
                       const SizedBox(width: 20,),
                       Expanded(
                         child: Text(
                           "Warranty ",
                           style: FTextStyle.formLabelTxtStyle,
                         ).animateOnPageLoad(
                             animationsMap['imageOnPageLoadAnimation2']!),
                       ),
                     ],
                   ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Expanded(
                         child: Padding(
                           padding:  const EdgeInsets.symmetric(vertical: 10.0),
                           child: TextFormField(
                             key: _brandKey,
                             readOnly: true,
                             focusNode: _brandNode,
                             keyboardType: TextInputType.emailAddress,
                             decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Brand"),
                             inputFormatters: [NoSpaceFormatter()],
                             controller: brand,
                             validator: ValidatorUtils.model,
                             onTap: () {
                               setState(() {
                                 isProductCategoryFieldFocused=false;

                                 isModelFieldFocused = true;

                               });
                             },
                           ).animateOnPageLoad(
                               animationsMap['imageOnPageLoadAnimation2']!),
                         ),
                       ),
                      const SizedBox(width: 20,),
                       Expanded(
                         child: Padding(
                           padding:  const EdgeInsets.symmetric(vertical: 10.0),
                           child: TextFormField(
                             key: _warrantyKey,
                             readOnly: true,
                             focusNode: _warrantyNode,
                             keyboardType: TextInputType.text,
                             decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Warranty"),
                             inputFormatters: [NoSpaceFormatter()],
                             controller: warranty,
                             validator: ValidatorUtils.model,
                             onTap: () {
                               setState(() {
                                 isProductCategoryFieldFocused=false;

                                 isModelFieldFocused = false;
                                 isWarrantyFieldFocused = true;

                               });
                             },
                           ).animateOnPageLoad(
                               animationsMap['imageOnPageLoadAnimation2']!),
                         ),
                       ),

                     ],
                   ),





                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Expanded(
                         child: const Text(
                           "Price",
                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                         ).animateOnPageLoad(
                           animationsMap['imageOnPageLoadAnimation2']!,
                         ),
                       ),
                       const SizedBox(width: 20),
                       Expanded(
                         child: const Text(
                           "Quantity",
                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                         ).animateOnPageLoad(
                           animationsMap['imageOnPageLoadAnimation2']!,
                         ),
                       ),
                     ],
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10.0),
                           child: TextFormField(
                             key: _priceKey,
                             focusNode: _priceNode,
                             keyboardType: const TextInputType.numberWithOptions(decimal: true),
                             decoration:FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Price"),
                             controller: priceController,
                             inputFormatters: [
                               FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                             ],
                             onChanged: (value) {
                               setState(() {

                                 price = value;
                                 _updateTotal();
                               });
                             },
                           ).animateOnPageLoad(
                             animationsMap['imageOnPageLoadAnimation2']!,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20),
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10.0),
                           child: TextField(
                             controller: quantityController,
                             onChanged: (value) {
                               setState(() {
                                 isQuantityFieldFocused=true;
                                 quantity = int.tryParse(value) ?? 1;
                                 _updateTotal();
                               });
                             },
                             textAlign: TextAlign.center,
                             maxLength: 10,
                             keyboardType: TextInputType.number,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly,
                             ],

                             decoration:FormFieldStyle.defaultAddressInputDecoration.copyWith(  filled: true,
                                 prefixIcon: InkWell(
                                   onTap: () {
                                     setState(() {
                                       if (quantity > 1) {
                                         quantity -= 1;
                                         quantityController.text = "$quantity";
                                         _updateTotal();
                                       }
                                     });
                                   },
                                   child: Container(
                                     margin: const EdgeInsets.symmetric(horizontal: 5),
                                     decoration: BoxDecoration(
                                       color: AppColors.primaryColour,
                                       borderRadius: BorderRadius.circular(10),
                                     ),
                                     child: const Icon(
                                       Icons.remove,
                                       color: Colors.white,
                                     ),
                                   ),
                                 ),
                                 suffixIcon: InkWell(
                                   onTap: () {
                                     setState(() {
                                       quantity += 1;
                                       quantityController.text = "$quantity";
                                       _updateTotal();
                                     });
                                   },
                                   child: Container(
                                     margin: const EdgeInsets.symmetric(horizontal: 5),
                                     decoration: BoxDecoration(
                                       color:AppColors.primaryColour,
                                       borderRadius: BorderRadius.circular(10),
                                     ),
                                     child: const Icon(
                                       Icons.add,
                                       color: Colors.white,
                                     ),
                                   ),
                                 ),
                                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                 hintText: "Quantity",
                                 counterText: "",
                             )

                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 20),
                   Row(
                     children: [
                       Expanded(
                         child: Text(
                           "GST (18 %)",
                           style: FTextStyle.formLabelTxtStyle,
                         ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                       ),
                       const SizedBox(width: 8), // Add spacing between text and input field
                       Expanded(
                         child:
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10.0),
                           child: DropdownButtonFormField<String>(
                             key: gstKey,
                             focusNode: _gstTypeNode,
                             value: selectGstType,
                             hint: const Text("Select UserType",style: FTextStyle.formhintTxtStyle,),
                             items: gstCategories
                                 .map((category) => DropdownMenuItem(
                               value: category,
                               child: Text(category),
                             ))
                                 .toList(),
                             onChanged: (newValue) {


                               setState(() {
                                 selectGstType = newValue;



                                 // if (totalAmountAllowance >= 0) {
                                 //   if (selectGstType == gstCategories[0]) { // Assuming 'Included' is the first category
                                 //     // Calculate totalMaintenance as 18% of the allowance
                                 //     totalMaintenance = (totalAmountAllowance * 0.18).round();
                                 //   }
                                 //
                                 //   // Set totalGstAllowance based on GST inclusion or exclusion
                                 //   totalGstAllowance = selectGstType == gstCategories[0]
                                 //       ? totalAmountAllowance + totalMaintenance // GST included
                                 //       : totalAmountAllowance; // GST excluded
                                 // } else {
                                 //   // Handle negative allowance case
                                 //   totalGstAllowance = totalAmountAllowance; // No GST added
                                 // }



                               });




                             },
                             decoration:FormFieldStyle.dropDown,

                             validator: ValidatorUtils.model,
                           ),
                         ),
                       ),
                     ],
                   ),
               Padding(
                 padding:  EdgeInsets.symmetric(vertical: 10.h),
                 child: Container(
                   height: 50,
                   decoration: BoxDecoration(
                     color: AppColors.FormFieldBackColour,
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(color: AppColors.FormFieldBorderColour)
                    ),


                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text(
                         "Total",
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                       ).animateOnPageLoad(
                         animationsMap['imageOnPageLoadAnimation2']!,
                       ),
                       ValueListenableBuilder<int>(
                         valueListenable: total,
                         builder: (context, totalValue, child) {
                           return Text(
                             "${totalValue}",
                             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           );
                         },
                       ),
                     ],
                   ),
                 ),
                 ),),
                   const SizedBox(height: 45),
                   Center(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 2.0),
                       child: SizedBox(
                         height:
                         (displayType == 'desktop' || displayType == 'tablet')
                             ? 70
                             : 52,
                         child: ElevatedButton(
                           onPressed: isButtonEnabled
                               ? () async {

                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>   CreateQuotationScreen(),
                               ),
                             );

                           }
                               : null,
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(26),
                             ),
                             backgroundColor: isButtonEnabled
                                 ? AppColors.primaryColour
                                 : AppColors.drawerdisableButtonColor,
                           ),
                           child: Text(
                             'Add Model Description',
                             style: FTextStyle.loginBtnStyle,
                           ),
                         ),
                       ).animateOnPageLoad(
                           animationsMap['imageOnPageLoadAnimation2']!),
                     ),
                   ),
                   const SizedBox(height: 20),


                 ],
               ),
             ),
           ),
         ],
        
        ),
      ),
    );
  }
  void _updateTotal() {
    int priceValue = int.tryParse(priceController.text.trim()) ?? 0;
    total.value = priceValue * quantity;
  }
}
