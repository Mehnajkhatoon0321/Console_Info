import 'package:consol_info/screens/drawer/employee/leave/all_leaves.dart';
import 'package:consol_info/screens/drawer/employee/profile_details.dart';
import 'package:consol_info/screens/drawer/master/brand.dart';
import 'package:consol_info/screens/drawer/master/product_combo/combo_product.dart';
import 'package:consol_info/screens/drawer/master/customer_dealers/customer_dealers.dart';
import 'package:consol_info/screens/drawer/master/product_category.dart';
import 'package:consol_info/screens/drawer/master/product_screen/product_screen.dart';
import 'package:consol_info/screens/drawer/master/service/service.dart';
import 'package:consol_info/screens/drawer/quotation/create_combo.dart';
import 'package:consol_info/screens/drawer/quotation/AddQuatation/create_quotation.dart';
import 'package:consol_info/screens/drawer/quotation/quotation_list.dart';
import 'package:consol_info/screens/drawer/quotation/services_quotation.dart';
import 'package:consol_info/screens/drawer/services/services_request.dart';
import 'package:consol_info/screens/login_screen.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/attendance_service.dart';
import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/flutter_flow_animations.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:geolocator/geolocator.dart' as geo;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart'; // No alias needed
import 'package:geocoding/geocoding.dart' as geoCoding;
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int? _expandedIndex; // Variable to track the expanded tile index

  List<Map<String, dynamic>> menuItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard},
    {
      'title': 'Master',
      'icon': Icons.category,
      'children': [
        {'subtitle': 'Brand', 'icon': Icons.attach_money},
        {'subtitle': 'Product', 'icon': Icons.production_quantity_limits},
        {'subtitle': 'Product Category', 'icon': Icons.propane_tank_outlined},
        {'subtitle': 'Combo Product', 'icon': Icons.file_copy_outlined},
        {'subtitle': 'Service', 'icon': Icons.business_center},
        {'subtitle': 'Customers & Dealers', 'icon': Icons.file_present},
      ],
    },
    {
      'title': 'Quotation',
      'icon': Icons.format_quote,
      'children': [
        {'subtitle': 'Quotation List', 'icon': Icons.format_quote_outlined},
        {'subtitle': 'Add Product Quotation', 'icon': Icons.format_quote_outlined},
        {'subtitle': 'Add Product Combo', 'icon': Icons.format_quote_outlined},
        {'subtitle': 'Services', 'icon': Icons.local_laundry_service},
        {'subtitle': 'Services Schedules', 'icon': Icons.schedule},
      ],
    },
    {
      'title': 'Services Request',
      'icon': Icons.miscellaneous_services_outlined,
      'children': [
        {'subtitle': 'Existing Product', 'icon': Icons.production_quantity_limits},
        {'subtitle': 'Non Existing Product', 'icon': Icons.miscellaneous_services},
      ],
    },
    {
      'title': 'Employee',
      'icon': Icons.person,
      'children': [
        {'subtitle': 'Profile Details', 'icon': Icons.perm_contact_cal_outlined},
        {'subtitle': 'All Leaves', 'icon': Icons.leave_bags_at_home_sharp},
        // {'subtitle': 'Attendance Clock-In', 'icon': Icons.lock_clock},
        // {'subtitle': 'Attendance Clock-Out', 'icon': Icons.lock_clock_outlined},
      ],
    },
    {'title': 'Logout', 'icon': Icons.logout},
  ];

  List<dynamic> _items = [
    {
      "title": "Item 1",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Item 2",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Item 3",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Item 4",
      "image": "https://via.placeholder.com/150"
    }
  ];


  List<OrdinalSales> parseSalesData(List<Map<String, dynamic>> jsonData) {
    return jsonData.map((item) {
      return OrdinalSales(
        item['title'] as String,
        double.parse(item['x-axis']),
        double.parse(item['y-axis']),
        // Assuming a constant or calculated value for sales3
        double.parse(item['x-axis']) * 1.5, // Example calculation for sales3
      );
    }).toList();
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
  final List<Map<String, dynamic>> jsonData = [
    {
      "title": "Sun",
      "x-axis": "10",
      "y-axis": "20",
      "z-axis": "30"  // New value for the third line
    },
    {
      "title": "Mon",
      "x-axis": "30",
      "y-axis": "40",
      "z-axis": "50"  // New value for the third line
    },
    {
      "title": "Tue",
      "x-axis": "50",
      "y-axis": "60",
      "z-axis": "70"  // New value for the third line
    },
    {
      "title": "Wed",
      "x-axis": "60",
      "y-axis": "70",
      "z-axis": "80"  // New value for the third line
    },
    {
      "title": "Thu",
      "x-axis": "40",
      "y-axis": "50",
      "z-axis": "60"  // New value for the third line
    },
    {
      "title": "Fri",
      "x-axis": "70",
      "y-axis": "80",
      "z-axis": "90"  // New value for the third line
    },
    {
      "title": "Sat",
      "x-axis": "70",
      "y-axis": "80",
      "z-axis": "100"  // New value for the third line
    },

  ];
  final AttendanceService _attendanceService = AttendanceService();

  String buttonText = 'Mark as Attendance';
  String buttonTextLogout = 'Attendance Logout';

  Future<void> _updateButtonText(String buttonType) async {
    try {
      // Fetch current date and time
      final now = DateTime.now();
      final dateFormat = DateFormat('dd-MM-yyyy'); // Date format
      final timeFormat = DateFormat('HH:mm'); // Time format

      final formattedDate = dateFormat.format(now);
      final formattedTime = timeFormat.format(now);

      // Fetch current location
      bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }

      geo.LocationPermission permission = await geo.Geolocator.checkPermission();
      if (permission == geo.LocationPermission.denied) {
        permission = await geo.Geolocator.requestPermission();
        if (permission != geo.LocationPermission.whileInUse && permission != geo.LocationPermission.always) {
          throw Exception("Location permissions are denied.");
        }
      }

      geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high,
      );

      // Get human-readable address
      final placemarks = await geoCoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;
      final address = '${placemark.locality ?? ''}, ${placemark.subLocality ?? ''}'; // Customize as needed

      // Update button text based on buttonType
      setState(() {
        if (buttonType == 'attendance') {
          buttonText = '$formattedDate , $formattedTime , $address';
        } else if (buttonType == 'logout') {
          buttonTextLogout = '$formattedDate , $formattedTime , $address';
        }
      });
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Create a list of OrdinalSales data from JSON
    final List<OrdinalSales> salesData = parseSalesData(jsonData);

    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    print('displayType>> $displayType');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(29),
              bottomRight: Radius.circular(26),
            ),
          ),
          backgroundColor: AppColors.primaryColour,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text(
                      "Dashboard",
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
                _scaffoldKey.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Mehnaj Khan", style: FTextStyle.nameProfile),
                accountEmail: Text("mehnaj@example.com", style: FTextStyle.emailProfile),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColour,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 52,
                  child: ElevatedButton.icon(
                    onPressed: () => _updateButtonText('attendance'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor: AppColors.primaryColour,
                    ),
                    icon: Icon(Icons.lock_clock, color: Colors.white), // Icon for attendance
                    label: Text(
                      buttonText,
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 52,
                  child: ElevatedButton.icon(
                    onPressed: () => _updateButtonText('logout'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor: AppColors.primaryColour,
                    ),
                    icon: Icon(Icons.lock_clock_outlined, color: Colors.white), // Icon for logout
                    label: Text(
                      buttonTextLogout,
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
              ),
              ...buildDrawerItems(),



            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0,top: 20),
              child: Row(
                children: [
                  Text("Hello !  ", style: FTextStyle.HeadingTxtStyle),
                  Text("Mehnaj Khan", style: FTextStyle.SeeAllTextStyle),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28.0,bottom: 10,top: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 15.0, // Spacing between columns
                    mainAxisSpacing: 15.0, // Spacing between rows
                  ),
                  itemCount: _items.length, // Number of items
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            item['image'], // Image URL from JSON
                            width: 100, // Width of the image
                            height: 100, // Height of the image
                            fit: BoxFit.cover, // Fit the image inside the container
                          ),
                          SizedBox(height: 8.0), // Space between image and text
                          Text(
                            item['title'], // Title from JSON
                            style: TextStyle(
                              fontSize: 16.0, // Font size
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              height: screenHeight * 0.35,
              child: ColumnChart(salesData: salesData),
            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),

          ],
        ),
      ),
    );
  }

  List<Widget> buildDrawerItems() {
    List<Widget> widgets = [];

    for (int index = 0; index < menuItems.length; index++) {
      var item = menuItems[index];
      if (item.containsKey('children')) {
        widgets.add(
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                child: ExpansionTile(
                  backgroundColor: Colors.transparent,
                  leading: Icon(item['icon']),
                  title: Text(item['title'], style: FTextStyle.FaqsTxtStyle),
                  initiallyExpanded: _expandedIndex == index,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _expandedIndex = expanded ? index : null;
                    });
                  },
                  children: buildSubMenuItems(item['children']),
                ),
              ),
            ],
          ),
        );
      } else {
        widgets.add(
          Column(
            children: [
              ListTile(
                leading: Icon(item['icon']),
                title: Text(item['title'], style: FTextStyle.FaqsTxtStyle),
                onTap: () {
                  handleMenuItemTap(item);
                },
              ),
              if (index != menuItems.length - 1)
                Divider(thickness: 1.8, height: 2),
            ],
          ),
        );
      }
    }

    return widgets;
  }

  List<Widget> buildSubMenuItems(List<Map<String, dynamic>> subItems) {
    List<Widget> widgets = [];

    for (var item in subItems) {
      widgets.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: Colors.grey[100],
                child: ListTile(
                  trailing: const Icon(
                    Icons.navigate_next_outlined,
                    size: 28,
                    color: Colors.black,
                  ),
                  leading: Icon(item['icon']),
                  title: Text(item['subtitle'], style: FTextStyle.Faqssubtitle),
                  onTap: () {
                    handleSubMenuTap(item);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return widgets;
  }

  void handleMenuItemTap(Map<String, dynamic> menuItem) {
    Navigator.pop(context); // Close the drawer after selection

    // Handle regular menu item tap
    switch (menuItem['title']) {
      case 'Dashboard':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DashboardScreen()),
        );
      // Handle Dashboard tap
        break;
      case 'Logout':
        _showDeleteDialog();
      // Handle Logout tap
        break;
      default:
      // Handle other regular menu items
        break;
    }
  }

  void handleSubMenuTap(Map<String, dynamic> subMenuItem) {
    Navigator.pop(context); // Close the drawer after selection

    // Navigate based on the submenu item tapped
    switch (subMenuItem['subtitle']) {
      case 'Brand':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Brand()),
        );
        break;
      case 'Product':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductScreen()),
        );
        break;
      case 'Product Category':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductCategoryScreen()),
        );
        break;
      case 'Combo Product':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ComboProductScreen()),
        );
        break;
      case 'Service':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServiceScreen()),
        );
        break;

      case 'Customers & Dealers':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomersDealersScreen()),
        );
        break;
      case 'Add Product Quotation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  CreateQuotationScreen()),
        );
        break;
        case 'Quotation List':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuotationList()),
        );
        break;
        case 'Add Product Combo':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateCombo()),
        );
        break;
      case 'Services':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServicesScreen()),
        );
        break;
      case 'Existing Product':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExistingProductScreen()),
        );
        break;
        case 'Profile Details':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  EmployeeDetails()),
        );
        break;
        case 'All Leaves':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AllLeaves()),
        );
        break;
      default:
      // Handle unknown submenu item
        break;
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Are you sure you want to logout?", style: FTextStyle.preHeadingStyle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.FormFieldBackColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("OK", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class ColumnChart extends StatelessWidget
{
  final List<OrdinalSales> salesData;

  ColumnChart({required this.salesData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelStyle: FTextStyle.smallTextBlack,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: FTextStyle.smallY,
        interval: 10,
      ),
      series: <CartesianSeries<OrdinalSales, String>>[
        ColumnSeries<OrdinalSales, String>(
          dataSource: salesData,
          xValueMapper: (OrdinalSales sales, _) => sales.month,
          yValueMapper: (OrdinalSales sales, _) => sales.sales1,
          color: AppColors.appBlue,
          width: 0.9, // Customize width for this series
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
            textStyle: TextStyle(
              color: AppColors.appBlue, // Customize text color for data labels
            ),
          ),
        ),
        ColumnSeries<OrdinalSales, String>(
          dataSource: salesData,
          xValueMapper: (OrdinalSales sales, _) => sales.month,
          yValueMapper: (OrdinalSales sales, _) => sales.sales2,
          color: AppColors.primaryPinkColor,
          width: 0.9, // Customize width for this series
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
            textStyle: TextStyle(
              color: AppColors.primaryPinkColor, // Customize text color for data labels
            ),
          ),
        ),
        ColumnSeries<OrdinalSales, String>(
          dataSource: salesData,
          xValueMapper: (OrdinalSales sales, _) => sales.month,
          yValueMapper: (OrdinalSales sales, _) => sales.sales3,
          color: Colors.amberAccent, // Choose a new color for the third line
          width: 0.9, // Customize width for this series
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
            textStyle: TextStyle(
              color:Colors.amberAccent, // Customize text color for data labels
            ),
          ),
        ),
      ],
    );
  }
}



class OrdinalSales {
  final String month;
  final double sales1;
  final double sales2;
  final double sales3; // New sales value

  OrdinalSales(this.month, this.sales1, this.sales2, this.sales3);
}





