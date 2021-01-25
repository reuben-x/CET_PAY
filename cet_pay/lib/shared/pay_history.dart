import 'dart:ui';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerErrorFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(int amount, String name,String mail) {
    var options = {
      "key": "rzp_test_85KeJrsIww1tuP",
      "amount": amount *100,
      "currency": "INR",
      "name": "CET Pay",
      "description": "Payment for hostel fees",
      "prefill": {
        "name": name,
        "contact": "918714829999",
        "email": mail
      },
      'external': {
        'wallets': ['paytm']
      },
      "theme": {"hide_topbar": true, "color": "#000000"}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Payment success" + response.paymentId);
    Toast.show("Payment success" + response.paymentId, context,duration: 3);
  }

  void _handlerErrorFailure(PaymentFailureResponse response) {
    print("Payment error"+response.code.toString() + " - " + response.message);
    Toast.show("Payment error"+response.code.toString() + " - " + response.message,context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet"+ response.walletName);
    Toast.show("External Wallet"+ response.walletName,context);
  }

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
              .collection('fees').orderBy('date',descending: true)
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
                Timestamp timeInMillis = document["date"];
                var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis.millisecondsSinceEpoch);
                var formattedDate = DateFormat.yMMMd().format(date);
                return Center(
                  child: ExpansionCard(
                    title:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(formattedDate),
                        Column(
                          children: [
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
                            child: document['paid_status'] == false ? OutlineButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                //eda ivde razorpay lekk direct cheythekkaavo ...
                                openCheckout(2000, 'name','mailId');
                                print(document['date']);
                              },
                              child: Text(
                                'PAY NOW',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ) : Text('Fees has already been paid.',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                            ),)
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
