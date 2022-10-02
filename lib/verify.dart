import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gih/form_screen.dart';
import 'package:gih/phone.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  String policstationid;
  String policestationame;
  String subdivisionid;
  String districtid;
  String mobile;
  String name;
   MyVerify({Key? key,required this.policestationame,required this.policstationid,required this.districtid,required this.subdivisionid,required this.name,required this.mobile}) : super(key: key);






  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code ="";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gplogo.png',
                width: 150,
                height: 150,
              ),

              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                onChanged:(value){
                  code=value;
                },

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{

                      setState(() {
                        isLoading = true;
                      });

                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);
                        await auth.signInWithCredential(credential);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  FormScreen(
                          policestationame: widget.policestationame,
                          policstationid:widget.policstationid ,
                          subdivisionid: widget.subdivisionid,
                          districtid:widget.districtid ,
                          mobile: widget.mobile,
                          name: widget.name,
                        )),);
                      }catch(e){
                        print(e);
                        setState((){
                          isLoading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Wrong OTP please enter valid OTP"),
                        ));

                      }

                    },
                    child: isLoading?CircularProgressIndicator(color: Colors.white,):Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}