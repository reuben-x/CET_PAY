import 'package:flutter/material.dart';
import 'package:cet_pay/services/auth.dart';
import 'package:cet_pay/shared/loading.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;

  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameInput = TextEditingController();
  final _mailInput = TextEditingController();
  final _admissionNumberInput = TextEditingController();
  final _rollNumberInput = TextEditingController();
  final _yearOfJoinInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final AuthService _auth = AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                  onPressed: () => widget.toggleView()),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sign Up Now',
                          style: TextStyle(
                              fontSize: 45.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _nameInput,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _mailInput,
                        decoration: InputDecoration(
                          labelText: 'CET Mail',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _admissionNumberInput,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Admission Number',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _rollNumberInput,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Roll Number',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _yearOfJoinInput,
                        decoration: InputDecoration(
                          labelText: 'Year Of Join',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Field Required' : null,
                        controller: _passwordInput,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Theme.of(context).accentColor,
                            color: Theme.of(context).primaryColor,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        _mailInput.text,
                                        _passwordInput.text,
                                        _admissionNumberInput.text,
                                        _rollNumberInput.text,
                                        _nameInput.text,
                                        _yearOfJoinInput.text);

                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Center(
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
