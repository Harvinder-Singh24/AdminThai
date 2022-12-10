
import 'package:adminthaimeet/services/auth_service.dart';
import 'package:adminthaimeet/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MainScreen extends StatefulWidget {
  final email;
  final password;
  const MainScreen({Key? key , required this.email ,required this.password}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _startdateController = TextEditingController();
  final _enddateController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _hostController = TextEditingController();
  final _dateController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context,true);
        throw "Back";
        },
      child: Scaffold(
        backgroundColor: Colors.white,
        
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add new Task" , style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(height: 20,),
                  _addData()
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _addData() {
    print(_dateController.text);
    print(_hostController.text);
    print(_descriptionController.text);
    print(_durationController.text);
    print(_startdateController.text);
    print(_enddateController.text);
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _dateController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "Date is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.calendar_month, color: Colors.grey[500]),
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
                hintText: "Date ex: 2dec",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _startdateController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "Start Time is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.calendar_month, color: Colors.grey[500]),
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
                hintText: "Start Time ex: 2:00PM/AM",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _enddateController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "End Time is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.calendar_month, color: Colors.grey[500]),
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
                hintText: "End Time ex: 2:30PM/AM",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _durationController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "duration is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.lock_clock, color: Colors.grey[500]),
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
                hintText: "Duration ex: 90min",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _descriptionController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "Description is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.lock_clock, color: Colors.grey[500]),
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
                hintText: "Description of task",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _hostController,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54),
            validator: (value) {
              if (value!.isEmpty) {
                return "Host is required";
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                prefixIcon:
                Icon(Icons.lock_clock, color: Colors.grey[500]),
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
                hintText: "Hosted by ex: Managment Team",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              _register();
            },
            child: Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.indigo[600],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _register() async{
    print("email ${widget.email}");
    print("password ${widget.password}");
    /*final _authService = AuthService(
        startDate: _startdateController.text,
        endDate: _enddateController.text,
        duration: _durationController.text,
        description: _descriptionController.text,
        host: _hostController.text,
        date: _dateController.text
    );*/
    if (_key.currentState!.validate()) {
      SharedPreferences _sharedPrefrences = await SharedPreferences.getInstance();
      _sharedPrefrences.setString("email", widget.email);
      _sharedPrefrences.setString("password", widget.password);
      print("User Clicked");
      createUser();
      /*_authService.signUp(email: widget.email, password: widget.password);*/
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data added")));
    }
  }

  Future createUser() async{
    final docUser =  FirebaseFirestore.instance.collection('adminData').doc();
    final json ={
      'datetime' : _dateController.text,
      'starttime': _startdateController.text,
    'endDate': _enddateController.text,
    'duration': _durationController.text,
    'description': _descriptionController.text,
    'host': _hostController.text,
    };
    await docUser.set(json);
  }

}
