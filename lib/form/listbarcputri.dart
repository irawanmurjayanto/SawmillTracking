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
  Provider.of<Multidatas>(context,listen: false).ListBarcPutri(context);
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
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                
                padding: EdgeInsets.all(2),
                child:Text('LOG',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
              )
              ),
               SizedBox(width: 1,), 
                Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Potong',style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,), 
                     Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Cur Group',style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
              )
                ),
                  SizedBox(width: 1,), 
                Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Papan Date',style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
              )
                )
            ],
          ),
          SingleChildScrollView(
            child: 
          Container(
            height: MediaQuery.of(context).size.height/1.22,
            color: Colors.green,
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
                      return Row(
                        children: [
                              Expanded(child: Container(
                 decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                 padding: EdgeInsets.only(top: 8,bottom: 8,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].LOG!+"  ("+provx.getgloballogdetail[i].kode_kayu!+")",style: TextStyle(color: Colors.white,fontSize: 8)),
              )
                ),

                          Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                 padding: EdgeInsets.only(top: 8,bottom: 8,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].HASILPOTONG!,style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
              )
                ),

                          Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.only(top: 8,bottom: 8,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].curskau2!,style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
              )
                ),

                          Expanded(child: Container(
                            
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.only(top: 8,bottom: 8,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].tgl_sawmill!,style: TextStyle(color: Colors.white,fontSize: 7)),
              )
                )

                        ],
                      );
                  },);
                },);
              }
            
          },))))
        ],
      ),
      ),
    );
  }
}