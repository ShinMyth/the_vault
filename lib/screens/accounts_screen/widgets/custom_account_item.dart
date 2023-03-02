import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/models/account_item_model.dart';
// import 'package:vault/screens/account_credentials_screen/account_credentials_screen_controller.dart';
import 'package:vault/screens/account_credentials_screen/account_credentials_screen_view.dart';
// import 'package:vault/screens/add_account_details_screen/add_account_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';

class CustomAccountItem extends StatefulWidget {
  const CustomAccountItem({
    Key? key,
    required this.accountItem,
    required this.accountsScreenController,
  }) : super(key: key);

  final AccountItem accountItem;
  final HomeScreenController accountsScreenController;

  @override
  State<CustomAccountItem> createState() => _CustomAccountItemState();
}

class _CustomAccountItemState extends State<CustomAccountItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        // MaterialPageRoute(
        //   builder: (context) => AddAccountDetailsScreenView(
        //     accountItem: widget.accountItem,
        //     accountsScreenController: widget.accountsScreenController,
        //   ),
        // ),
        MaterialPageRoute(
          builder: (context) => AccountCredentialsScreenView(
            accountItem: widget.accountItem,
            homeScreenController: widget.accountsScreenController,
            isAddAccount: true,
            isUpdateDeleteAccount: false,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color06,
          border: Border.all(
            color: color04,
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: widget.accountItem.accountItemImage,
            placeholder: (context, url) => SpinKitFadingCircle(
              color: color02,
              size: 22.sp,
              duration: const Duration(milliseconds: 1400),
            ),
            errorWidget: (context, url, error) => Image.asset(imageLogo),
            width: 11.w,
            height: 11.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}