
import 'package:flutter/material.dart';
import 'package:listview/ViewDetailsScreen.dart';


class UserDetails
{
  String? email;
  String? password;

  UserDetails({this.email,this.password});
}
class Details extends StatefulWidget {
  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validator()
  {
    UserDetails user = new UserDetails(
      email: emailController.text,
      password: passwordController.text,
    );
    if (_formKey.currentState!.validate()) {
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(user: user)));
  }
  }
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //email 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Username'
                    ),
                    controller: emailController,
                    validator: (value) {
                      final v = value ?? "";
                      if (v.isEmpty) {//value!.isEmpty
                        return "Please Enter Email";
                      } else if (!isValidEmail(v)) {
                        return "Please Enter Valid Email Address";
                      }
                      return null;
                    }),
              ),


              //password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(_isPasswordVisible == true
                          ? Icons.visibility
                          : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'password'
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else if (!isValidPassword(value)) {
                        return "Please Enter Valid Password";
                      }
                      return null;
                    }),
              ),
              TextButton(
                  onPressed: () {
                    validator();  
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
  }

  
}
