import 'package:authentication/Authentication/Google_Auth/Homepage.dart';
import 'package:authentication/Authentication/Phone_auth/OTP.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phonelogin extends StatefulWidget {
  const phonelogin({super.key});

  @override
  State<phonelogin> createState() => _phoneloginState();
}

class _phoneloginState extends State<phonelogin> {
  final formkey = GlobalKey<FormState>(); // for validations

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'US', // default country code
                      onChanged: (phone) {
                        print(phone.completeNumber); // prints the full phone number with country code
                      },
                      validator: (value) {
                        if (value == null || value.number.isEmpty) {
                          return "Please enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Otppage();
                        }));
                      }
                    },
                    child: InkWell(
                      onTap:  () {
                        Navigator.push(context,  MaterialPageRoute(builder:  (context) {
                          return Otppage();
                        },));
                      },
                      child: Text(
                        "Login through OTP",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
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
}
