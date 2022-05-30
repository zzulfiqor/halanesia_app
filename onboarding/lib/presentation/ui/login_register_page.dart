import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class LoginRegisterPage extends GetView<OnBoardingController> {
  LoginRegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController fullNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();
  final TextEditingController rePasswordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: controller.isWaiting.value
                          ? waitingView()
                          : controller.formType.value == FormType.login
                              ? loginForm(context)
                              : registerForm(),
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

  Form loginForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 63),
        SizedBox(
            height: 97,
            width: 97,
            child: Image.asset('assets/images/logo.png')),
        const SizedBox(height: 28),
        Text("Masuk untuk melanjutkan",
            style: info1.copyWith(color: lightGrey)),
        const SizedBox(height: 30),
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Email masih kosong'
                : null;
          },
          decoration:
              inputDecorationOnboard('Alamat E-mail', Icons.person_outline),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: true,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Password belum diisi'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecorationOnboard('Password', Icons.lock_outline),
        ),
        const SizedBox(height: 24),
        controller.loading.value
            ? ButtonSolidBlue(
                text: 'Masuk',
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    controller.loading.value = false;
                    await controller.loginUser(
                        emailCtr.text.trim(), passwordCtr.text.trim(), context);
                    controller.loading.value = true;
                  }
                })
            : const Center(
                child: SpinKitFadingCircle(
                color: lightBlue,
                size: 46.0,
              )),
        const SizedBox(height: 24),
        Text("ATAU", style: info1.copyWith(color: lightGrey)),
        const SizedBox(height: 16),
        ButtonSocialMedia(
            text: 'Login with Google',
            icon: 'assets/images/google.png',
            onPressed: () {}),
        const SizedBox(height: 8),
        ButtonSocialMedia(
            text: 'Login with facebook',
            icon: 'assets/images/facebook.png',
            onPressed: () {}),
        const SizedBox(height: 16),
        Text('Lupa Password?', style: textButtonBlue),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum punya akun?', style: textSmallPreview),
            TextButton(
              onPressed: () {
                controller.changeFormType();
              },
              child: Text('Daftar', style: textButtonBlue),
            ),
          ],
        ),
        const SizedBox(height: 111),
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 32),
        Text('Let’s Get Started', style: header),
        const SizedBox(height: 12),
        const Text('Buat akun baru'),
        const SizedBox(height: 30),
        TextFormField(
          controller: fullNameCtr,
          validator: (value) {
            return (value == null || value.isEmpty) ? 'Nama Lengkap' : null;
          },
          decoration:
              inputDecorationOnboard('Nama Lengkap', Icons.person_outline),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty) ? 'Alamat Email' : null;
          },
          decoration:
              inputDecorationOnboard('Alamat Email', Icons.mail_outline),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password belum diisi';
            } else if (value.length < 6) {
              return 'Password minimal 6 huruf';
            }
            return null;
          },
          controller: passwordCtr,
          decoration: inputDecorationOnboard('Password', Icons.lock_outline),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: true,
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Password tidak sama'
                : null;
          },
          controller: rePasswordCtr,
          decoration:
              inputDecorationOnboard('Ulangi Password', Icons.lock_outline),
        ),
        const SizedBox(height: 24),
        controller.loading.value
            ? ButtonSolidBlue(
                text: 'Daftar',
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    controller.loading.value = false;
                    await controller.registerUser(
                        emailCtr.text, fullNameCtr.text, passwordCtr.text);
                    controller.loading.value = true;
                  }
                },
              )
            : const Center(
                child: SpinKitFadingCircle(
                color: lightBlue,
                size: 46.0,
              )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sudah punya akun?', style: textSmallPreview),
            TextButton(
              onPressed: () {
                controller.changeFormType();
              },
              child: Text('Masuk', style: textButtonBlue),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text("ATAU", style: info1.copyWith(color: lightGrey)),
        const SizedBox(height: 16),
        ButtonSocialMedia(
            text: 'Login with Google',
            icon: 'assets/images/google.png',
            onPressed: () {}),
        const SizedBox(height: 8),
        ButtonSocialMedia(
            text: 'Login with facebook',
            icon: 'assets/images/facebook.png',
            onPressed: () {}),
        const SizedBox(height: 142),
      ]),
    );
  }
}

InputDecoration inputDecorationOnboard(
  String labelText,
  IconData iconData, {
  String? prefix,
  String? helperText,
}) {
  FocusNode myFocusNode = FocusNode();
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: myFocusNode.hasFocus ? lightBlue : lightGrey),
    fillColor: white,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 24,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: lightGrey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: lightBlue)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black)),
  );
}

Column waitingView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: SizedBox(
              height: 151,
              width: 164,
              child: Image.asset('assets/images/logo.png'))),
    ],
  );
}

enum FormType { login, register }
