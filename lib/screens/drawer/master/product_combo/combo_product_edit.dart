import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class ComboProductEdit extends StatefulWidget {
  String screenFlag;
   ComboProductEdit({required this.screenFlag,super.key});

  @override
  State<ComboProductEdit> createState() => _ComboProductEditState();
}

class _ComboProductEditState extends State<ComboProductEdit> {


  late final FocusNode _modelNode = FocusNode();
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController model = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _modelKey =
  GlobalKey<FormFieldState<String>>();
  bool    isModelFieldFocused = false;
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
                    widget.screenFlag.isEmpty ? 'Create Combo' : 'Edit Combo',
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
            padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
            child: Form(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Combo Name",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _modelKey,
                      focusNode: _modelNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter Combo Name"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: model,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {

                          isModelFieldFocused = true;

                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
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
