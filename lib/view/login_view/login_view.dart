import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmprac/res/widgets/my_round_button.dart';
import 'package:mvvmprac/utils/utils.dart';
import 'package:mvvmprac/view_model/login_view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // login view model
  final LoginViewModel loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Form(
              key: _formKey,
                child: Column(
              children: [
                TextFormField(
                  controller: loginViewModel.emailController.value,
                  focusNode: loginViewModel.emailFocusNode.value,
                  decoration: InputDecoration(hintText: "Email",border: OutlineInputBorder()),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.snackBar("Email", "Enter Email");
                    }
                  },
                ),
                const SizedBox(height: 12.0,),
                TextFormField(
                  obscureText: false,
                  controller: loginViewModel.passwordController.value,
                  focusNode: loginViewModel.passwordFocusNode.value,
                  decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder()),
                  validator: (value) {
                    if(value!.isEmpty){
                      Utils.snackBar("Password", "Passsword Email");
                    }
                  },
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            MyRoundButton(
              title: "Login",
              btnColor: Colors.teal,
              width: 200,
              height: 50,
              fontWeight: FontWeight.bold,
              titleColor: Colors.white,
              fontSize: 16,
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if(_formKey.currentState!.validate()){

                }
              },
            )
          ],
        ),
      ),
    );
  }
}
