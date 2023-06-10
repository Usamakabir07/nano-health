import 'package:flutter/material.dart';
import 'package:nano_health/view/customWidgets/circular_loading_widget.dart';
import 'package:nano_health/view/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../common/images.dart';
import '../../../util/global_functions.dart';
import '../../../viewModels/auth_view_model.dart';
import '../../customWidgets/custom_text_field.dart';
import '../../customWidgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();

  final TextEditingController userNameCon = TextEditingController();

  final TextEditingController passwordCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: kHeight,
          width: kWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.baseColorLight,
                MyColors.baseColorDark,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: kHeight * 0.40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Image.asset(
                        Images.appIcon,
                        width: 200,
                        height: 200,
                      ),
                      Row(
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: kWidth,
                  height: kHeight * 0.54,
                  color: MyColors.white,
                  child: Form(
                    key: loginFromKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: kWidth * 0.9,
                            child: CustomTextField(
                              controller: userNameCon,
                              hint: 'Enter your email',
                              enableBorder: false,
                              onValid: (userName) {
                                return userName!.isEmpty
                                    ? 'This Field cannot be empty'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: kWidth * 0.9,
                            child: CustomTextField(
                              controller: passwordCon,
                              hint: 'Enter your Password',
                              password: true,
                              enableBorder: false,
                              onValid: (password) {
                                return password!.isEmpty
                                    ? 'This Field cannot be empty'
                                    : null;
                              },
                            ),
                          ),
                          Consumer<AuthViewModel>(
                            builder: (context, authModel, child) {
                              return authModel.isLoading
                                  ? const CircularLoadingWidget()
                                  : RoundedButton(
                                      onPressed: () {
                                        if (loginFromKey.currentState!
                                            .validate()) {
                                          authModel.login(
                                            username: userNameCon.text.trim(),
                                            password: passwordCon.text.trim(),
                                          );
                                        }
                                      },
                                      buttonText: 'Continue',
                                    );
                            },
                          ),
                          Text(
                            'NEED HELP?',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: MyColors.black.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userNameCon.dispose();
    passwordCon.dispose();
    super.dispose();
  }
}
