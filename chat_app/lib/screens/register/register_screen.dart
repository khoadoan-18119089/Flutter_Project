import 'package:chat_app/common/reg_exp.dart';
import 'package:chat_app/components/button_icon_circle.dart';
import 'package:chat_app/components/message_icon.dart';
import 'package:chat_app/components/tbt_button.dart';
import 'package:chat_app/components/tbt_text_form_field.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wowit/widgets/wow_icon.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());

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
            screen: '$RegisterScreen',
            onTap: (controller) async {
              await MyApp.imagePicker(ImageSource.gallery);
              controller.pickImage(
                controller.data,
                screen: '$RegisterScreen',
              );
            },
          ),
          const SizedBox(height: 54),
          TBTTextFormField(
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
          TBTTextFormField(
            icon: const WowIcon(Icons.person),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            labelText: 'Họ và tên',
            validator: (name) =>
                name == null || name.isEmpty ? 'Vui lòng nhập họ và tên' : null,
            onChanged: (value) => controller.name = value,
          ),
          const SizedBox(height: 16),
          TBTTextFormField(
            maxLength: 4,
            allow: allowNumber,
            keyboardType: TextInputType.number,
            icon: const WowIcon(Icons.calendar_month),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            labelText: 'Ngày sinh',
            validator: (birth) => birth == null || birth.isEmpty
                ? 'Vui lòng nhập ngày sinh'
                : birth.length < 4
                    ? 'Vui lòng nhập đúng ngày sinh'
                    : null,
            onChanged: (value) => controller.birth = value,
          ),
          const SizedBox(height: 16),
          GetBuilder<RegisterController>(builder: (_) {
            return TBTTextFormField(
              obscureText: controller.showPass,
              icon: const WowIcon(Icons.password),
              allow: allowNumber,
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
            onPressed: () => controller.register(),
          ),
        ),
      ],
    );
  }
}
