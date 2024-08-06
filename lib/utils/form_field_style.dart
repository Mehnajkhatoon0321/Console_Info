// ignore_for_file: prefer_const_constructors

import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/constant.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class FormFieldStyle {

  //filter address
  static InputDecoration defaultAddressDecorationFilter = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    hintText: "Enter your address",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white,
  );
//filter name


  static InputDecoration defaultNameDecorationFilter = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    hintText: "Enter your name",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white, // Set the background color to white
  );
//filter pincode
  static InputDecoration defaultPincodeDecorationFilter = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    hintText: "Enter pincode",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white, // Set the background color to white
  );

//emailFilter
  static InputDecoration defaultEmailDecorationFilter = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.FormFieldBorderColour,
      ),
    ),
    hintText: "Enter your email",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white, // Set the background color to white
  );




  static InputDecoration defaultemailDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.emailHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: AppColors.FormFieldBackColour);

  static InputDecoration defaultdobDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.emailHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
    suffixIcon: GestureDetector(
      child: Icon(Icons.calendar_today),
      onTap: () {},
    ),
  );

  static InputDecoration defaultnameDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.nameHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: AppColors.FormFieldBackColour);

  static InputDecoration defaultnameEditProfileDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.nameHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: AppColors.FormFieldBackColour);

  static InputDecoration defaultphoneDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.phoneHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: AppColors.FormFieldBackColour);
  static InputDecoration defaultPhoneDecorationFilter = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.phoneHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);
      
  static InputDecoration editProfilephoneDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.phoneHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration defaultotpInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.headingTxtColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.headingTxtColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.headingTxtColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
  );
  static InputDecoration defaultotpErrorInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFielderrorColour,
        )),
  );

  static const InputDecoration defaultDropdownInputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      filled: true,
      fillColor: AppColors.FormFieldBackColour,
    hintText: Constants.dobHint,
    hintStyle: FTextStyle.formhintTxtStyle,

  );




  static InputDecoration defaultDobInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.dobHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
  );

  static InputDecoration defaultPasswordInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.passwordHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
  );

  static InputDecoration defaultConfirmPasswordInputDecoration =
      InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.confirmPasswordHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
  );

  static InputDecoration defaultAddressInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: Constants.addressHint,
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  );

  static InputDecoration defaultBioInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: "Enter Bio",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
  );

// decoration for Contact us form in Guest user

  static InputDecoration defaultFullNameDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: "Enter your name",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white,
  );

  static InputDecoration defaultContactUsemailDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Enter your email",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration contactUsphoneDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: Constants.phoneHint,
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

static InputDecoration imageNameInputDecoration =InputDecoration(
      hintText: 'Enter File Name',
      hintStyle: FTextStyle
          .formhintTxtStyle, // Assuming FTextStyle is defined in font_text_Style.dart
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.FormFieldBorderColour),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.FormFieldBorderColour),
      ),
    );
  
  static InputDecoration defaultMessageInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.FormFieldBorderColour,
        )),
    hintText: "Enter your message",
    hintStyle: FTextStyle.formhintTxtStyle,
    filled: true,
    fillColor: Colors.white,
  );
//Guest user Doctor view

  static InputDecoration defaultDoctorSearchDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
     
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Search doctor or specialist",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration defaultDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Search hospital   ",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

//patient prescription searchbar

  static InputDecoration defaultPatientPrescriptionDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 34),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      hintText: "Search hospital",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration defaultInsuranceSearchDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Search insurance",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration defaultLabsSearchDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Search lab",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white

  );
  static InputDecoration defaultFilterInputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.primaryColour,
          )),
      filled: true,
      fillColor: Colors.white);

  static InputDecoration defaultDoctorPoliciesSearchDecoration =
      InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Image(
              image: AssetImage("assets/images/search_icon.png"),
            ),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.FormFieldBorderColour,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.FormFieldBorderColour,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.FormFieldBorderColour,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.FormFieldBorderColour,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.FormFieldBorderColour,
              )),
          hintText: "Search lab",
          hintStyle: FTextStyle.formhintTxtStyle,
          filled: true,
          fillColor: Colors.white);

  static InputDecoration defaultSearchDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Image(
          image: AssetImage("assets/images/search_icon.png"),
        ),
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.FormFieldBorderColour,
          )),
      hintText: "Search    ",
      hintStyle: FTextStyle.formhintTxtStyle,
      filled: true,
      fillColor: Colors.white);

  static InputDecoration dropDown=InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color:   AppColors.FormFieldBorderColour),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColour),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.FormFieldBorderColour),
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    filled: true,
    fillColor: AppColors.FormFieldBackColour,
    hintText: "Select Product Category",
    hintStyle:FTextStyle.formhintTxtStyle,
    errorStyle: TextStyle(color: Colors.red),
  );
}
