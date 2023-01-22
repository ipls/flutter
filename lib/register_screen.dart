import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var nama = "";
  var username = "";
  var email = "";
  var password = "";
  var address = "";
  var phoneNumber = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Screen"),),
      body: Center(child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Silahkan Registrasi Dahulu"),
                  TextFormField(
                    controller: nameController,
                    validator: (value){
                      if((value?.length ?? 0) > 5) {
                        return "Nama Tidak Boleh Lebih Dari 5 Karakter";
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text("Nama Lengkap")),
                  ),
                  TextFormField(
                    controller: usernameController,
                    validator: (val){
                      if (val?.isEmpty ?? false){
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text("Username")),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (val){
                      if (val?.isEmpty ?? false){
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(label: Text("Email")),
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (val){
                      if (val?.isEmpty ?? false){
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(label: Text("Password")),
                  ),
                  TextFormField(
                    controller: addressController,
                    validator: (val){
                      if (val?.isEmpty ?? false){
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text("Address")),
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    validator: (val){
                      if (val?.isEmpty ?? false){
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(label: Text("Phone Number")),
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Etc")),
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Etc")),
                  ),
                  SizedBox(height: 32,),
                  ElevatedButton(onPressed: () {
                    if ((formKey.currentState?.validate() ?? false)) {
                      setState(() {
                        nama = nameController.text;
                        username = usernameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        address = addressController.text;
                        phoneNumber = phoneNumberController.text;
                        nameController.text = "";
                        usernameController.text = "";
                        emailController.text = "";
                        passwordController.text = "";
                        addressController.text = "";
                        phoneNumberController.text = "";
                      });
                    }
                  },
                      child: Text("Register")),
                  SizedBox(height: 32,),
                  Text("Hasil Submit Form"),
                  Text("Name: ${nama}"),
                  Text("UserName: ${username}"),
                  Text("Email: ${email}"),
                  Text("Password: ${password}"),
                  Text("Address: ${address}"),
                  Text("PhoneNumber: ${phoneNumber}"),
                ],
              )),
        ),
      ),),
    );
  }
}
