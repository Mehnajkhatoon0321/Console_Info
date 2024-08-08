import 'package:consol_info/utils/colours.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
class AddServiceDetail extends StatefulWidget {
  String screenFlag;
   AddServiceDetail({required this.screenFlag,super.key});

  @override
  State<AddServiceDetail> createState() => _AddServiceDetailsState();
}

class _AddServiceDetailsState extends State<AddServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                    widget.screenFlag.isEmpty ? 'Add Service Details' : 'Edit Service Details',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.start ,
        children: [
          Text("Add Model ")
        ],
      ),
    );
  }
}
