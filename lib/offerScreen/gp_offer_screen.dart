import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Provider/provider.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/Widget/offerbutton.dart';


class GPOfferScreen extends StatefulWidget {
  @override
  _GPOfferScreenState createState() => _GPOfferScreenState();
}

class _GPOfferScreenState extends State<GPOfferScreen> {
  List<DataModel> gpOfferList = [];

  @override
  Widget build(BuildContext context) {


    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getgpOfferLis();
    gpOfferList = provider.throwgpOfferLis;

    return Scaffold(
      backgroundColor: boxColor,
      body:FutureBuilder(
        builder: ( _ ,snapshot){
      switch (snapshot.connectionState) {
        case ConnectionState.waiting: return Text('Loading....');
        default:
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          else return ListView.builder(
          itemCount: gpOfferList.length,
          itemBuilder: (context, index) {
            return buttonoffer(
              name: gpOfferList[index].name,
              number: gpOfferList[index].number,
              color: Colors.blue,
              context: context,
            );
          });
      }
         },
      )
    );
  }
}
// switch(snapshot.connectionState)
// {
// case ConnectionState.waiting:return Text("loading......");
// default:
// if(snapshot.hasError)
// {
// re
// }
// }
// }

// return ListView.builder(
//           itemCount: gpOfferList.length,
//           itemBuilder: (context, index) {
//             return buttonoffer(
//               name: gpOfferList[index].name,
//               number: gpOfferList[index].number,
//               color: Colors.blue,
//               context: context,
//             );
//           });
