import 'package:flutter/material.dart';
import 'package:cet_pay/shared/expansionPanel.dart';
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
        iconTheme: IconThemeData(color: Colors.black,),
        backgroundColor: Colors.transparent,
        title: Text('Transaction History',style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc('mm6Z5bWY9RQlpgJSb0VPFcAmtal1').collection('fees').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.green));
            }
        print(snapshot.data.docs);
        return ListView(
          children: snapshot.data.docs.map((document) {
            return Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(document['amount']),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          document['paid_status'] == true ?
                              Text('Paid',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 18)) :
                          Text('Not Paid',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }
    ),
  );
  }
}
