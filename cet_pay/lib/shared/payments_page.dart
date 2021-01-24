import 'dart:ui';
import 'package:cet_pay/shared/pay_history.dart';
import 'package:flutter/material.dart';

class LandingPayments extends StatefulWidget {
  @override
  _LandingPaymentsState createState() => _LandingPaymentsState();
}

class _LandingPaymentsState extends State<LandingPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Services',
            style: TextStyle(color: Colors.green,fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width* 0.05),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentHistory(),
                    ),
                  );
                },
                child: Ink(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hostel.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Ink(
                    width: MediaQuery.of(context).size.width* 0.425,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bus.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.05,
                  ),
                  Ink(
                    width: MediaQuery.of(context).size.width* 0.425,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/others.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
