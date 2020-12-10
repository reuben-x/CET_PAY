import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:cet_pay/shared/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LandingHome extends StatefulWidget {
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
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

  void openCheckout(String name,String mail) {
    var options = {
      "key": "rzp_test_85KeJrsIww1tuP",
      "amount": 2000 *100,
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
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('mailId', isEqualTo: emailId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 10, 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      title: Text(
                        'Hello!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      subtitle: Text(
                        snapshot.data.documents[0]['name'],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 165,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Hostel Fees - November 2020',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 0,
                          indent: 110,
                          endIndent: 110,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '\u{20B9} 2000',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: const Text('NOTIFY ME LATER'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                            const SizedBox(width: 8),
                            FlatButton(
                              child: Text(
                                'PAY NOW',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                openCheckout(snapshot.data.documents[0]['name'],snapshot.data.documents[0]['mailId']);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        });
  }
}
