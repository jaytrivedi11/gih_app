import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}
enum SingingCharacter { lafayette, jefferson }

class _FormScreenState extends State<FormScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Feedback Form",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1.  How did you come to the police station?",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),

             Column(
               children: [
                 ListTile(
                   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                   title: const Text('Lafayette'),
                   leading: Radio<SingingCharacter>(
                     value: SingingCharacter.lafayette,
                     groupValue: _character,
                     onChanged: (SingingCharacter? value) {
                       setState(() {
                         _character = value;
                       });
                     },
                   ),
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                   title: const Text('Thomas Jefferson'),
                   leading: Radio<SingingCharacter>(
                     value: SingingCharacter.jefferson,
                     groupValue: _character,
                     onChanged: (SingingCharacter? value) {
                       setState(() {
                         _character = value;
                       });
                     },
                   ),
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                   title: const Text('Thomas Jefferson'),
                   leading: Radio<SingingCharacter>(
                     value: SingingCharacter.jefferson,
                     groupValue: _character,
                     onChanged: (SingingCharacter? value) {
                       setState(() {
                         _character = value;
                       });
                     },
                   ),
                 ),

               ],
             ),
              SizedBox(
                height: 10,
              ),
              Text(
                "2. After how much time you were heard in PS",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),

              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 0.0),
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),

                ],
              ),
              Text(
                "3. How would you describe your experience with police officers in the police station?",
                style: TextStyle(
                  fontSize: 16,
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
                Expanded(
                    child: TextField(
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
              SizedBox(height: 10,),
              Text(
                "4.Rate Police station visit based on your overall experience",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(
                height: 10,
              ),

          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
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
                    onPressed: () {
                      Navigator.pushNamed(context, 'finish');
                    },
                    child: Text("Submit")),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}