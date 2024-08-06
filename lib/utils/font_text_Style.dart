import 'package:consol_info/utils/colours.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FTextStyle {

 
  static  TextStyle filterTextstyle = TextStyle(
    fontFamily: 'Outfit-SemiBold',
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.drawerTextColor,
  );

  static const smallTextBlack =TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static const smallY = TextStyle(
      fontFamily: 'Poppins-Regular',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.headingTxtColour );

  static TextStyle HeadingTxtStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.headingTxtColour,


      fontFamily: 'Outfit-SemiBold',
      fontWeight: FontWeight.w500);


  static TextStyle HeadingTab = TextStyle(
      fontSize: 28.sp,
      color: AppColors.primaryColour,


      fontFamily: 'Outfit-SemiBold',
      fontWeight: FontWeight.w900);



  static TextStyle SplashHeadingTab = TextStyle(
      fontSize: 38.sp,
      color: AppColors.primaryColour,


      fontFamily: 'Outfit-SemiBold',
      fontWeight: FontWeight.w900);

  static TextStyle HeadingTxtWhiteStyle = TextStyle(
      fontSize: 20.sp,
      color: Colors.white,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.bold);

  static TextStyle preHeadingStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontFamily: 'Outfit-Regular',
      );

  static TextStyle preHeading16BoldStyle = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.bold
  );

  static TextStyle preHeadingBoldStyle = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.bold
  );


  static TextStyle SubHeadingTxtStyle = TextStyle(
      fontSize: 16,
      color: AppColors.headingTxtColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

    //14 normal
  static  TextStyle formLabelTxtStyle = TextStyle(
    fontFamily: 'Outfit-SemiBold',
    fontSize: 15.sp,
    // fontWeight: FontWeight.w300,
    color: AppColors.drawerTextColor,
  );

  static TextStyle tncStyle = TextStyle(
      fontSize: 12.sp,
      color: AppColors.headingTxtColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

  static TextStyle formSubheadingTxtStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.FormFieldHintColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);
 

 
  static TextStyle rememberMeTextStyle = TextStyle(
    fontFamily: 'Outfit-Regular',
    //fontSize: 10.sp,

    fontSize: 14.sp,
    color: AppColors.primaryColour,
    fontWeight: FontWeight.w400,
  );

  static  TextStyle SeeAllTextStyle = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16,
    color: AppColors.primaryColour,
    fontWeight: FontWeight.bold,
  );


  static TextStyle timerTextStyle = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 14.sp,
    color: AppColors.FormFielderrorColour,
    fontWeight: FontWeight.w400,
  );
  static TextStyle addStyle = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColour,
  );


  static TextStyle authlogin_signupTxtStyle = TextStyle(
 
      fontSize: 16.sp,
      color: AppColors.headingTxtColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.bold);


  static TextStyle forgotPasswordTxtStyle = TextStyle(
      //fontSize: 10.sp,

      fontSize: 14.sp,
      color: AppColors.primaryColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

  static TextStyle tnc2Style = TextStyle(
      fontSize: 12.sp,
      color: AppColors.primaryColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);



  //16 normal
  static TextStyle formErrorTxtStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.FormFielderrorColour,
    fontFamily: 'Outfit-Regular',
  );

  static TextStyle loginBtnStyle = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle nameProfile = TextStyle(
    fontFamily: 'Outfit-SemiBold',
    fontSize: 16.sp,
    // fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle emailProfile = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Guest user text style

  static TextStyle drawerText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerTextColor,
  );
  static TextStyle drawerButton1Text = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle drawerButton2Text = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText1 = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle bottomNavText2 = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.bottomNavTextColor,
  );
  static TextStyle aboutUsText2 = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.aboutUsHeadingColor,
  );
  static TextStyle aboutUsText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.aboutUsTextcolor,
  );

  static TextStyle contactUsLabelTxtStyle = TextStyle(
      fontSize: 15.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

  static TextStyle contactUsdetailsTxtStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.bold);

  static TextStyle FaqsSubTxtStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

  static const TextStyle formhintTxtStyle = TextStyle(
      // fontSize: 11.sp,  //16 normal
      fontSize: 16, //16 normal
      color: AppColors.FormFieldHintColour,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);

  static const TextStyle listTitle = TextStyle(


      fontFamily: 'Outfit-Regular',

      fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleBig = TextStyle(


      fontFamily: 'Outfit-Regular',

      fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black,

  );
  static const TextStyle listTitleSub = TextStyle(


      fontFamily: "Outfit-SemiBold",

      fontSize: 14,fontWeight: FontWeight.w600,color: Colors.grey,

  );
  static const TextStyle listTitleSubBig = TextStyle(


      fontFamily: "Outfit-SemiBold",

      fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey,

  );




  static TextStyle formFieldErrorTxtStyleTablet = TextStyle(
    fontFamily: 'Poppins-Regular',
    fontSize: 7.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );
  static const formFieldErrorTxtStyle = TextStyle(
    fontFamily: 'Poppins-Regular',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  static TextStyle SeeAllText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerButton1Color,
  );

  static TextStyle CategoriesText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.drawerTextColor,
  );


 static TextStyle doNotHave = TextStyle(
      fontSize: 14.sp,
      color: AppColors.hospital1Textcolor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);










  static  TextStyle FaqsTxtStyle = TextStyle(
      fontSize: 15.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w800);

  static  TextStyle Faqssubtitle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.aboutUsHeadingColor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w500);


  static TextStyle CategoriesNameText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.aboutUsHeadingColor,
  );
  static TextStyle ProductsNameText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.aboutUsHeadingColor,
  );
  static TextStyle ProductsDetailsText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 9.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.productdetailsColor,
  );
  static TextStyle ProductsPriceText = TextStyle(
    fontFamily: 'Outfit-SemiBold',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.drawerButton1Color,
  );
  static TextStyle UserNameText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle OrderButtonText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColour,
  );
  static TextStyle ConfirmedButtonText = TextStyle(
    fontFamily: 'Outfit-Regular',
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.headingTxtColour,
  );
  
  static  TextStyle productCard = TextStyle(
    fontFamily: 'Outfit-Regular',

    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle cartItemColors = TextStyle(
      fontSize: 14.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);


  static TextStyle successItemColors = TextStyle(
      fontSize: 12.sp,
      color: AppColors.contactUsTextcolor,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);


  static TextStyle doctorbutton1TextStyle = TextStyle(
      fontSize: 13.17,
      color: AppColors.patientApplyTextButton,
      fontFamily: 'Outfit-Regular',
      fontWeight: FontWeight.w400);









  


}


