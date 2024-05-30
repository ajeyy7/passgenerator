import 'package:flutter/material.dart';
import 'package:passgenerator/constants/colors.dart';
import 'package:passgenerator/model/services/passgenservices.dart';
import 'package:passgenerator/view/pages/components/buttons.dart';
import 'package:passgenerator/view/pages/components/passcopybox.dart';
import 'package:passgenerator/view/pages/components/passlengthbox.dart';
import 'package:passgenerator/view/pages/components/socialmediabox.dart';
import 'package:passgenerator/view/pages/socialmediapass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noofuppercharcontroller = TextEditingController();
  TextEditingController nooflowercharcontroller = TextEditingController();
  TextEditingController noofspecialcharcontroller = TextEditingController();
  TextEditingController noofnumbercharcontroller = TextEditingController();

  String generatedPass = '';
  final _passGen = PassGen();
  bool inclduppercase = false;
  bool incldlowercase = false;
  bool incldspecialchar = false;
  bool incldnumber = false;
  bool custompass = false;
  int? passLenght;
  void handelcutsomPass(bool value) {
    setState(() {
      custompass = value;
      setState(() {
        if (value) {
          inclduppercase = false;
          incldlowercase = false;
          incldspecialchar = false;
          incldnumber = false;
        }
      });
    });
  }

  void navigateToPasswordGeneration(BuildContext context, String platform) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordGenerationPage(platform: platform),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: navyblue,
        appBar: AppBar(
          backgroundColor: Color(0xFF1C2475),
          title: const Text(
            "KeyForge",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF22308C),
                Color(0xFF1C2475), // Slightly lighter shade of navy blue
                Color(0xFF101D4A), // Navy blue
                Color(0xFF05122D), // Darker shade of navy blue
                Color(0xFF061A40), // Slightly darker shade of navy blue
                // Lighter shade of navy blue
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 25),
              Visibility(
                visible: !custompass,
                child: Passlength(
                  items: const [
                    DropdownMenuItem(
                      value: 8,
                      child: Text('8'),
                    ),
                    DropdownMenuItem(
                      value: 10,
                      child: Text('10'),
                    ),
                    DropdownMenuItem(
                      value: 15,
                      child: Text('15'),
                    ),
                    DropdownMenuItem(
                      value: 20,
                      child: Text('20'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      passLenght = value;
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: inclduppercase,
                                  onChanged: (value) {
                                    setState(() {
                                      inclduppercase = value!;
                                      if (inclduppercase ||
                                          incldlowercase ||
                                          incldnumber ||
                                          incldspecialchar) {
                                        custompass = false;
                                      }
                                    });
                                  }),
                              const Text(
                                "Uppercase (A-Z)",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: incldlowercase,
                                  onChanged: (value) {
                                    setState(() {
                                      incldlowercase = value!;
                                      if (inclduppercase ||
                                          incldlowercase ||
                                          incldnumber ||
                                          incldspecialchar) {
                                        custompass = false;
                                      }
                                    });
                                  }),
                              const Text("Lowercase (a-z)",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: incldnumber,
                                  onChanged: (value) {
                                    setState(() {
                                      incldnumber = value!;
                                      if (inclduppercase ||
                                          incldlowercase ||
                                          incldnumber ||
                                          incldspecialchar) {
                                        custompass = false;
                                      }
                                    });
                                  }),
                              const Text(
                                "Numbers (0-9)",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: incldspecialchar,
                                  onChanged: (value) {
                                    setState(() {
                                      incldspecialchar = value!;
                                      if (inclduppercase ||
                                          incldlowercase ||
                                          incldnumber ||
                                          incldspecialchar) {
                                        custompass = false;
                                      }
                                    });
                                  }),
                              const Text("Special Characters",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: custompass,
                                onChanged: (value) {
                                  handelcutsomPass(value!);
                                }),
                            const Text("Custom Password",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Visibility(
                      visible: custompass,
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade500,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    flex: 4,
                                    child: Text(
                                      "Numbers of Uppercase Characters",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              maxLength: 2,
                                              maxLines: 1,
                                              expands: false,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  noofuppercharcontroller,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  contentPadding:
                                                      const EdgeInsets.all(8),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    flex: 4,
                                    child: Text(
                                      "Numbers of Lowercase Characters",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              maxLength: 2,
                                              maxLines: 1,
                                              expands: false,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  nooflowercharcontroller,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  contentPadding:
                                                      const EdgeInsets.all(8),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    flex: 4,
                                    child: Text(
                                      "Numbers of Special Characters",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              maxLength: 2,
                                              maxLines: 1,
                                              expands: false,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  noofspecialcharcontroller,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  contentPadding:
                                                      const EdgeInsets.all(8),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    flex: 4,
                                    child: Text(
                                      "Numbers of Numbers",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              maxLength: 2,
                                              maxLines: 1,
                                              expands: false,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  noofnumbercharcontroller,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  contentPadding:
                                                      const EdgeInsets.all(8),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///generated password and copy container

                    PassCopy(generatedPass: generatedPass),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              SizedBox(height: 20),

              ///button
              CommonButton(
                  name: "Generate",
                  onPressed: () {
                    setState(() {
                      if (custompass) {
                        generatedPass = _passGen.generateCustomPass(
                          numbercount: int.tryParse(
                                  noofnumbercharcontroller.text.trim()) ??
                              0,
                          uppercount: int.tryParse(
                                  noofuppercharcontroller.text.trim()) ??
                              0,
                          lowercount: int.tryParse(
                                  nooflowercharcontroller.text.trim()) ??
                              0,
                          specialcount: int.tryParse(
                                  noofspecialcharcontroller.text.trim()) ??
                              0,
                        );
                      } else {
                        generatedPass = _passGen.generatePass(
                            length: passLenght!,
                            incldlowecase: incldlowercase,
                            incldnum: incldnumber,
                            incldspecialchar: incldspecialchar,
                            inclduppercase: inclduppercase);
                      }
                    });
                  },
                  backgroundColor: Colors.indigo),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      "Select a social media app to generate a password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SocialMediaBox(
                          onTap: () => navigateToPasswordGeneration(
                              context, 'Instagram'),
                          imageurl: 'assets/images/inst.png',
                        ),
                        SocialMediaBox(
                          onTap: () =>
                              navigateToPasswordGeneration(context, 'Facebook'),
                          imageurl: 'assets/images/fb (2).png',
                        ),
                        SocialMediaBox(
                          onTap: () =>
                              navigateToPasswordGeneration(context, 'LinkedIn'),
                          imageurl: 'assets/images/in.png',
                        ),
                        SocialMediaBox(
                          onTap: () =>
                              navigateToPasswordGeneration(context, 'Snapchat'),
                          imageurl: 'assets/images/snapchat.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
