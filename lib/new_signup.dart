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
  String dropdownValue = 'M';
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
                child: Image.network(
                  'https://icon2.cleanpng.com/20180424/ufe/kisspng-carpool-carsharing-real-time-ridesharing-transport-advanced-car-5adf228e66d652.5939487915245728144212.jpg',
                  //'https://cdn.dribbble.com/users/992933/screenshots/4608688/media/f046153ea09fd6e833184c5cd209aee9.gif',
                  //'https://images.pexels.com/photos/11851449/pexels-photo-11851449.jpeg',
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
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 1, 43, 38),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
              // SizedBox(height: 16.0),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(3, 10, 30, 10),
              //   child: Row(children: [
              //     const Text(
              //       'Gender',
              //       style: TextStyle(
              //         color:Color.fromARGB(255, 1, 43, 38), // Will work,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     Container(
              //         child: DropdownButton<String>(
              //       value: dropdownValue,
              //       items: <String>['M', 'F']
              //           .map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(
              //             value,
              //             style: const TextStyle(fontSize: 15),
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
                  height: 90,
                  width: 300,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                const Color(0xFF05998c), // Background color
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () async {
                            //           // SignUpFOrm form = SignUpFOrm(
                            //           //     fname: fnameController.text,
                            //           //     lname: lnameController.text,
                            //           //     password: passwordController.text,
                            //           //     phone: phoneController.text,
                            //           //     cnic: cnicController.text,
                            //           //     email: emailController.text,
                            //           //     gender: dropdownValue.toString());
                            //           // try {
                            //           //   final jsonData = jsonEncode(
                            //           //       form.toJson()); //converts the data to json format
                            //           //   final response = await http.post(
                            //           //     //192.168.100.35
                            //           //     Uri.parse('http://192.168.100.35:4000/member/SignUp'),
                            //           //     headers: {'Content-Type': 'application/json'},
                            //           //     body: jsonData,
                            //           //   );
                            //           //   print(response.statusCode);
                            //           //   if (response.statusCode == 201) {
                            //           //     // Item added successfully
                            //           //     final responseBody = json.decode(response.body);
                            //           //     // Gets the JWT token from the response body
                            //           //     final token = responseBody['token'];
                            //           //     print('Token from API response body:{$token}');

                            //           //     //Saves the JWT token in SharedPreferences
                            //           //     SharedPreferences prefs =
                            //           //         await SharedPreferences.getInstance();
                            //           //     prefs.setString('jwt_token', token);
                            //           //     print(json.decode(response.body));

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Select_Role(),
                              ),
                            );
                            //   }
                            // } catch (error) {
                            //   print(error);
                            // }
                          }),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 255, 255, 255), // Will work,
                                  fontSize: 10,
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
        ),
      ],
    ));
  }
}
