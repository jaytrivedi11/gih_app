import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gih/model/PoliceStationModel.dart';
import 'package:gih/verify.dart';

import 'networks/ApiService.dart';

class MyPhone extends StatefulWidget {
   MyPhone({Key? key,required this.id}) : super(key: key);

  static String verify = "";
  String id;

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var phone ="";
  var name ="";
  bool isLoading = false;
  var stationData;
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService().getPoliceStation(widget.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
          return Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wellcome to ${snapshot.data["policestationName"]}",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
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
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextFormField(
                                onChanged: (value){
                                  name=value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Your full name';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",


                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: countryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(fontSize: 33, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                onChanged: (value){
                                  phone=value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Your number';
                                  }
                                  if (value.length<10 || value.length>10) {
                                    return 'please enter valid number';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your Mobile number",
                                ),
                              ))
                        ],
                      ),
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
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                isLoading = true;
                              });

                              print(phone);
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '${countryController.text + phone}',
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  print("error");
                                  print(e);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Failed please try again"),
                                  ));
                                },
                                timeout: const Duration(seconds: 30),
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  print("verificaton id" + verificationId);
                                  print("otp" + resendToken.toString());
                                  MyPhone.verify = verificationId;
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MyVerify(
                                    policstationid: snapshot.data["policestationID"],
                                    policestationame: snapshot.data["policestationName"],
                                    subdivisionid: snapshot.data["subdivisionID"],
                                    districtid: snapshot.data["districtID"],
                                    mobile:phone,
                                    name: name,
                                  )),);
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {
                                  print("verify" + verificationId);
                                },
                              );
                            }
                            // Navigator.pushNamed(context, 'verify');
                          },
                          child: isLoading?CircularProgressIndicator(color: Colors.white,):Text("Send the code")),
                    )
                  ],
                ),
              ),
            ),
          );} else{
            return Center(child: CircularProgressIndicator());
          }
        },)
    );
  }
}