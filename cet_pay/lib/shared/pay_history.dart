import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();

}

class _PaymentHistoryState extends State<PaymentHistory> {
  
  Widget _buildListPanel(AsyncSnapshot<QuerySnapshot> snapshot) {

    int listFreq = snapshot.data.docs.length;
    return ExpansionPanelList(
      expansionCallback: (int index,bool isExpanded) {
        setState(() {

        });
      },
      children: snapshot.data.docs.map((document) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('December 2020'),
            );
          },
          body: ListTile(
            title: Text(document['amount']),
            subtitle: Text('This was Paid On'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            trailing: FlatButton(
              onPressed: () {
                //GO TO PAYMENTS FOLDER
              },
              child: Text('PAY NOW',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
            ),
          ),
          isExpanded: false,
        );
      }).toList(),
    );
  }

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
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc('mm6Z5bWY9RQlpgJSb0VPFcAmtal1').collection('fees').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
           if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.green));
              }
          return _buildListPanel(snapshot);
          }
      ),
     )
    );
  }
}


