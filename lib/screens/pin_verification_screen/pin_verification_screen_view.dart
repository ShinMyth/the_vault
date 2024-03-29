import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/pin_verification_screen/pin_verification_screen_controller.dart';
import 'package:vault/widgets/custom_elevated_button.dart';
import 'package:vault/widgets/custom_pin_circle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinVerificationScreenView extends StatefulWidget {
  const PinVerificationScreenView({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreenView> createState() =>
      _PinVerificationScreenViewState();
}

class _PinVerificationScreenViewState extends State<PinVerificationScreenView> {
  late PinVerificationScreenController controller;

  @override
  void initState() {
    controller = PinVerificationScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ENTER PIN",
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomPinCircle(
                    color: controller.pin.isNotEmpty
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.pin.length >= 2
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.pin.length >= 3
                        ? color02
                        : Colors.transparent,
                  ),
                  CustomPinCircle(
                    color: controller.pin.length == 4
                        ? color02
                        : Colors.transparent,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("1"),
                    label: "1",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("2"),
                    label: "2",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("3"),
                    label: "3",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("4"),
                    label: "4",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("5"),
                    label: "5",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("6"),
                    label: "6",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("7"),
                    label: "7",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("8"),
                    label: "8",
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.enterPin("9"),
                    label: "9",
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Stack(
                children: [
                  Align(
                    child: CustomElevatedButton(
                      onPressed: () => controller.enterPin("0"),
                      label: "0",
                    ),
                  ),
                  if (controller.pin.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: ElevatedButton(
                        onPressed: () => controller.removePin(),
                        child: const Icon(
                          Icons.backspace_outlined,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
