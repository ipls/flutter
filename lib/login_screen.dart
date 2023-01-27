import 'package:belajar_no1/basic_screen.dart';
import 'package:belajar_no1/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const usernameData = "Andre";
const passwordData = "12345";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var username = "";
  var password = "";
  bool isLoginSuccess = false;
  bool isUserHasTriedLogin = false;
  var formKey = GlobalKey<FormState>();


  Future<void> setIsLogin() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", isLoginSuccess);
    var savedValue = prefs.getBool("isLogin");
    print("savedValue $savedValue");
  }

  @override
  Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text("Login Screen"),),
            body: Center(child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text("Silahkan Login"),
                        TextFormField(
                          controller: usernameController,
                          validator: (val){
                            if (val?.isEmpty ?? false){
                              return "Field ini tidak boleh kosong";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            username = usernameController.text;
                            usernameController.text = "";
                          },
                          decoration: const InputDecoration(label: Text("Username")),
                        ),
                        TextFormField(
                          controller: passwordController,
                          // validator: (value){
                          //   if((value?.length ?? 0) < 8) {
                          //     return "Password Tidak Boleh Kurang Dari 8 Karakter";
                          //   }
                          //   return null;
                          // },
                          obscureText: true,
                          onSaved: (val) {
                            password = passwordController.text;
                            passwordController.text = "";
                          },
                          decoration: const InputDecoration(label: Text("Password")),
                        ),
                        const SizedBox(height:32,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Belum Punga Akun? ",),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
                                    ),
                                );
                              },
                              child: Text("Daftar Disini.",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32,),
                        ElevatedButton(onPressed: () async {
                          if ((formKey.currentState?.validate() ?? false)) {
                            formKey.currentState?.save();

                            setState(() {
                              isUserHasTriedLogin = true;
                            });

                            if(username == usernameData && password == passwordData){
                              setState((){
                                isLoginSuccess = true;
                              });
                              await setIsLogin();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BasicScreen(),
                              ),
                              );
                            } else {
                              setState(() {
                                isLoginSuccess = false;
                              });
                            }
                          }
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          // );
                        },
                            child: const Text("Login")),
                        const SizedBox(height: 32,),
                        Visibility(
                            visible: isUserHasTriedLogin && isLoginSuccess,
                            child: const Text("Login Berhasil")),
                        Visibility(
                            visible: isUserHasTriedLogin && !isLoginSuccess,
                            child: const Text("Login Gagal"))
                      ],
                    )),
              ),
            ),),
          ),
        );
      }
  }

