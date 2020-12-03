import 'dart:math';
import 'dart:ui';
import 'package:cet_pay/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cet_pay/shared/database.dart';
import 'package:provider/provider.dart';

class LandingPayments extends StatefulWidget {
  @override
  _LandingPaymentsState createState() => _LandingPaymentsState();
}

class _LandingPaymentsState extends State<LandingPayments> {
  void _previousTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Text(
            "Previous transactions will show up here !!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 20,
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  'Payments Page',
                  style: TextStyle(fontSize: 28),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: IconButton(
                  icon: Icon(Icons.history),
                  color: Theme.of(context).primaryColor,
                  iconSize: 40,
                  onPressed: () => _previousTransaction(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
