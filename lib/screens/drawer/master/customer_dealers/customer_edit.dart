

import 'package:consol_info/screens/drawer/master/customer_dealers/customer_dealers.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class CustomerEdit extends StatefulWidget {
  final String screenFlag;
  final String name;
  final String usertype;
  final String whatsapp;
  final String email;
   CustomerEdit({super.key, required this.screenFlag, required  this.name, required this.usertype, required  this.whatsapp, required  this.email});

  @override
  State<CustomerEdit> createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController userType = TextEditingController();
  late final TextEditingController name = TextEditingController();
  late final TextEditingController companyName = TextEditingController();
  late final TextEditingController email = TextEditingController();



  late final TextEditingController whatsapp = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController zip = TextEditingController();
  late final TextEditingController state = TextEditingController();
  late final TextEditingController pancard = TextEditingController();
  late final TextEditingController country = TextEditingController();
  late final TextEditingController city = TextEditingController();
  late final TextEditingController gst = TextEditingController();
  late final TextEditingController password = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _nameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _companyNameKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _userType =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _stateKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _pancardKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _whatsappKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _addresskey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _zipKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _countryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _cityKey =
  GlobalKey<FormFieldState<String>>();  late final GlobalKey<FormFieldState<String>> _gstkey =
  GlobalKey<FormFieldState<String>>();  late final GlobalKey<FormFieldState<String>> _passwordKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _nameNode = FocusNode();
  late final FocusNode _companyNameNode = FocusNode();
  late final FocusNode emailNode = FocusNode();
  late final FocusNode _userTypeNode = FocusNode();
  late final FocusNode _countryNode = FocusNode();
  late final FocusNode _cityNode = FocusNode();
  late final FocusNode _state = FocusNode();
  late final FocusNode _descriptionNode = FocusNode();
  late final FocusNode _whatsappNode = FocusNode();
  late final FocusNode _addressNode = FocusNode();
  late final FocusNode _zipNode = FocusNode();
  late final FocusNode _gstNode = FocusNode();
  late final FocusNode _passwordNode = FocusNode();



  bool isButtonEnabled = false;

  String? selecteduserType;
  String? selectedstate;
  String? selectedcity;
  String? selectedcountry;


  bool isnameFieldFocused = false;
  bool iscompanyNameFieldFocused = false;
  bool isEmailFocused = false;
  bool isuserTypeFieldFocused = false;
  bool isstateFieldFocused = false;
  bool isDescriptionFieldFocused = false;
  bool iswhatsappFieldFocused = false;
  bool isAddressFieldFocused = false;
  bool iszipFieldFocused = false;
  bool isCountryFieldFocused = false;
  bool isCityFieldFocused = false;
  bool isGSTFieldFocused = false;
  bool isPasswordFieldFocused = false;


  List<String> productCategories = [
    'Customer',
    'Dealer',

  ];

  List<String> stateList = [
    'Lucknow',
    'Delhi',
    'Utter Pradesh',
    'Bihar',

  ];

  List<String> countryList = [
    'India',
    'USA',
    'England',
    'Branjil',

  ];

  List<String> cityList = [
    'Gorakhpur',
    'kanpur',
    'Devanagari',


  ];
  bool isLoading = false;

  String userTypeText = "";
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
  void initState() {
    if (widget.screenFlag.isNotEmpty) {
      name.text = widget.name;
      whatsapp.text = widget.whatsapp;
      email.text = widget.email;
     // selecteduserType = widget.usertype;

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
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
                      widget.screenFlag.isEmpty ? 'Add Customer' : 'Edit Details',
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
        body:ListView(
          // crossAxisAlignment:CrossAxisAlignment.center ,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
              child: Form(

                onChanged: () {
                  if (selecteduserType != null && selecteduserType!.isNotEmpty && selectedstate != null && selectedstate!.isNotEmpty  &&  selectedcountry != null && selectedcountry!.isNotEmpty && selectedcity != null && selectedcity!.isNotEmpty
                      && ValidatorUtils.isValidCommon(name.text) && ValidatorUtils.isValidCommon(whatsapp.text)
                      && ValidatorUtils.isValidCommon(companyName.text) && ValidatorUtils.isValidCommon(email.text)
                      && ValidatorUtils.isValidCommon(address.text) && ValidatorUtils.isValidCommon(zip.text)
                      && ValidatorUtils.isValidCommon(pancard.text)&&        ValidatorUtils.isValidCommon(gst.text)        && ValidatorUtils.isValidCommon(password.text)
                  ) {
                    setState(() {
                      isButtonEnabled = true;
                    });
                  } else {
                    setState(() {
                      isButtonEnabled = false;
                    });
                  }
                  if (isuserTypeFieldFocused == true) {
                    _userType.currentState!.validate();
                  }
                  if (isCountryFieldFocused == true) {
                    _countryKey.currentState!.validate();
                  }
                  if (isstateFieldFocused == true) {
                    _stateKey.currentState!.validate();
                  }
                  if (isCityFieldFocused == true) {
                    _cityKey.currentState!.validate();
                  }
                  if (isnameFieldFocused == true) {
                    _nameKey.currentState!.validate();
                  }
                  if (iswhatsappFieldFocused == true) {
                    _whatsappKey.currentState!.validate();
                  } if (iscompanyNameFieldFocused == true) {
                    _companyNameKey.currentState!.validate();
                  } if (isEmailFocused == true) {
                    _emailKey.currentState!.validate();
                  } if (isAddressFieldFocused == true) {
                    _addresskey.currentState!.validate();
                  } if (iszipFieldFocused == true) {
                    _zipKey.currentState!.validate();
                  } if (isDescriptionFieldFocused == true) {
                    _pancardKey.currentState!.validate();
                  }

                  if (isGSTFieldFocused == true) {
                    _gstkey.currentState!.validate();
                  }if (isPasswordFieldFocused == true) {
                    _passwordKey.currentState!.validate();
                  }




                },


                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "User Type",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _userType,
                        focusNode: _userTypeNode,
                        value: selecteduserType,
                        hint: Text("Select UserType",style: FTextStyle.formhintTxtStyle,),
                        items: productCategories
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {


                          setState(() {
                            selecteduserType = newValue;

                          });


                          isuserTypeFieldFocused=true;
                          isstateFieldFocused=false;
                          isnameFieldFocused = false;
                          iscompanyNameFieldFocused = false;
                          isEmailFocused = false;
                          isDescriptionFieldFocused = false;
                          iswhatsappFieldFocused = false;
                          isAddressFieldFocused = false;
                          iszipFieldFocused = false;

                        },
                        decoration:FormFieldStyle.dropDown,

                        validator: ValidatorUtils.model,
                      ),
                    ),




                    Text(
                      "Contact Person Name",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _nameKey,
                        focusNode: _nameNode,
                        keyboardType: TextInputType.name,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Name"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: name,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = true;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    Text(
                      "Company Name ",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _companyNameKey,
                        focusNode: _companyNameNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Company Name"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: companyName,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = true;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;

                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),

                    Text(
                      "Email",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _emailKey,
                        focusNode: emailNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Email"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: email,
                        validator: ValidatorUtils.emailValidator,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = true;
                            isDescriptionFieldFocused = false;

                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                          });
                        },
                        enabled: widget.screenFlag.isEmpty,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    Text(
                      "Whatsapp Number",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _whatsappKey,
                        focusNode: _whatsappNode,
                        keyboardType: TextInputType.number,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Whatsapp"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: whatsapp,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = true;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;

                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),



                    Text(
                      "Address ",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _addresskey,
                        focusNode: _addressNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Address"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: address,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;

                            isAddressFieldFocused = true;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    Text(
                      "Zip ",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _zipKey,
                        focusNode: _zipNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter zip"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: zip,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;

                            isAddressFieldFocused = false;
                            iszipFieldFocused = true;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),
                    Text(
                      "Country",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _countryKey,
                        focusNode: _countryNode,
                        value: selectedcountry,
                        hint: Text("Select Country",style: FTextStyle.formhintTxtStyle,),

                        items: countryList
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedcountry = newValue;

                          });
                          isuserTypeFieldFocused=false;
                          isstateFieldFocused=false;
                          isnameFieldFocused = false;
                          iscompanyNameFieldFocused = false;
                          isEmailFocused = false;
                          isDescriptionFieldFocused = false;
                          iswhatsappFieldFocused = false;
                          isCountryFieldFocused=true;
                          isAddressFieldFocused = false;
                          iszipFieldFocused = false;
                        },
                        decoration:FormFieldStyle.dropDown,

                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "State",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _stateKey,
                        focusNode: _state,
                        value: selectedstate,
                        hint: Text("Select State",style: FTextStyle.formhintTxtStyle,),

                        items: stateList
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedstate = newValue;

                          });
                          isuserTypeFieldFocused=false;
                          isstateFieldFocused=true;
                          isnameFieldFocused = false;
                          iscompanyNameFieldFocused = false;
                          isEmailFocused = false;
                          isDescriptionFieldFocused = false;
                          iswhatsappFieldFocused = false;
                          isAddressFieldFocused = false;
                          iszipFieldFocused = false;
                        },
                        decoration:FormFieldStyle.dropDown,

                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "City",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField<String>(
                        key: _cityKey,
                        focusNode: _cityNode,
                        value: selectedcity,
                        hint: Text("Select City",style: FTextStyle.formhintTxtStyle,),

                        items: cityList
                            .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedcity = newValue;

                          });
                          isuserTypeFieldFocused=false;
                          isstateFieldFocused=false;
                          isnameFieldFocused = false;
                          iscompanyNameFieldFocused = false;
                          isEmailFocused = false;
                          isDescriptionFieldFocused = false;
                          iswhatsappFieldFocused = false;
                          isAddressFieldFocused = false;
                          isCityFieldFocused = true;
                          iszipFieldFocused = false;
                        },
                        decoration:FormFieldStyle.dropDown,

                        validator: ValidatorUtils.model,
                      ),
                    ),
                    Text(
                      "Pan Card",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _pancardKey,
                        focusNode: _descriptionNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Pancard", ),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: pancard,

                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = true;
                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                            isCityFieldFocused = true;
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
                        key: _gstkey,
                        focusNode: _gstNode,
                        keyboardType: TextInputType.text,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter GST"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: gst,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;
                            isGSTFieldFocused = true;

                            isAddressFieldFocused = false;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                    ),

                    Text(
                      "Password ",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _passwordKey,
                        focusNode: _passwordNode,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Password"),
                        inputFormatters: [NoSpaceFormatter()],
                        controller: password,
                        validator: ValidatorUtils.model,
                        onTap: () {
                          setState(() {
                            isuserTypeFieldFocused=false;
                            isstateFieldFocused=false;
                            isnameFieldFocused = false;
                            iswhatsappFieldFocused = false;
                            iscompanyNameFieldFocused = false;
                            isEmailFocused = false;
                            isDescriptionFieldFocused = false;
                            isGSTFieldFocused = false;

                            isAddressFieldFocused = false;
                            isPasswordFieldFocused=true;
                            iszipFieldFocused = false;
                          });
                        },
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
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
                        builder: (context) =>  const CustomersDealersScreen(),
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
                    widget.screenFlag.isEmpty ? 'Add Customer' : 'Save Changes',
                    style: FTextStyle.loginBtnStyle,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
