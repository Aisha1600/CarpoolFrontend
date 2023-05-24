import 'package:carpoolfront/bottom_navbar.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/new_login.dart';
import 'package:carpoolfront/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewSignUp extends StatefulWidget {
  const NewSignUp({Key? key}) : super(key: key);

  @override
  State<NewSignUp> createState() => _NewSignUpState();
}

class _NewSignUpState extends State<NewSignUp> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String dropdownValue = 'Male';

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

  bool _isPasswordmatched(String password, String confirm) {
    if (password == confirm)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/bg.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 90, 30, 10),
              color: Colors.black.withOpacity(0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/logos.gif',
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(height: 40.0),
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
                  const SizedBox(height: 15.0),
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
                        hintText: 'Last Name',
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
                  const SizedBox(height: 15.0),
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
                        hintText: 'Password',
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
                  const SizedBox(height: 15.0),
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
                      controller: confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                  const SizedBox(height: 15.0),
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
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
                  const SizedBox(height: 15.0),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'CNIC',
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
                  const SizedBox(height: 15.0),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                  const SizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                    child: DropdownButtonFormField<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Color.fromARGB(255, 1, 43, 38),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 30.0),
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
                                  content:
                                      Text('Please fill in all the fields.'),
                                ),
                              );
                            } else if (!_isEmailValid(emailController.text)) {
                              // Show an error message or display a Snackbar indicating that the email format is invalid
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please enter a valid email address.'),
                                ),
                              );
                            } else if (!_isPasswordValid(
                                passwordController.text)) {
                              // Show an error message or display a Snackbar indicating that the password is too short
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Password is incorrect.'),
                                ),
                              );
                            } else
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
                          })),
                  const SizedBox(height: 4.0),
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white, // Will work,
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            //API
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewLogIn()),
                            );
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Color(0xFF05998c), // Will work,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ])),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
