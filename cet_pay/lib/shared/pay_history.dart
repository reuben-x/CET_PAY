import 'dart:ui';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Transaction History',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc('mm6Z5bWY9RQlpgJSb0VPFcAmtal1')
              .collection('fees')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              );
            }
            print(snapshot.data.docs);
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: ExpansionCard(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text("Nov 2020"),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                        document['paid_status'] == true
                            ? Text(
                                'Paid',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 18),
                              )
                            : Text(
                                'Not Paid',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 18),
                              ),
                      ],
                    ),
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u{20B9} ${document['amount']}',
                            style: TextStyle(fontSize: 40),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 7,
                            ),
                            child: OutlineButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                //Initiate Payment
                                print(document['date']);
                              },
                              child: Text(
                                'PAY NOW',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
