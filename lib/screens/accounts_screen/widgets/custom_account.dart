import 'package:vault/models/account_model.dart';
import 'package:vault/screens/accounts_screen/widgets/custom_account_item.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAccount extends StatefulWidget {
  const CustomAccount({
    Key? key,
    required this.account,
    required this.homeScreenController,
  }) : super(key: key);

  final Account account;
  final HomeScreenController homeScreenController;

  @override
  State<CustomAccount> createState() => _CustomAccountState();
}

class _CustomAccountState extends State<CustomAccount> {
  @override
  Widget build(BuildContext context) {
    return widget.account.accountItems.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.account.accountName,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 1.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.w,
                ),
                itemCount: widget.account.accountItems.length,
                itemBuilder: (context, index) {
                  return CustomAccountItem(
                    accountItem: widget.account.accountItems[index],
                    homeScreenController: widget.homeScreenController,
                  );
                },
              ),
              SizedBox(height: 2.h),
            ],
          )
        : Container();
  }
}
