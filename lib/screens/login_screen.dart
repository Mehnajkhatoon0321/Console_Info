import 'package:consol_info/all_api/auth_flow/auth_flow_bloc.dart';
import 'package:consol_info/screens/dashboard_screen.dart';
import 'package:consol_info/screens/forgot_password.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/common_popups.dart';
import 'package:consol_info/utils/constant.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:consol_info/utils/form_field_style.dart';
import 'package:consol_info/utils/no_space_input_formatter_class.dart';
import 'package:consol_info/utils/pref_utils.dart';
import 'package:consol_info/utils/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _passwordKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailFocusNode = FocusNode();
  late final FocusNode _passwordFocusNode = FocusNode();

  bool passwordVisible = true;
  bool checkboxChecked = false;
  bool isButtonEnabled = false;
  bool passIncorrect = false;
  bool emailIncorrect = false;
  String emailError = "";

  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;

  bool isValidPass(String pass) {
    if (pass.length == 0) {
      return false;
    }
    return true;
  }

  bool isLoading = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    String password = PrefUtils.getUserPassword();
    String email = PrefUtils.getUserEmailLogin();
    rememberMe = PrefUtils.getRememberMe();
    if (password.isNotEmpty) {
      _password.text = password;
    }

    if (email.isNotEmpty) {
      _email.text = email;
    }
    if (rememberMe) {
      isButtonEnabled = true;
      checkboxChecked = true;
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

    return BlocConsumer<AuthFlowBloc, AuthFlowState>(
  listener: (context, state) {
    {
      if (state is AuthFlowLoading) {
        setState(() {
          isLoading = true;
        });

      } else if (state is LogSuccess) {
        setState(() {
          isLoading = false;
        });

        Map<String, dynamic> data = state.logResponse;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DashboardScreen(),
          ),
        );
        if (data["token"] != null) {
          String bearerToken = data["token"];
          PrefUtils.setToken(bearerToken);

        }


      } else if (state is LogFailure) {
        setState(() {
          isLoading = false;
        });

        CommonPopups.showCustomPopup(context, state.failureMessage);

      }


      else if (state is CheckNetworkConnection){

        CommonPopups.showCustomPopup(
          context,
          'Internet is not connected.',

        );


      }
    }



  },
  builder: (context, state) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
                color: AppColors.primaryColour,
                child: const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Align(alignment: Alignment.topLeft, child: SizedBox()),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                    (displayType == 'desktop' || displayType == 'tablet')
                        ? 50
                        : 20,
                  ),
                  children: [
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    Container(
                      alignment: Alignment.topCenter,

                      child: Image.asset(
                        'assets/Images/logo.png',
                        width: (displayType == 'desktop' || displayType == 'tablet')
                            ? 450.w
                            : 350,
                        height: (displayType == 'desktop' || displayType == 'tablet')
                            ? 100.h
                            : 160,
                      ),
                    ),

                    Center(
                      child: Text(
                        Constants.welcomeTxt,
                        style: FTextStyle.HeadingTxtStyle,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Form(

                        onChanged: () {
                          if (ValidatorUtils.isValidEmail(_email.text) &&
                              isValidPass(_password.text)) {
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
                          if (isPasswordFieldFocused == true) {
                            _passwordKey.currentState!.validate();
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              Constants.emailLabel,
                              style: FTextStyle.formLabelTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            const SizedBox(height: 5),
                            TextFormField(
                              key: _emailKey,
                              focusNode: _emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              decoration: FormFieldStyle.defaultemailDecoration,
                              inputFormatters: [NoSpaceFormatter()],
                              controller: _email,
                              validator: ValidatorUtils.emailValidator,
                              onTap: () {
                                setState(() {
                                  isEmailFieldFocused = true;
                                  isPasswordFieldFocused = false;
                                });
                              },
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            const SizedBox(height: 15),
                            Text(
                              "Password",
                              style: FTextStyle.formLabelTxtStyle,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            const SizedBox(height: 5),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              key: _passwordKey,
                              focusNode: _passwordFocusNode,
                              decoration: FormFieldStyle
                                  .defaultPasswordInputDecoration
                                  .copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.FormFieldBackColour,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: AppColors.FormFieldBackColour,
                              ),
                              controller: _password,
                              obscureText: !passwordVisible,
                              inputFormatters: [NoSpaceFormatter()],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter password";
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                setState(() {
                                  isPasswordFieldFocused = true;
                                  isEmailFieldFocused = false;
                                });
                              },
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkboxChecked = !checkboxChecked;
                                  if (checkboxChecked) {
                                    PrefUtils.setRememberMe(true);
                                    PrefUtils.setUserEmailLogin(
                                        _email.text.toString());
                                    PrefUtils.setUserPassword(
                                        _password.text.toString());
                                  } else {
                                    PrefUtils.setRememberMe(false);
                                    PrefUtils.setUserEmailLogin("");
                                    PrefUtils.setUserPassword("");
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: IconTheme(
                                  data: const IconThemeData(
                                    color: AppColors.primaryColour,
                                    size: 18,
                                  ),
                                  child: Icon(
                                    checkboxChecked
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              Constants.rememberMeTxt,
                              style: FTextStyle.rememberMeTextStyle,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ),
                            );
                          },
                          child: Text(
                            Constants.forgotPassword,
                            style: FTextStyle.forgotPasswordTxtStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 65),
                    SizedBox(
                      height:
                      (displayType == 'desktop' || displayType == 'tablet')
                          ? 70
                          : 52,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () async {
                          setState(() {
                            isLoading = true;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DashboardScreen(),
                            ),
                          );
                          // BlocProvider.of<AuthenticationBloc>(context).add(
                          //   LoginEventHandler(
                          //     email: _email.text.toString(),
                          //     password: _password.text.toString(),
                          //   ),
                          // );
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
                        child:
                        Text(
                            Constants.loginBtnTxt,
                            style: FTextStyle.loginBtnStyle,
                          )

                        // isLoading? CircularProgressIndicator(color: Colors.white,):Text(
                        //   Constants.loginBtnTxt,
                        //   style: FTextStyle.loginBtnStyle,
                        // )
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}

