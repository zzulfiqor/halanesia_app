import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controller/otp_register_controller.dart';

class OtpRegisterPage extends GetView<OtpRegisterController> {
  OtpRegisterPage({Key? key}) : super(key: key);

  final TextEditingController otpCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  const SizedBox(height: 142),
                  Text("Masukan Kode Verifikasi", style: title1),
                  const SizedBox(height: 10),
                  Text(
                    "Kode 4 digit dikirim ke email anda",
                    style: bodyText.copyWith(color: darkGrey),
                  ),
                  const SizedBox(height: 88),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: PinCodeTextField(
                        appContext: context,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        length: 4,
                        controller: otpCtr,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 55,
                          fieldWidth: 55,
                          activeFillColor: black,
                        ),
                        onChanged: (value) {}),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // controller.changeFormType();
                        },
                        child: Text('Kirim Ulang Kode', style: textButtonBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: controller.loading.value
                        ? Container()
                        : const Center(
                            child: SpinKitFadingCircle(
                            color: lightBlue,
                            size: 46.0,
                          )),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ],
          )),
      floatingActionButton: Visibility(
        visible: controller.loading.value == true ? true : false,
        child: SizedBox(
          height: 67,
          width: 67,
          child: FloatingActionButton(
            onPressed: () async {
              controller.loading.value = false;
              await Get.put(controller.verifyOtp(Get.arguments, otpCtr.text));
              controller.loading.value = true;
            },
            backgroundColor: lightBlue,
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
