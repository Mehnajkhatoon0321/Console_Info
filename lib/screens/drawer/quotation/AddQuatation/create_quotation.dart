import 'package:consol_info/screens/drawer/master/customer_dealers/customer_edit.dart';
import 'package:consol_info/screens/drawer/quotation/AddQuatation/add_model_details.dart';
import 'package:consol_info/screens/drawer/quotation/AddQuatation/add_service_details.dart';
import 'package:consol_info/screens/drawer/quotation/quotation_list.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreateQuotationScreen extends StatefulWidget {
  @override
  _CreateQuotationScreenState createState() => _CreateQuotationScreenState();
}

class _CreateQuotationScreenState extends State<CreateQuotationScreen> {
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
  final List<Map<String, String>> modelList = [
    {
      "model": "Model A",
      "brand": "Brand X",
      "gst": "Included",
      "warranty": "2 Years",
      "price": "1000",
      "quantity": "10",
      "total": "10000",
      "description":"4 MP DOME FULL COLOUR SILVER SERIES"
    },
    {
      "model": "Model B",
      "brand": "Brand Y",
      "gst": "Excluded",
      "warranty": "1 Year",
      "price": "2000",
      "quantity": "5",
      "total": "10000",
      "description":"4 MP DOME FULL COLOUR SILVER SERIES"
    },
    // Add more items as needed
  ];
  final List<Map<String, String>> serviceList = [
    {
      "service": "Service A",
      "validity": "2025-03-15",
      "gst": "Included",
      "paymentstatus": "2 Years",
      "price": "1000",
      "quantity": "10",
      "total": "10"},
    {
      "service": "Service A",
      "validity": "2025-03-15",
      "gst": "Included",
      "paymentstatus": "2 Years",
      "price": "1000",
      "quantity": "10",
      "total": "200",
    },

    // Add more items as needed
  ];
  List<String> gstCategories = [
    'Included',
    'Excluded',

  ];
  String? selectGstType;
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
  bool isOrderSummary = false;
  bool isSelectedCustomer = true;
  bool isServiceSelected = false;
  bool isButtonEnabled = false;
  bool isWhatsAppFIeldFocused = true;
  bool isProductCategoryFieldFocused = false;
  late final FocusNode _productCategoryNode = FocusNode();
  late final FocusNode _whatsAppNode = FocusNode();
  late final FocusNode _addressAppNode = FocusNode();
  late final FocusNode _dateAppNode = FocusNode();
  late final FocusNode _validityAppNode = FocusNode();
  late final FocusNode _gstTypeNode = FocusNode();
  late final FocusNode _allowanceTypeNode = FocusNode();
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
  late final GlobalKey<FormFieldState<String>> gstKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> allowanceKey =
  GlobalKey<FormFieldState<String>>();
  late final TextEditingController productCategory = TextEditingController();
  late final TextEditingController whatsApp = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController dateFrom = TextEditingController();
  late final TextEditingController validityTO = TextEditingController();
  late final TextEditingController _controller = TextEditingController();
  late final TextEditingController _allowance = TextEditingController();
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextEmpty = _controller.text.isEmpty;
      });
    });
    if (gstCategories.isNotEmpty) {
      selectGstType = gstCategories[0]; // Set default value to the first item
    }

    calculateTotalAmount();
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
                                whatsApp.text = category['whatsappNumber'] ?? '';
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

  int totalAmount = 0;
  int totalAmountAllowance = 0;
  int totalMaintenance=0;
  int totalGstAllowance=0;
  void calculateTotalAmount() {
    totalAmount = 0;
    for (var item in modelList) {
      String totalString = item["total"] ?? "0";
      int totalValue = int.tryParse(totalString.replaceAll("₹", "").replaceAll(",", "")) ?? 0;
      totalAmount += totalValue;
    }
  }

  void onAllowanceChanged(String value) {
    // Calculate the percentage of the totalAmount when allowance changes
    double allowancePercentage = double.tryParse(value) ?? 0;

    setState(() {
      // Calculate allowance and convert to integer by rounding
      totalAmountAllowance = (totalAmount * (allowancePercentage / 100)).round();

      // Reset totalMaintenance
      totalMaintenance = 0;

      // Update totalMaintenance and totalGstAllowance based on GST inclusion
      if (totalAmountAllowance >= 0) {
        if (selectGstType == gstCategories[0]) { // Assuming 'Included' is the first category
          // Calculate totalMaintenance as 18% of the allowance
          totalMaintenance = (totalAmountAllowance * 0.18).round();
        }

        // Set totalGstAllowance based on GST inclusion or exclusion
        totalGstAllowance = selectGstType == gstCategories[0]
            ? totalAmountAllowance + totalMaintenance // GST included
            : totalAmountAllowance; // GST excluded
      } else {
        // Handle negative allowance case
        totalGstAllowance = totalAmountAllowance; // No GST added
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    int totalAmount = 0;
    for (var item in modelList) {
      String totalString = item["total"] ?? "0";
      int totalValue = int.tryParse(totalString.replaceAll("₹", "").replaceAll(",", "")) ?? 0;
      totalAmount += totalValue;
    }


    int totalAmountServices = 0;
    for (var item in serviceList) {
      String totalString = item["total"] ?? "0";
      int totalValue = int.tryParse(totalString.replaceAll("₹", "").replaceAll(",", "")) ?? 0;
      totalAmountServices += totalValue;
    }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Validity",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                        const SizedBox(height: 5),

                        Text(
                          "8 days",
                          style: FTextStyle.formLabelTxtStyle.copyWith(
                              color: AppColors.primaryColour
                          ),
                        ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Date",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!,
                    ),
                    Padding(
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
                                  whatsApp.text="";
                                  address.text="";
                                  productCategory.text="";
        
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
                                  whatsApp.text="";
                                  address.text="";
                                  productCategory.text="";
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
                      isSelectedCustomer ? "Installation Address" : "Installation Address",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        key: _addressKey,
                        focusNode: _addressAppNode,
                        keyboardType: TextInputType.text,
                        controller: address,
                        decoration:  FormFieldStyle.defaultAddressInputDecoration.copyWith(     hintText: isSelectedCustomer ? "Enter Installation Address" : "Enter Installation Address",),
        
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
                     "Add Model Details",
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 10,),
        

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddModelDetails(
                              screenFlag:"",
                               modelName :""   ,
                              brandName:"",
                              gst:"",
                              warranty:"",
                              amount:"",
                              quantity:"",
                              total:"",
                            descriptions: "",

                          )),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration:  BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add Model Details",style: FTextStyle.formLabelTxtStyle),
                             const Icon(
                              Icons.add,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: modelList.isNotEmpty
                          ? modelList.asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.purple[50],
                            border: Border.all(color: Colors.purple[100]!),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["model"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Brand: ", style: FTextStyle.listTitleSub,
                                        children: [
                                          TextSpan(text: item["brand"] ?? "", style: FTextStyle.listTitle),
                                          const TextSpan(text: "\nGST: ", style: FTextStyle.listTitleSub),
                                          TextSpan(text: item["gst"] ?? "", style: FTextStyle.listTitle),
                                          const TextSpan(text: "\nWarranty: ", style: FTextStyle.listTitleSub),
                                          TextSpan(text: (item["warranty"] ?? "").toUpperCase(), style: FTextStyle.listTitle),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _showDeleteDialog(index); // Pass the index here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
                                      minimumSize: const Size(50, 30),
                                    ),
                                    child: const Icon(Icons.delete_forever, color: Colors.white),
                                  ),
                                  const SizedBox(width: 5),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddModelDetails(
                                            screenFlag: "edit",

                                          modelName :"${item["model"]}" ,
                                          brandName:"${ item["brand"]}",
                                          gst:"${item["gst"]}",
                                          warranty:"${item["warranty"]}",
                                          amount:"${item["price"]}",
                                          quantity:"${item["quantity"]}",
                                          total:"${item["total"]}",
                                          descriptions: "${item["price"]}",


                                        )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColour,
                                      padding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
                                      minimumSize: const Size(50, 30),
                                    ),
                                    child: const Icon(Icons.edit, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: AppColors.primaryColour),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: "Amount\n",
                                          style: FTextStyle.listTitle,
                                          children: [
                                            TextSpan(text: item["price"] ?? "", style: FTextStyle.listTitleSub),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 1,
                                      color: AppColors.primaryColour,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: "Quantity\n",
                                          style: FTextStyle.listTitle,
                                          children: [
                                            TextSpan(text: item["quantity"] ?? "", style: FTextStyle.listTitleSub),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 1,
                                      color: AppColors.primaryColour,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: "Total\n",
                                          style: FTextStyle.listTitle,
                                          children: [
                                            TextSpan(text: item["total"] ?? "", style: FTextStyle.listTitleSub),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()
                          : [const Center(child: Text('No items available'))],
                    ),


                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddModelDetails(


                            screenFlag:"",
                            modelName :""   ,
                            brandName:"",
                            gst:"",
                            warranty:"",
                            amount:"",
                            quantity:"",
                            total:"",
                            descriptions: "",)),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color:AppColors.gray_2,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        child: Column(
                          children: [

                            const SizedBox(height: 30,),
                            const Icon(Icons.add_box_rounded,color:AppColors.gray_4,size: 50, ),
                            const SizedBox(height: 10,),
                            Text("Add Model",style :FTextStyle.formLabelTxtStyle),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),



                    Text(
                      "Add Services",
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
                                  isServiceSelected = true; // Set to "Yes"
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                backgroundColor: isServiceSelected
                                    ? AppColors.primaryColour
                                    : AppColors.drawerdisableButtonColor,
                              ),
                              child: Text(
                                'Yes',
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
                                  isServiceSelected = false; // Set to "No"
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                backgroundColor: isServiceSelected
                                    ? AppColors.drawerdisableButtonColor
                                    : AppColors.primaryColour,
                              ),
                              child: Text(
                                'No',
                                style: FTextStyle.loginBtnStyle,
                              ),
                            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                          ),
                        ),
                      ],
                    ),

                    Visibility(
                      visible: isServiceSelected, // Show only if "Yes" is selected
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Services Details",
                            style: FTextStyle.formLabelTxtStyle,
                          ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                          const SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddServiceDetail(
                                    screenFlag: ""
                                )),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Add Service Details", style: FTextStyle.formLabelTxtStyle),
                                  const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),

                          Column(
                            children: serviceList.isNotEmpty
                                ? serviceList.asMap().entries.map((entry) {
                              int index = entry.key;
                              var item = entry.value;
                              return Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor_alpha_15,
                                  border: Border.all(color: AppColors.primaryColor_alpha_55!),
                                ),
                                padding: const EdgeInsets.all(7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item["service"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 7),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              text: "Validity: ", style: FTextStyle.listTitleSub,
                                              children: [
                                                TextSpan(text: item["validity"] ?? "", style: FTextStyle.listTitle),
                                                const TextSpan(text: "\nGST: ", style: FTextStyle.listTitleSub),
                                                TextSpan(text: item["gst"] ?? "", style: FTextStyle.listTitle),
                                                const TextSpan(text: "\nPayment Status: ", style: FTextStyle.listTitleSub),
                                                TextSpan(text: (item["paymentstatus"] ?? "").toUpperCase(), style: FTextStyle.listTitle),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Call a function to remove the item or show a delete dialog
                                            _showDeleteDialogService(index);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            padding: EdgeInsets.zero,
                                            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
                                            minimumSize: const Size(50, 30),
                                          ),
                                          child: const Icon(Icons.delete_forever, color: Colors.white),
                                        ),
                                        const SizedBox(width: 5),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => AddServiceDetail(screenFlag: "edit")),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primaryColour,
                                            padding: EdgeInsets.zero,
                                            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
                                            minimumSize: const Size(50, 30),
                                          ),
                                          child: const Icon(Icons.edit, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: AppColors.primaryColour),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: "Amount\n",
                                                style: FTextStyle.listTitle,
                                                children: [
                                                  TextSpan(text: item["price"] ?? "", style: FTextStyle.listTitleSub),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 1,
                                            color: AppColors.primaryColour,
                                          ),
                                          Expanded(
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: "Quantity\n",
                                                style: FTextStyle.listTitle,
                                                children: [
                                                  TextSpan(text: item["quantity"] ?? "", style: FTextStyle.listTitleSub),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 1,
                                            color: AppColors.primaryColour,
                                          ),
                                          Expanded(
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: "Total\n",
                                                style: FTextStyle.listTitle,
                                                children: [
                                                  TextSpan(text: item["total"] ?? "", style: FTextStyle.listTitleSub),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList()
                                : [const Center(child: Text('No items available'))],
                          )
,

                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddServiceDetail(screenFlag: "")),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.gray_2,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30,),
                                  const Icon(Icons.add_box_rounded, color: AppColors.gray_4, size: 50, ),
                                  const SizedBox(height: 10,),
                                  Text("Add Service", style: FTextStyle.formLabelTxtStyle),
                                  const SizedBox(height: 30,),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),



                    const SizedBox(height: 10,),
                    Text("Warranty As Per Parent Company norms, however Customers opting for Annual Services Plan are liable for free onsite support, any services or visit done onsite beyond the terms of AMC will be charged extras. All Prices Are GST Paid, except material used during wiring and charges of installation.",
                      style: FTextStyle.formhintTxtStyle.copyWith(
                        color: Colors.green,
                        fontSize: 14
                      )),
                    const SizedBox(height: 10,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

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
                                    "Sub Total",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation2']!,
                                  ),
                                  Text(
                                    "₹${totalAmount+(isServiceSelected ? totalAmountServices : 0)}",
                                    style: FTextStyle.formLabelTxtStyle,
                                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                ],
                              ),
                            ),
                          ),),

                        // First Text and TextFormField Pair
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Allowance Maintenance in % percent",
                                style: FTextStyle.formLabelTxtStyle,
                              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding:  const EdgeInsets.symmetric(vertical: 10.0),
                                child: TextFormField(
                                  key: allowanceKey,
                                  focusNode: _allowanceTypeNode,
                                  keyboardType: TextInputType.number,
                                  controller: _allowance,
                                  decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                                    hintText:
                                         "%"

                                  ),
                                  inputFormatters: [NoSpaceFormatter()],
                                  validator: ValidatorUtils.model,
                                  onChanged: onAllowanceChanged,
                                  onTap: () {
                                    setState(() {
                                      isProductCategoryFieldFocused = false;

                                    });
                                  },
                                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                              ),
                            ),// Add spacing between text and input field

                          ],
                        ),

                        const SizedBox(height: 8), // Add spacing between rows

                        // Second Text and TextFormField Pair
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


                                          selectGstType = newValue;
                                      if (totalAmountAllowance >= 0) {
                                        if (selectGstType == gstCategories[0]) { // Assuming 'Included' is the first category
                                          // Calculate totalMaintenance as 18% of the allowance
                                          totalMaintenance = (totalAmountAllowance * 0.18).round();
                                        }

                                        // Set totalGstAllowance based on GST inclusion or exclusion
                                        totalGstAllowance = selectGstType == gstCategories[0]
                                            ? totalAmountAllowance + totalMaintenance // GST included
                                            : totalAmountAllowance; // GST excluded
                                      } else {
                                        // Handle negative allowance case
                                        totalGstAllowance = totalAmountAllowance; // No GST added
                                      }



                                    });




                                  },
                                  decoration:FormFieldStyle.dropDown,

                                  validator: ValidatorUtils.model,
                                ),
                              ),
                            ),
                          ],
                        ),



                      ],
                    )
