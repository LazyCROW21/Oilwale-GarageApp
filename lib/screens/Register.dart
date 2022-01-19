import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_app/service/newGarageRegisterapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:garage_app/service/newGarageRegisterApi.dart';

class RegistrationWidget extends StatefulWidget {
  RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  bool showMssg = false;
  final _formKey = GlobalKey<FormState>();


  void _changed() {
    setState(() async {
      showMssg = true;
    });
  }
  late String garageId;
  @override
  Widget build(BuildContext context) {

    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";
    });

    late String phoneNumber;
    late String address;
    late String fullName;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Your Garage",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    !showMssg
                        ? Container(
                      child: Column(
                        children: [
                          Text(
                            "Terms and Conditions ",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                              "1. You are applying for distributing Oil products provided by M.P lubricants."),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                              "1. You are applying for distributing Oil products provided by M.P lubricants."),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                              "1. You are applying for distributing Oil products provided by M.P lubricants."),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                              "1. You are applying for distributing Oil products provided by M.P lubricants."),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                              "1. You are applying for distributing Oil products provided by M.P lubricants."),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Please Enter Your Details Below",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 15.0),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.dialpad),
                              hintText: 'Mobile Number',
                              labelText: 'Number',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String? value) {
                              phoneNumber = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a Number';
                              } else if (value.length != 10) {
                                return 'Please enter a valid Number ';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Your Name',
                              labelText: 'Name ',
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (String? value) {
                              fullName = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name ';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.location_on),
                              hintText: 'Type in your Address',
                              labelText: 'Address',
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (String? value) {
                              address = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    )
                        : Container(),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
              showMssg
                  ? Center(
                child: Container(
                    child: Column(
                      children: [
                        Text(
                          "Thank you for regsistering .",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        Text(
                          "You will be soon contacted by us .",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ],
                    )),
              )
                  : ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await NewGarageRegisterApiManager.NewGarageAccept(address, fullName, phoneNumber);
                      setState(() {
                        showMssg = true;
                      });
                    }
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
