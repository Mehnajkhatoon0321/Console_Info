import 'package:consol_info/screens/login_screen.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isButtonEnabled = false;
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  bool isEmailFieldFocused = false;
  bool isLoading = false;
  final FocusNode _emailFocusNode = FocusNode();
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
    print('displayType>> $displayType');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColour,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: (displayType == 'desktop' ||  displayType == 'tablet') ? 50 : 20),
                  children: [

                    // Image.asset(
                    //   'assets/images/logo.png',
                    //   height:  110.h,
                    //   width: 180.w,
                    // ),
                    const SizedBox(height:75),
                    Center(
                      child: Text(
                        Constants.ForgotPassTxt,
                        style: FTextStyle.HeadingTxtStyle,
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    const SizedBox(height:30),
                    Center(
                      child: Text(
                        Constants.ForgotPassSubTxt,
                        style: FTextStyle.formSubheadingTxtStyle,
                        textAlign: TextAlign.center, // Aligning text to center
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.only(top:40,bottom:15),
                      child: Form(
                          onChanged: () {
                            if (ValidatorUtils.isValidEmail(_email.text)) {
                              setState(() {
                                isButtonEnabled = true;
                              });
                            } else {
                              setState(() {
                                isButtonEnabled = false;
                              });
                            }
                            if (isEmailFieldFocused == true) {
                              _emailKey.currentState!.validate();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Constants.emailLabel,
                                style: FTextStyle.formLabelTxtStyle,
                              ).animateOnPageLoad(animationsMap[
                              'imageOnPageLoadAnimation2']!),
                              const SizedBox(height: 5,),
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: _emailKey,
                                  focusNode: _emailFocusNode,
                                  decoration: FormFieldStyle
                                      .defaultemailDecoration,
                                  inputFormatters: [NoSpaceFormatter()],
                                  controller: _email,
                                  validator: ValidatorUtils.emailValidator,
                                  onTap: () {
                                    setState(() {
                                      isEmailFieldFocused = true;
                                    });
                                  }
                              ),
                              const SizedBox(height: 15,),
                            ],
                          )
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 25,),
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // BlocProvider.of<AuthenticationBloc>(context).add(ForgotPasswordPatientEventHandler(email: _email.text.toString()
                          // ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26)),
                          backgroundColor: AppColors.primaryColour,
                        ),
                        child:isLoading? const CircularProgressIndicator(color: Colors.white,):Text(
                            Constants.continueBtnTxt,
                            style: FTextStyle.loginBtnStyle
                        ),
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Go back to",
                          style: FTextStyle.formLabelTxtStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          },
                          child:  Text(
                            Constants.signintoAccountTxt,
                            style: FTextStyle.authlogin_signupTxtStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
