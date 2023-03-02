import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:vault/constants/app_images.dart';
import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/add_account_details_screen/add_account_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:vault/widgets/custom_text_field.dart';

class AddAccountDetailsScreenView extends StatefulWidget {
  const AddAccountDetailsScreenView({
    Key? key,
    required this.accountItem,
    required this.accountsScreenController,
  }) : super(key: key);

  final AccountItem accountItem;
  final HomeScreenController accountsScreenController;

  @override
  State<AddAccountDetailsScreenView> createState() =>
      _AddAccountDetailsScreenViewState();
}

class _AddAccountDetailsScreenViewState
    extends State<AddAccountDetailsScreenView> {
  late AddAccountDetailsScreenController controller;

  @override
  void initState() {
    controller = AddAccountDetailsScreenController(
      setstate: () => setState(() {}),
      context: context,
      accountsScreenController: widget.accountsScreenController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            "ADD ACCOUNT DETAILS",
            style: TextStyle(
              fontSize: 18.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  controller.insertAccountItem(accountItem: widget.accountItem),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.accountItem.accountItemImage,
                      placeholder: (context, url) => SpinKitFadingCircle(
                        color: color02,
                        size: 22.sp,
                        duration: const Duration(milliseconds: 1400),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(imageLogo),
                      width: 11.w,
                      height: 11.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      widget.accountItem.accountItemName,
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: color03,
              ),
              // TextField(
              //   controller: controller.username,
              //   style: TextStyle(
              //     fontSize: 17.5.sp,
              //   ),
              //   decoration: const InputDecoration(
              //     label: Text("Username"),
              //   ),
              // ),
              CustomTextField(
                controller: controller.username,
                label: const Text("Username"),
              ),
              SizedBox(height: 3.h),
              // TextField(
              //   controller: controller.password,
              //   style: TextStyle(
              //     fontSize: 17.5.sp,
              //   ),
              //   decoration: const InputDecoration(
              //     label: Text("Password"),
              //   ),
              // ),
              CustomTextField(
                controller: controller.password,
                obscureText: controller.isPasswordObscureText,
                label: const Text("Password"),
                suffixIcon: GestureDetector(
                  onTap: () => controller.changeIsPasswordObscureText(),
                  child: controller.isPasswordObscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
