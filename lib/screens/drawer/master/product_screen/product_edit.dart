import 'package:consol_info/screens/drawer/master/product_screen/product_screen.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/constant.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class ProductEdit extends StatefulWidget {
  final String screenFlag;
  final String productDescription;
  final String barandname;
  final String model;
  final String warranty;


   ProductEdit({Key? key, required this.screenFlag, required this.productDescription, required this.barandname, required this.model, required this.warranty, }) : super(key: key);

  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController model = TextEditingController();
  late final TextEditingController customerPrice = TextEditingController();
  late final TextEditingController dealerPrice = TextEditingController();
  late final TextEditingController productCategory = TextEditingController();
  late final TextEditingController brand = TextEditingController();
  late final TextEditingController descriptions = TextEditingController();
  late final TextEditingController warranty = TextEditingController();
  late final TextEditingController gst = TextEditingController();
  late final TextEditingController remark = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _modelKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _customerPriceKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _dealerPriceKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _brandKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _descriptionsKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _warrantyKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _gstKey =
  GlobalKey<FormFieldState<String>>();
   late final GlobalKey<FormFieldState<String>> _remarkKey =
  GlobalKey<FormFieldState<String>>();
   late final FocusNode _modelNode = FocusNode();
  late final FocusNode _customerPriceNode = FocusNode();
  late final FocusNode _dealerNode = FocusNode();
  late final FocusNode _productCategoryNode = FocusNode();
  late final FocusNode _brand = FocusNode();
  late final FocusNode _descriptionNode = FocusNode();
  late final FocusNode _warrantyNode = FocusNode();
  late final FocusNode _gstNode = FocusNode();
  late final FocusNode _remarkNode = FocusNode();



  bool isButtonEnabled = false;

  String? selectedProductCategory;
  String? selectedBrand;


  bool isModelFieldFocused = false;
  bool isCustomerPriceFieldFocused = false;
  bool isDealerFocused = false;
  bool isProductCategoryFieldFocused = false;
  bool isBrandFieldFocused = false;
  bool isDescriptionFieldFocused = false;
  bool isWarrantyFieldFocused = false;
  bool isGstFieldFocused = false;
  bool isRemarkFieldFocused = false;


  List<String> productCategories = [
    'Electronics',
    'Clothing',
    'Home & Kitchen',
    'Books',
    'Toys',
  ];

  List<String> brandName = [
    'Brand A',
    'Brand B',
    'Brand C',
    'Brand D',

  ];
  bool isLoading = false;

  String productCategoryText = "";




  @override
  void initState() {
    super.initState();
    // Set text fields only if screenFlag is not empty
    if (widget.screenFlag.isNotEmpty) {
      descriptions.text = widget.productDescription;
      model.text = widget.model;
      warranty.text = widget.warranty;
    }
  }
  @override
  void dispose() {
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
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
                    widget.screenFlag.isEmpty ? 'Add Product' : 'Product Edit',
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
      body: ListView(
        // crossAxisAlignment:CrossAxisAlignment.center ,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
            child: Form(

              onChanged: () {
                if (selectedProductCategory != null && selectedProductCategory!.isNotEmpty && selectedBrand != null && selectedBrand!.isNotEmpty
                    && ValidatorUtils.isValidCommon(model.text) && ValidatorUtils.isValidCommon(warranty.text)
                    && ValidatorUtils.isValidCommon(customerPrice.text) && ValidatorUtils.isValidCommon(dealerPrice.text)
                    && ValidatorUtils.isValidCommon(gst.text) && ValidatorUtils.isValidCommon(remark.text)
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
                if (isBrandFieldFocused == true) {
                  _brandKey.currentState!.validate();
                }
                if (isModelFieldFocused == true) {
                  _modelKey.currentState!.validate();
                }
                if (isWarrantyFieldFocused == true) {
                  _warrantyKey.currentState!.validate();
                } if (isCustomerPriceFieldFocused == true) {
                  _customerPriceKey.currentState!.validate();
                } if (isDealerFocused == true) {
                  _dealerPriceKey.currentState!.validate();
                } if (isGstFieldFocused == true) {
                  _gstKey.currentState!.validate();
                } if (isRemarkFieldFocused == true) {
                  _remarkKey.currentState!.validate();
                } if (isDescriptionFieldFocused == true) {
                  _descriptionsKey.currentState!.validate();
                }






              },


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Product Category ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: _productCategoryKey,
                      focusNode: _productCategoryNode,
                      value: selectedProductCategory,
                      hint: Text("Select Product Category",style: FTextStyle.formhintTxtStyle,),
                      items: productCategories
                          .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                          .toList(),
                      onChanged: (newValue) {


                        setState(() {
                          selectedProductCategory = newValue;

                        });


                        isProductCategoryFieldFocused=true;
                        isBrandFieldFocused=false;
                        isModelFieldFocused = false;
                        isCustomerPriceFieldFocused = false;
                        isDealerFocused = false;
                        isDescriptionFieldFocused = false;
                         isWarrantyFieldFocused = false;
                         isGstFieldFocused = false;
                         isRemarkFieldFocused = false;

                      },
                      decoration:FormFieldStyle.dropDown,

                      validator: ValidatorUtils.model,
                    ),
                  ),

                  Text(
                    "Brand",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: _brandKey,
                      focusNode: _brand,
                      value: selectedBrand,
                      hint: Text("Select Brand",style: FTextStyle.formhintTxtStyle,),

                      items: brandName
                          .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedBrand = newValue;

                        });
                        isProductCategoryFieldFocused=false;
                        isBrandFieldFocused=true;
                        isModelFieldFocused = false;
                        isCustomerPriceFieldFocused = false;
                        isDealerFocused = false;
                        isDescriptionFieldFocused = false;
                        isWarrantyFieldFocused = false;
                        isGstFieldFocused = false;
                        isRemarkFieldFocused = false;
                      },
                      decoration:FormFieldStyle.dropDown,

                      validator: ValidatorUtils.model,
                    ),
                  ),


                  Text(
                    "Model",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _modelKey,
                      focusNode: _modelNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Model Name"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: model,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = true;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),

                  Text(
                    "Warranty",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _warrantyKey,
                      focusNode: _warrantyNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter warranty"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: warranty,
                    validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = true;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),

                  Text(
                    "Customer ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _customerPriceKey,
                      focusNode: _customerPriceNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter customer"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: customerPrice,
                    validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = true;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                  Text(
                    "Dealer Price ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _dealerPriceKey,
                      focusNode: _dealerNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter dealer price"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: dealerPrice,
                    validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = true;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                  Text(
                    "GST ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _gstKey,
                      focusNode: _gstNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter gst"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: gst,
                    validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = true;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                  Text(
                    "Remark ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _remarkKey,
                      focusNode: _remarkNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter remark"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: remark,
                    validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = true;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
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
                      maxLines: 5, // Display a maximum of 5 lines
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter description",
                      ),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: descriptions,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused = false;
                          isBrandFieldFocused = false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = true;
                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!,
                    ),
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                      builder: (context) =>  const ProductScreen(),
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
                  widget.screenFlag.isEmpty ? 'Add Product' : 'Save Changes',
                  style: FTextStyle.loginBtnStyle,
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
