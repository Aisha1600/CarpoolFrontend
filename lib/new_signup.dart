import 'package:carpoolfront/bottom_navbar.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/new_login.dart';
import 'package:carpoolfront/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewSignUp extends StatefulWidget {
  const NewSignUp({super.key});

  @override
  State<NewSignUp> createState() => _NewSignUpState();
}

class _NewSignUpState extends State<NewSignUp> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String dropdownValue = 'M';

  bool _areFieldsEmpty() {
    return fnameController.text.isEmpty ||
        lnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        cnicController.text.isEmpty ||
        phoneController.text.isEmpty;
  }

  bool _isEmailValid(String email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);

    return regex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    int minLength = 8; // Minimum password length requirement

    return password.length >= minLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            //'https://cdn.dribbble.com/users/992933/screenshots/4608688/media/f046153ea09fd6e833184c5cd209aee9.gif',
            'https://images.pexels.com/photos/11851449/pexels-photo-11851449.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            // repeat: ImageRepeat.repeat,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.white,
            child: Image.asset(
              'assets/bg.jpeg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              // repeat: ImageRepeat.repeat,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              color: Colors.black.withOpacity(0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                    child: Image.asset(
                      'assets/bg.jpeg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      // repeat: ImageRepeat.repeat,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: fnameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: lnameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'Last Name',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: cnicController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'CNIC',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 1, 43, 38),
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Container(
                  //   padding: const EdgeInsets.fromLTRB(3, 10, 30, 10),
                  //   child: Row(children: [
                  //     const Text(
                  //       'Gender',
                  //       style: TextStyle(
                  //         color: Color(0xFF05998c), // Will work,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 20,
                  //     ),
                  //     Container(
                  //         //color: Colors.white,
                  //         child: DropdownButton<String>(
                  //       value: dropdownValue,
                  //       items: <String>['M', 'F']
                  //           .map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(
                  //             value,
                  //             style: const TextStyle(
                  //                 fontSize: 15, color: Colors.white),
                  //           ),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           dropdownValue = newValue!;
                  //         });
                  //       },
                  //     )),
                  //   ]),
                  // ),
                  Container(
                      height: 48,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_areFieldsEmpty()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill in all the fields.'),
                              ),
                            );
                          } else if (!_isEmailValid(emailController.text)) {
                            // Show an error message or display a Snackbar indicating that the email format is invalid
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please enter a valid email address.'),
                              ),
                            );
                          } else if (!_isPasswordValid(
                              passwordController.text)) {
                            // Show an error message or display a Snackbar indicating that the password is too short
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Password should be at least 8 characters long.'),
                              ),
                            );
                          } else {
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // String token = prefs.getString('jwt_token') ?? '';
                            // print('Stored jwt token from storage is {$token}');
                            // // //API INTEGRATION
                            // LicenseForm form = LicenseForm(
                            //   license_no: int.parse(LicensenoController.text.toString()),
                            //   license_valid_from: _selectedDate.toIso8601String(),
                            // );
                            // try {
                            //   final jsonData = jsonEncode(form.toJson());
                            //   print(jsonData);
                            //   print(json.decode(jsonData));
                            //   final response = await http.put(
                            //     //URL LOCAL HOST NEEDS TO BE CHANGED
                            //     Uri.parse(
                            //         'http://192.168.100.35:4000/member/InsertLicense'),
                            //     headers: {
                            //       'Content-Type': 'application/json',
                            //       'authorization': token
                            //     },
                            //     body: jsonData,
                            //   );
                            //   print(response.statusCode);
                            //   if (response.statusCode == 200) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavbar()),
                            );
                            //     print(json.decode(response.body));
                            //   }
                            // } catch (error) {
                            //   print(error);
                            // }
                          }
                        },
                      )),
                  const SizedBox(height: 6.0),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 255, 255, 255), // Will work,
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              //API
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewLogIn()),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Color(0xFF05998c), // Will work,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
