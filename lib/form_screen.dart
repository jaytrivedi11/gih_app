import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gih/finish_screen.dart';
import 'package:gih/networks/ApiService.dart';

class FormScreen extends StatefulWidget {
  String policstationid;
  String policestationame;
  String subdivisionid;
  String districtid;
  String name;
  String mobile;
  FormScreen(
      {Key? key,
      required this.policestationame,
      required this.policstationid,
      required this.districtid,
      required this.subdivisionid,
      required this.name,
      required this.mobile})
      : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

enum FirstQuestion { a, b, c }

enum SecondQuestion { a, b, c, d, e }

class _FormScreenState extends State<FormScreen> {
  FirstQuestion _character = FirstQuestion.a;
  SecondQuestion _secondQuestion = SecondQuestion.a;
  final _formKey = GlobalKey<FormState>();
  var firstQuestion = "";
  var secondQuetion = "";
  var feedback = "";
  var rating = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Feedback Form",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "1.  How did you come to the police station?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text(
                        'a. Through a person known to a police officer'),
                    leading: Radio<FirstQuestion>(
                      value: FirstQuestion.a,
                      groupValue: _character,
                      onChanged: (FirstQuestion? value) {
                        setState(() {
                          _character = value!;
                          print(_character);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('b. With a neighbour/ local leader'),
                    leading: Radio<FirstQuestion>(
                      value: FirstQuestion.b,
                      groupValue: _character,
                      onChanged: (FirstQuestion? value) {
                        setState(() {
                          _character = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('c. On your own'),
                    leading: Radio<FirstQuestion>(
                      value: FirstQuestion.c,
                      groupValue: _character,
                      onChanged: (FirstQuestion? value) {
                        setState(() {
                          _character = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "2. After how much time you were heard in PS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('a. More than 15 minutes'),
                    leading: Radio<SecondQuestion>(
                      value: SecondQuestion.a,
                      groupValue: _secondQuestion,
                      onChanged: (SecondQuestion? value) {
                        setState(() {
                          _secondQuestion = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('b. 15 minutes'),
                    leading: Radio<SecondQuestion>(
                      value: SecondQuestion.b,
                      groupValue: _secondQuestion,
                      onChanged: (SecondQuestion? value) {
                        setState(() {
                          _secondQuestion = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('c. 10 minutes'),
                    leading: Radio<SecondQuestion>(
                      value: SecondQuestion.c,
                      groupValue: _secondQuestion,
                      onChanged: (SecondQuestion? value) {
                        setState(() {
                          _secondQuestion = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('d. 5 minutes'),
                    leading: Radio<SecondQuestion>(
                      value: SecondQuestion.d,
                      groupValue: _secondQuestion,
                      onChanged: (SecondQuestion? value) {
                        setState(() {
                          _secondQuestion = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    title: const Text('e. Immediately'),
                    leading: Radio<SecondQuestion>(
                      value: SecondQuestion.e,
                      groupValue: _secondQuestion,
                      onChanged: (SecondQuestion? value) {
                        setState(() {
                          _secondQuestion = value!;
                          print(_secondQuestion);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "3. How would you describe your experience with police officers in the police station?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          onChanged: (value) {
                            feedback = value;
                          },
                          maxLines: 10,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Describe your overall experience",
                          ),
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Feedback should be atleast 10 characters long";
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "4.Rate Police station visit based on your overall experience",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  glowColor: Colors.amber,
                  onRatingUpdate: (rating) {
                    rating = rating;
                  },
                ),
              ),
              const SizedBox(
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Center(
                              child: Container(
                                height: 80,
                                width: 80,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                              ),
                            );
                          },
                        );
                        var result = await ApiService().sendFeedback(
                            widget.name,
                            widget.mobile,
                            _character,
                            _secondQuestion,
                            feedback,
                            3,
                            widget.policstationid,
                            widget.subdivisionid,
                            widget.districtid);

                        if (result) {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FinishScreen()),
                          );
                        } else {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Failed please try again"),
                          ));
                        }
                      }
                    },
                    child: const Text("Submit")),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
