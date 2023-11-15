import 'package:chat_app/common/reg_exp.dart';
import 'package:chat_app/components/button_icon_circle.dart';
import 'package:chat_app/components/message_icon.dart';
import 'package:chat_app/components/tbt_button.dart';
import 'package:chat_app/components/tbt_text_form_field.dart';
import 'package:chat_app/screens/log_in/controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wowit/widgets/wow_icon.dart';

class LogInSccreen extends StatelessWidget {
  LogInSccreen({Key? key, this.email}) : super(key: key);

  final controller = Get.put(LogInController());
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(Get.context!).requestFocus(FocusNode()),
            child: body(),
          ),
          const Positioned(
            top: 40,
            left: 15,
            child: ButtonIconCircle(),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        children: [
          MessageIcon(
            screen: '$LogInSccreen',
          ),
          const SizedBox(height: 80),
          TBTTextFormField(
            text: email,
            keyboardType: TextInputType.emailAddress,
            icon: const WowIcon(Icons.email),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            labelText: 'Email',
            validator: (email) => email == null || email.isEmpty
                ? 'Vui lòng nhập Email'
                : !checkEmail.hasMatch(email)
                    ? 'Vui lòng nhập Đúng email'
                    : null,
            onChanged: (value) => controller.email = value,
          ),
          const SizedBox(height: 16),
          GetBuilder<LogInController>(builder: (_) {
            return TBTTextFormField(
              allow: allowNumber,
              obscureText: controller.showPass,
              icon: const WowIcon(Icons.password),
              keyboardType: TextInputType.number,
              maxLength: 6,
              labelText: 'PassWord',
              validator: (pass) => pass == null || pass.isEmpty
                  ? 'Vui lòng nhập PassWord'
                  : pass.length < 6
                      ? 'Vui lòng nhập đủ PassWord'
                      : null,
              suffixIcon: WowIcon(controller.showPass
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPresshSuffiIcon: () => controller.onClickShowPass(),
              onChanged: (value) => controller.pass = value,
            );
          }),
          const SizedBox(height: 24),
          button(),
        ],
      ),
    );
  }

  Widget button() {
    return Row(
      children: [
        Expanded(
          child: TBTButton.elevated(
            backgroundColor: Colors.lightBlueAccent,
            text: 'Log In',
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(16),
            onPressed: () => controller.logIn(),
          ),
        ),
      ],
    );
  }
}
