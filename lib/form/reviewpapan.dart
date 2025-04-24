import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';

class ReviewPapan extends StatefulWidget {
  const ReviewPapan({super.key});

  @override
  State<ReviewPapan> createState() => _ListBarcPutriState();
}

class _ListBarcPutriState extends State<ReviewPapan> {

Future onRefresh() async {
  Provider.of<Multidatas>(context,listen: false).ListBarcPutri(context);
}

Future LihatHasil(String skau,String kodekayu) async{
    await Provider.of<Multidatas>(context,listen:false).ListReviewFuture(skau,context);
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      content: Column(
        children: [
          Text("SKAU : "+skau),
          Row(
            children: [

              Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Barcode',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('NO1',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),    
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('NO2',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('HIT',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),    
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('No. LOG',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),  
                   Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Tgl',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                          
            ],
          ),
 SingleChildScrollView(
  child: 
  Consumer<Multidatas>(builder: (context, provx, child) {
                return ListView.builder(
                  itemCount: provx.getGlobalListReview.length,
                  itemBuilder: (context, i) {
                  return  Row(

                      children: [

                           Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].barcode!.toString(),style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),


                      ],


                  );


                   
                },);
                
              },)) ,    
                  
                
        ],
      ),
      actions: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Close"))
      ],
    );
  },);
}




Future LihatHasil2(String skau,String kodekayu) async{
  await Provider.of<Multidatas>(context,listen:false).ListReviewFuture(skau,context);
  showDialog(context: context, builder: (context) {
    
   return 
     
      
      AlertDialog(
        content: Column(
          children: [
            Text("Group Kayu : "+skau+" ("+kodekayu+")",textAlign: TextAlign.center,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
    Row(
      children: [
  Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('Barcode',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('NO1',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),    
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('NO2',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),
               Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('HIT',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  SizedBox(width: 1,),    
               SizedBox(
                width: 30,
                child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(' LOG',style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center),
              )
              ),
                  
      ]
    ),

  SingleChildScrollView(
    child: 
  Container(
     color: Colors.yellow,
    height: MediaQuery.of(context).size.height/1.45,
   child: 
  Consumer<Multidatas>(builder: (context, provx, child) {
                return ListView.builder(
                  itemCount: provx.getGlobalListReview.length,
                  itemBuilder: (context, i) {
                      return  Row(

                      children: [

                           Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].barcode!.toString(),style: TextStyle(color: Colors.white,fontSize: 6),textAlign: TextAlign.center),
              )
              ),

   Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].nourut!.toString(),style: TextStyle(color: Colors.white,fontSize: 7),textAlign: TextAlign.center),
              )
              ),

                 Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].nourutori!,style: TextStyle(color: Colors.white,fontSize: 7),textAlign: TextAlign.center),
              )
              ),

                Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].hit!,style: TextStyle(color: Colors.white,fontSize: 7),textAlign: TextAlign.center),
              )
              ),

                SizedBox(
                  width: 30,
                  child: Container(
                   decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text(provx.getGlobalListReview[i].NO_Log!.toString(),style: TextStyle(color: Colors.white,fontSize: 7),textAlign: TextAlign.center),
              )
              ),

                

                      ],


                  );
                   
                },);
                
              },))) ,    
                  


          
          ],
        ),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Close'))
        ],
 
   );




  },);
      
   
  

    }


  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      
      appBar: AppBar(title: Text("Review Hasil Papan"),),
      
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
                ),
                  SizedBox(width: 1,), 
                Expanded(child: Container(
                   decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.all(2),
                child:Text('        ',style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
              )
                ),
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
                 padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].LOG!+"  ("+provx.getgloballogdetail[i].kode_kayu!+")",style: TextStyle(color: Colors.white,fontSize: 8)),
              )
                ),

              //             Expanded(child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       border: Border.all(color: Colors.white)
              //   ),
              //    padding: EdgeInsets.only(top: 8,bottom: 8,left: 2,right: 2),
              //   child:Text(provx.getgloballogdetail[i].HASILPOTONG!,style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
              // )
              //   ),

                          Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].curskau2!,style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
              )
                ),

                          Expanded(child: Container(
                            
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                child:Text(provx.getgloballogdetail[i].tgl_sawmill!,style: TextStyle(color: Colors.white,fontSize: 7)),
              )
                ),


                 provx.getgloballogdetail[i].tgl_sawmill=="-"? x():
                 Expanded(child: Container(
                            
                   
                padding: EdgeInsets.only(left: 2,right: 2),
                
                child:
                SizedBox(
                  width: 5,
                  height: 15,
                  child: 
                
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                 fixedSize: Size(5, 5)
                  ),
                  onPressed: ()   {
                   EasyLoading.show(status: "Processing..");
                   LihatHasil2(provx.getgloballogdetail[i].curskau2!,provx.getgloballogdetail[i].kode_kayu!);
                }, child: Text("Process",style: TextStyle(fontSize: 6),))),
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

  Widget x(){
    return   Expanded(child: Container(
                            
                  decoration: BoxDecoration(
                     
                    border: Border.all(color: Colors.white)
                ),
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                child:Text("",style: TextStyle(color: Colors.white,fontSize: 7)),
              )
                );
  }
}