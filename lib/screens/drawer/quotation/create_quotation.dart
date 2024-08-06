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
class CreateQuotationScreen extends StatefulWidget {
  const CreateQuotationScreen({super.key});

  @override
  State<CreateQuotationScreen> createState() => _CreateQuotationScreenState();
}

class _CreateQuotationScreenState extends State<CreateQuotationScreen> {
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


  bool isSelectedCustomer=true;
  bool isButtonEnabled = false;
  bool isWhatsAppFIeldFocused = true;
  // String? selectedProductCategory;
 bool isProductCategoryFieldFocused=false;
  late final FocusNode _productCategoryNode = FocusNode();
  late final FocusNode _whatsAppNode = FocusNode();
  late final FocusNode _addressAppNode = FocusNode();
  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _whatsAppKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _addressKey =
  GlobalKey<FormFieldState<String>>();
  late final TextEditingController productCategory = TextEditingController();
  late final TextEditingController whatsApp = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController _controller = TextEditingController();
bool _isTextEmpty=true;
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
  @override
  Widget build(BuildContext context){
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
                  'Add Quotations' ,
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
      padding: const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select User Types",
              style: FTextStyle.formLabelTxtStyle,
            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
            const SizedBox(height: 5),
            // Row for Customer and Dealer buttons with equal width
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
                const SizedBox(width: 10), // Spacing between buttons
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
            // Select Customer or Dealer Name and Customer + button
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
                      // Handle Customer + button press
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
              child: DropdownButtonFormField<Map<String, dynamic>>(
                key: _productCategoryKey,
                focusNode: _productCategoryNode,
                value: selectedProductCategory,

                hint: Text(
                  "Select a Category",
                  style: TextStyle(color: Colors.grey),
                ),
                items: productCategories.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> category = entry.value;

                  return DropdownMenuItem<Map<String, dynamic>>(

                    value: category,

                    child: Container(
                      color: Colors.purple[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(category['whatsappNumber']),
                          Text(category['Address']),
                          if (index < productCategories.length - 1)
                            Divider(height: 1, thickness: 2),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (Map<String, dynamic>? newValue) {
                  setState(() {
                    selectedProductCategory = newValue;

                    if (newValue != null) {
                      productCategory.text=newValue['name']??"";
                      whatsApp.text = newValue['whatsappNumber'] ?? '';
                      address.text = newValue['Address'] ?? '';
                    } else {
                      whatsApp.clear();
                      address.clear();
                    }
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
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
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText:     isSelectedCustomer ? "Enter Customer WhatsApp Number":"Enter Dealer WhatsApp Number"),
                inputFormatters: [NoSpaceFormatter()],
                controller: whatsApp,
                validator: ValidatorUtils.model,
                onTap: () {
                  setState(() {
                    isProductCategoryFieldFocused=false;

                    isWhatsAppFIeldFocused = true;
                  });
                },
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
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
                decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText:     isSelectedCustomer ? "Enter Customer Address":"Enter Dealer Address"),
                inputFormatters: [NoSpaceFormatter()],
                controller: address,
                validator: ValidatorUtils.model,
                onTap: () {
                  setState(() {
                    isProductCategoryFieldFocused=false;

                    isWhatsAppFIeldFocused = true;
                  });
                },
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
            ),
            const SizedBox(height: 45),
            // Add Quotations Button
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  height: (MediaQuery.of(context).size.width >= 1024) ? 70 : 52,
                  child: ElevatedButton(
                    onPressed: isButtonEnabled
                        ? () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuotationList(),
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
                      'Add Quotations',
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    )
        ])
    );
  }
}
