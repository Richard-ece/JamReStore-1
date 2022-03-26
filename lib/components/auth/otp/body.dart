import 'package:flutter/material.dart';
import 'package:jam_re_store/components/auth/otp/otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height, 0.05),
              Text(
                "OTP Verification",
              ),
              Text("We sent your code to your Number"),

              OtpForm(),
              SizedBox(height: 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
