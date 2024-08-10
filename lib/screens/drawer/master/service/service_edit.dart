import 'package:consol_info/screens/drawer/master/service/service.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
class ServiceEdit extends StatefulWidget {
  String screenFlag;
  String serviceName;
  String validity;
  String amount;
   ServiceEdit({ required this.screenFlag,super.key, required  this.serviceName, required this.amount, required this.validity});

  @override
  State<ServiceEdit> createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController serviceName = TextEditingController();
  late final TextEditingController customerPrice = TextEditingController();
  late final TextEditingController dealerPrice = TextEditingController();

  late final TextEditingController gst = TextEditingController();

  late final TextEditingController dealerAmount = TextEditingController();

  late final TextEditingController remark = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _serviceNameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _customerPriceKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _gstKey =
  GlobalKey<FormFieldState<String>>();


  late final GlobalKey<FormFieldState<String>> _dealerAmountKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _remarkKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _serviceNameNode = FocusNode();
  late final FocusNode _customerPriceNode = FocusNode();

  late final FocusNode _gst = FocusNode();

  late final FocusNode _dealerAmountNode = FocusNode();

  late final FocusNode _remarkNode = FocusNode();



  bool isButtonEnabled = false;

  String? selectedProductCategory;
  String? selectedgst;


  bool isserviceNameFieldFocused = false;
  bool isCustomerPriceFieldFocused = false;




  bool isdealerAmountFieldFocused = false;
  bool isGstFieldFocused = false;
  bool isRemarkFieldFocused = false;




  List<String> gstName = [
    '18%',
    '28%',


  ];
  bool isLoading = false;

  String productCategoryText = "";
  void _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Format the date to dd-MM-yyyy
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      setState(() {
        remark.text = formattedDate;
      });
    }
  }



  @override
  void initState() {
    super.initState();
    // Set text fields only if screenFlag is not empty
    if (widget.screenFlag.isNotEmpty) {


      remark.text = widget.validity;
      serviceName.text = widget.serviceName;
    customerPrice.text = widget.amount;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(),
        ),
        backgroundColor: AppColors.primaryColour,
        toolbarHeight: kToolbarHeight, // Adjust toolbar height if needed
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.screenFlag.isEmpty ? 'Create Service' : 'Edit Service',
              style: FTextStyle.HeadingTxtWhiteStyle,
            ),
          ],
        ),
        centerTitle: true, // Ensures the title is centered
      ),
      body: ListView(
        // crossAxisAlignment:CrossAxisAlignment.center ,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
            child: Form(

              onChanged: () {
                if ( selectedgst != null && selectedgst!.isNotEmpty
                    && ValidatorUtils.isValidCommon(serviceName.text) && ValidatorUtils.isValidCommon(dealerAmount.text)
                    && ValidatorUtils.isValidCommon(customerPrice.text)
                  && ValidatorUtils.isValidDate(remark.text)

                ) {
                  setState(() {
                    isButtonEnabled = true;
                  });
                } else {
                  setState(() {
                    isButtonEnabled = false;
                  });
                }

                if (isserviceNameFieldFocused == true) {
                  _serviceNameKey.currentState!.validate();
                }
                if (isdealerAmountFieldFocused == true) {
                  _dealerAmountKey.currentState!.validate();
                } if (isCustomerPriceFieldFocused == true) {
                  _customerPriceKey.currentState!.validate();
                }  if (isGstFieldFocused == true) {
                  _gstKey.currentState!.validate();
                } if (isRemarkFieldFocused == true) {
                  _remarkKey.currentState!.validate();
                }






              },


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  Text(
                    "Service Name",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _serviceNameKey,
                      focusNode: _serviceNameNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Service Name"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: serviceName,
                                            validator: ValidatorUtils.model,

                      onTap: () {
                        setState(() {


                          isserviceNameFieldFocused = true;
                          isCustomerPriceFieldFocused = false;


                          isdealerAmountFieldFocused = false;
                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),


                  Text(
                    "Customer Amount ",
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
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Customer"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: customerPrice,
                                            validator: ValidatorUtils.model,

                      onTap: () {
                        setState(() {


                          isserviceNameFieldFocused = false;
                          isdealerAmountFieldFocused = false;
                          isCustomerPriceFieldFocused = true;



                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),


                  Text(
                    "Dealer Amount",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _dealerAmountKey,
                      focusNode: _dealerAmountNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Dealer Amount"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: dealerAmount,
                      validator: ValidatorUtils.model,

                      onTap: () {
                        setState(() {


                          isserviceNameFieldFocused = false;
                          isdealerAmountFieldFocused = true;
                          isCustomerPriceFieldFocused = false;



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
                    child: DropdownButtonFormField<String>(
                      key: _gstKey,
                      focusNode: _gst,
                      value: selectedgst,
                      hint: Text("Select Gst",style: FTextStyle.formhintTxtStyle,),

                      items: gstName
                          .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedgst = newValue;

                        });


                        isserviceNameFieldFocused = false;
                        isCustomerPriceFieldFocused = false;


                        isdealerAmountFieldFocused = false;
                        isGstFieldFocused = false;
                        isRemarkFieldFocused = false;
                      },
                      decoration:FormFieldStyle.dropDown,

                      validator: ValidatorUtils.model,

                    ),
                  ),


                  Text(
                    "Validity ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    key: _remarkKey,
                    focusNode: _remarkNode,
                    keyboardType: TextInputType.text,
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "dd-mm-yyyy",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today, // Calendar icon
                          color: Colors.grey, // Adjust color as needed
                        ),
                        onPressed: () {
                          // Show date picker when the icon is pressed
                          _selectDate(context);
                        },
                      ),
                    ),
                    inputFormatters: [NoSpaceFormatter()],
                    controller: remark,
                    validator: ValidatorUtils.dateValidator,
                    onTap: () {
                      setState(() {
                        isserviceNameFieldFocused = false;
                        isdealerAmountFieldFocused = false;
                        isCustomerPriceFieldFocused = false;
                        isGstFieldFocused = false;
                        isRemarkFieldFocused = true;
                      });
                    },
                  ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!,
                  ),
                ),



      // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                  //   child: TextFormField(
                  //     key: _remarkKey,
                  //     focusNode: _remarkNode,
                  //     keyboardType: TextInputType.text,
                  //     decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Date"),
                  //     inputFormatters: [NoSpaceFormatter()],
                  //     controller: remark,
                  //                           validator: ValidatorUtils.model,
                  //
                  //     onTap: () {
                  //       setState(() {
                  //
                  //
                  //         isserviceNameFieldFocused = false;
                  //         isdealerAmountFieldFocused = false;
                  //         isCustomerPriceFieldFocused = false;
                  //         isGstFieldFocused = false;
                  //         isRemarkFieldFocused = true;
                  //       });
                  //     },
                  //   ).animateOnPageLoad(
                  //       animationsMap['imageOnPageLoadAnimation2']!),
                  // ),

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
                      builder: (context) =>   ServiceScreen(),
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
                  widget.screenFlag.isEmpty ? 'Add Services' : 'Save Changes',
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