,



                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isOrderSummary = !isOrderSummary; // Toggle order summary visibility
                        });
                      },
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.FormFieldBackColour,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(16.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: 10.h, bottom: 5.w),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Quatation Summary',
                                                      style: FTextStyle.FaqsTxtStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.arrow_drop_down)
                                              // Image(
                                              //   image: AssetImage("assets/images/drop_down.png"),
                                              //   width: 24.h,
                                              //   height: 24.h,
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Visibility(
                                      visible: isOrderSummary,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Models Amount',
                                                  style: FTextStyle.cartItemColors,
                                                ),
                                                Text(
                                                  "₹${totalAmount.toString()}",
                                                  style: FTextStyle.formLabelTxtStyle,
                                                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Services Amount',
                                                  style: FTextStyle.cartItemColors,
                                                ),
                                                Text(
                                                    isServiceSelected==false ?"₹ 0": "₹${totalAmountServices.toString()}",
                                                  style: FTextStyle.formLabelTxtStyle,
                                                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Maintenance',
                                                  style: FTextStyle.cartItemColors,
                                                ),
                                                Text(
                                                  "₹${totalGstAllowance}",
                                                  style: FTextStyle.formLabelTxtStyle,
                                                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ),
                                          // Additional summary details can be added here
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10.h),
                                      child: const Divider(color: AppColors.dividerColor, height: 1.0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Amount',
                                            style: FTextStyle.cartItemColors,
                                          ),
                                          Text(
                                            '₹${(totalGstAllowance + (isServiceSelected ? totalAmountServices : 0) + totalAmount).toString()} ',
                                            style: FTextStyle.FaqsTxtStyle,
                                          )


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

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
                                  builder: (context) =>  const QuotationList(),
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
                             'Add Quotation',
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
                    modelList.removeAt(index);
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
  void _showDeleteDialogService(int index) {
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
                    serviceList.removeAt(index);
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
