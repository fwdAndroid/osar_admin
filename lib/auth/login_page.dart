import 'package:flutter/material.dart';
import 'package:osar_admin/auth/login_data.dart';
import 'package:osar_admin/provider/circular_provider.dart';
import 'package:osar_admin/widgets/colors.dart';
import 'package:osar_admin/widgets/exc_button.dart';
import 'package:osar_admin/widgets/input_text.dart';
import 'package:osar_admin/widgets/styles.dart';
import 'package:osar_admin/widgets/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                _FormSection(),
                _ImageSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FormSection extends StatefulWidget {
  const _FormSection({Key? key}) : super(key: key);

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  // Toggles the password show status
  TextEditingController emailControler = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral,
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            height: 280,
          ),
          // const SizedBox(height: 30),
          // const Text(
          //   "Log in",
          //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.63),
          // ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 9),
          InputText(
            controller: emailControler,
            labelText: "example@gmail.com",
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {},
            onSaved: (val) {},
            textInputAction: TextInputAction.done,
            isPassword: false,
            enabled: true,
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 9),
          TextFormField(
            controller: pass,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              focusedBorder: AppStyles.focusedBorder,
              disabledBorder: AppStyles.focusBorder,
              enabledBorder: AppStyles.focusBorder,
              errorBorder: AppStyles.focusErrorBorder,
              focusedErrorBorder: AppStyles.focusErrorBorder,
              hintText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible = !passwordVisible;
                    },
                  );
                },
              ),
              alignLabelWithHint: false,
              filled: true,
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 40),
          WonsButton(
            height: 50,
            width: 348,
            verticalPadding: 0,
            color: AppColors.primary,
            child: const Text(
              "Log in",
              style: TextStyle(
                  color: AppColors.neutral,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            onPressed: () {
              if (emailControler.text.isEmpty && pass.text.isEmpty) {
                Customdialog()
                    .showInSnackBar("Both Fields are Required", context);
              } else if (emailControler.text.isEmpty) {
                Customdialog()
                    .showInSnackBar("Email Field are Required", context);
              } else if (pass.text.isEmpty) {
                Customdialog()
                    .showInSnackBar("Password Field are Required", context);
              } else if (pass.text.length < 5) {
                Customdialog()
                    .showInSnackBar("Password minimum 5 charaters", context);
              } else if (emailControler.text != 'osar_admin@gmail.com' &&
                  pass.text != '123456') {
                Customdialog()
                    .showInSnackBar("Email and password is wrong", context);
              } else if (emailControler.text == 'osar_admin@gmail.com' &&
                  pass.text == '123456') {
                Customdialog.showDialogBox(context);

                Provider.of<CircularProgressProvider>(context, listen: false)
                    .setValue(true);
                Future.delayed(Duration(seconds: 0)).then((value) {
                  Database().login(emailControler.text, pass.text, context);
                });
              } else if (emailControler.text != 'osar_admin@gmail.com') {
                Customdialog().showInSnackBar("Email is wrong", context);
              } else if (pass != '123456') {
                Customdialog().showInSnackBar("Password is wrong", context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/logo.png",
            height: 600,
          ))
        ],
      ),
    );
  }
}
