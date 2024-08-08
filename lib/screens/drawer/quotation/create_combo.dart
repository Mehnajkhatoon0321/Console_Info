import 'package:consol_info/screens/drawer/master/customer_dealers/customer_edit.dart';
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
class CreateCombo extends StatefulWidget {
  const CreateCombo({super.key});

  @override
  State<CreateCombo> createState() => _CreateComboState();
}

class _CreateComboState extends State<CreateCombo> {
  List<Map<String, dynamic>> productCategories = [
    {
      "id": "1",
      'name': "Mahi Khan",
      "whatsappNumber": "98765432123",
      "Address": "Gomti Nagar"
    },
    {
      "id": "2",
      'name': "John Doe",
      "whatsappNumber": "98765432124",
      "Address": "Gomti Nagar"
    },
    // Add more categories as needed
  ];

  Map<String, dynamic>? selectedProductCategory;

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

  bool isSelectedCustomer = true;
  bool isButtonEnabled = false;
  bool isWhatsAppFIeldFocused = true;
  bool isProductCategoryFieldFocused = false;
  late final FocusNode _productCategoryNode = FocusNode();
  late final FocusNode _whatsAppNode = FocusNode();
  late final FocusNode _addressAppNode = FocusNode();
  late final FocusNode _dateAppNode = FocusNode();
  late final FocusNode _validityAppNode = FocusNode();
  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _whatsAppKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _addressKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> dateKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> validityKey =
  GlobalKey<FormFieldState<String>>();
  late final TextEditingController productCategory = TextEditingController();
  late final TextEditingController whatsApp = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController dateFrom = TextEditingController();
  late final TextEditingController validityTO = TextEditingController();
  late final TextEditingController _controller = TextEditingController();
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextEmpty = _controller.text.isEmpty;
      });
    });
  }

  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }

  List<Map<String, dynamic>> filteredCategories = [];

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be as tall as needed
      builder: (BuildContext context) {
        return Container(
          // color: Colors.white,
          width: double.infinity,
          decoration: BoxDecoration(
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
                  borderRadius: BorderRadius.only(
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
                      icon: Icon(Icons.close, color: Colors.white),
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
              SizedBox(height: 10), // Spacing between header and search field

              // Search field
              Padding(
                padding: EdgeInsets.symmetric(horizontal:  15, vertical: 10),
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
              SizedBox(height: 10), // Spacing between search field and list

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
                                whatsApp.text = category['whatsappNumber'] ?? '';
                                address.text = category['Address'] ?? '';
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

                                  Row(
                                    children: [
                                      const Text("Address: ", style: FTextStyle.listTitle),
                                      Text(category['Address'] ?? '', style: FTextStyle.listTitleSub),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Add a divider if it's not the last item
                        if (index < productCategories.length - 1)
                          Divider(height: 1, color: Colors.grey.shade300),
                        SizedBox(height: 15),
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
        dateFrom.text = formattedDate;
      });
    }
  }
  void _selectDateTo(BuildContext context) async {
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

        validityTO.text = formattedDate;
      });
    }
  }
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
        flexibleSpace: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 29.0),
                  child: Text(
                    'Add Quotations',
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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Date",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Validity",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            key: dateKey,
                            focusNode: _dateAppNode,
                            keyboardType: TextInputType.text,
                            decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                              hintText: "dd-mm-yyyy",
                              suffixIcon: IconButton(
                                icon: const Icon(
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
                            controller: dateFrom,
                            validator: ValidatorUtils.dateValidator,
                            onTap: () {
                              setState(() {
                                isProductCategoryFieldFocused = false;
                              });
                            },
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            key: validityKey,
                            focusNode: _validityAppNode,
                            keyboardType: TextInputType.text,
                            decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                              hintText: "dd-mm-yyyy",
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.calendar_today, // Calendar icon
                                  color: Colors.grey, // Adjust color as needed
                                ),
                                onPressed: () {
                                  // Show date picker when the icon is pressed
                                  _selectDateTo(context);
                                },
                              ),
                            ),
                            inputFormatters: [NoSpaceFormatter()],
                            controller: validityTO,
                            validator: ValidatorUtils.model,
                            onTap: () {
                              setState(() {
                                isProductCategoryFieldFocused = false;
                              });
                            },
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),



                  Text(
                    "Select User Types",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: (MediaQuery.of(context).size.width >= 1024) ? 60 : 42,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isSelectedCustomer = true;


                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              backgroundColor: isSelectedCustomer
                                  ? AppColors.primaryColour
                                  : AppColors.drawerdisableButtonColor,
                            ),
                            child: Text(
                              'Customer',
                              style: FTextStyle.loginBtnStyle,
                            ),
                          ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: (MediaQuery.of(context).size.width >= 1024) ? 60 : 42,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isSelectedCustomer = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              backgroundColor: isSelectedCustomer
                                  ? AppColors.drawerdisableButtonColor
                                  : AppColors.primaryColour,
                            ),
                            child: Text(
                              'Dealer',
                              style: FTextStyle.loginBtnStyle,
                            ),
                          ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isSelectedCustomer ? "Customer Name" : "Dealer Name",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      SizedBox(
                        height: (MediaQuery.of(context).size.width >= 1024) ? 60 : 27,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => CustomerEdit(
                                screenFlag :"",
                                name :"",
                                usertype:"",
                                whatsapp:"",
                                email:""



                            )));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            backgroundColor: AppColors.primaryColour,
                          ),
                          child: Text(
                            isSelectedCustomer ? 'Customer +' : 'Dealer +',
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
                            hintText: isSelectedCustomer ? "Select Customer" : "Select Dealer",
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),

                          onTap: () {
                            setState(() {
                              isProductCategoryFieldFocused = true;
                              isWhatsAppFIeldFocused = false;
                            });
                            _showBottomSheet(); // Open the bottom sheet when tapped
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    isSelectedCustomer ? "Customer WhatsApp Number" : "Dealer WhatsApp Number",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _whatsAppKey,
                      focusNode: _whatsAppNode,
                      keyboardType: TextInputType.text,
                      controller: whatsApp,
                      decoration:  FormFieldStyle.defaultAddressInputDecoration.copyWith(  hintText: isSelectedCustomer ? "Enter Customer WhatsApp Number" : "Enter Dealer WhatsApp Number",),
                      // decoration: InputDecoration(
                      //   hintText: isSelectedCustomer ? "Enter Customer WhatsApp Number" : "Enter Dealer WhatsApp Number",
                      //   border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(4.0),
                      //   ),
                      // ),
                      inputFormatters: [NoSpaceFormatter()],
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused = false;
                          isWhatsAppFIeldFocused = true;
                        });
                      },
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                  Text(
                    isSelectedCustomer ? "Customer Address" : "Dealer Address",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _addressKey,
                      focusNode: _addressAppNode,
                      keyboardType: TextInputType.text,
                      controller: address,
                      decoration:  FormFieldStyle.defaultAddressInputDecoration.copyWith(     hintText: isSelectedCustomer ? "Enter Customer Address" : "Enter Dealer Address",),

                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused = false;
                          isWhatsAppFIeldFocused = true;
                        });
                      },
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
