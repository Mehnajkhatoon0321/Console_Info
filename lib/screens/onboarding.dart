import 'package:consol_info/all_api/auth_flow/auth_flow_bloc.dart';
import 'package:consol_info/screens/login_screen.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onBoardingList = [
    {
      "image": "assets/Images/onboard.png",
      "title": "3D Rendering",
      "desc":
      "Camera systems leverage advanced 3D rendering technology to deliver exceptional visual performance. Our solutions provide accurate and detailed 3D models of camera installations, enabling precise placement  for various environments.",
    },
    {
      "image": "assets/Images/onboard1.png",
      "title": "Premium Vector ",
      "desc":
      "Our premium vector-based camera analysis tools offer high-resolution  metrics. With detailed vector graphics,its ensures that every aspect of camera performance is clearly represented, helping you make informed decisions about installation .",
    },
    {
      "image": "assets/Images/onboard2.png",
      "title": "Los Angeles",
      "desc":
      "Tailor camera installations to meet your specific needs with Camera’s customizable solutions. Whether it's optimizing coverage in a large facility or enhancing surveillance in specific areas, our platform allows for precise adjustments  to ensure maximum performance and reliability.",
    },
  ];

  void onNext() {
    if (currentIndex < onBoardingList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => AuthFlowBloc(),
              child: LoginScreen(),
            )),
      );
    }
  }

  @override
  void initState() {
    currentIndex = 0;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.r),
                          bottomRight: Radius.circular(25.r),
                        ),
                        child: Image(
                          image: AssetImage(onBoardingList[index]['image']!),
                          width: double.infinity,
                          height: mediaQuery.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          onBoardingList[index]['title']!,
                          style: FTextStyle.aboutUsText2,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          onBoardingList[index]['desc']!,
                          style: FTextStyle.Faqssubtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingList.length,
                  effect: ExpandingDotsEffect(
                    paintStyle: PaintingStyle.fill,
                    dotColor: AppColors.dotColor,
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    activeDotColor: AppColors.activeDotColor,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: GestureDetector(
                    onTap: onNext,
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.drawerButton1Color,
                        borderRadius: BorderRadius.circular(mediaQuery.height),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentIndex == onBoardingList.length - 1
                                  ? "Sign In"
                                  : "Next   ",
                              style: FTextStyle.loginBtnStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 19.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == onBoardingList.length - 1) {
                        // setState(() {
                        //   PrefUtils.setIsLogin(false);
                        // });
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BlocProvider(
                        //       create: (context) => GuestUserBloc(),
                        //       child: Navigation(),
                        //     ),
                        //   ),
                        // );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              BlocProvider(
                                create: (context) => AuthFlowBloc(),
                                child: LoginScreen(),
                              )),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      child: Center(
                        child: Text(
                          currentIndex == onBoardingList.length - 1
                              ? ""
                              : "Skip",
                          style: FTextStyle.drawerText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
