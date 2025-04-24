import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';

class ListBarcPutri extends StatefulWidget {
  const ListBarcPutri({super.key});

  @override
  State<ListBarcPutri> createState() => _ListBarcPutriState();
}

class _ListBarcPutriState extends State<ListBarcPutri> {

Future onRefresh() async {
  Provider.of<Multidatas>(context,listen: false).getLOgDetail;
}


  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      
      appBar: AppBar(title: Text("List Barcode Sawmill"),),
      
      body: Padding(padding: EdgeInsets.all(5),
      child: Column(
        children: [
          //header report
          Row(
            children: [
              Expanded(child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(2),
                child:Text('LOG',style: TextStyle(color: Colors.white),),
              )
              ),

                Expanded(child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(2),
                child:Text('Potong',style: TextStyle(color: Colors.white)),
              )
              ),

                     Expanded(child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(2),
                child:Text('Cur Group',style: TextStyle(color: Colors.white)),
              )
                ),

                Expanded(child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(2),
                child:Text('Papan Date',style: TextStyle(color: Colors.white)),
              )
                )
            ],
          ),
          Container(
            height: 100,
            child: 
          RefreshIndicator( onRefresh: onRefresh,
          child: 

          FutureBuilder(
            
            future: onRefresh(), builder: (context, snapshot) {

              if (snapshot.connectionState==ConnectionState.waiting)
              {
                return CircularProgressIndicator();
              }else
              {
                return  Consumer<Multidatas>(builder: (context, provx, child) {
                  return ListView.builder(
                    itemCount: provx.getgloballogdetail.length,
                    itemBuilder: (context, i) {
                    return ListTile(
                      trailing: Text("test",style: TextStyle(color: Colors.black),),
                    );
                  },);
                },);
              }
            
          },)))
        ],
      ),
      ),
    );
  }
}