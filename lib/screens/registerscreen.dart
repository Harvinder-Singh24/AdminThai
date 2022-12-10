import 'package:adminthaimeet/screens/homescreen.dart';
import 'package:adminthaimeet/screens/inAppScreen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _adminIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _adminId = "Thaimeet2022@gmail.com";
  final _adminPassword = "ThaimeetPass123@";
  bool _isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _headText(),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _adminIdController,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Admin Id";
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              prefixIcon:
                              Icon(Icons.person, color: Colors.grey[500]),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Admin Id",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                              filled: true),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isvisible,

                          controller: _passwordController,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isvisible = !_isvisible;
                                });
                              },
                                child: _isvisible ?  Icon(Icons.visibility, color: Colors.grey[500]) :  Icon(Icons.visibility_off,color: Colors.grey[500])),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              prefixIcon:
                              Icon(Icons.email, color: Colors.grey[500]),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                              fillColor: Colors.white,
                              filled: true),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async{
                    SharedPreferences _sharedPrefrences = await SharedPreferences.getInstance();
                    _sharedPrefrences.setBool("isLogin", true);

                    login();
                  },
                  child: Container(
                    width: 349,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Colors.indigo[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text("Login as Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  login() {
    if (_key.currentState!.validate()){
      if (_adminIdController.text == _adminId && _passwordController.text == _adminPassword) {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen(
          email: _adminId,
          password: _adminPassword,
        )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wrong Credentials")));
      }
    }
  }

  Widget _headText() {
    return Container(
        child: Column(
          children: const [
            Text(
              "Sign Up \nThaimeet 2022",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
