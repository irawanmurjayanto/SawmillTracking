import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/form/barcodehilang.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';
import 'package:flutter/services.dart';
import 'package:sawmill_tracking/message/msg.dart';
import 'package:get/get.dart';

class ScanBarcodeTrack extends StatefulWidget {
  const ScanBarcodeTrack({super.key});

  @override
  State<ScanBarcodeTrack> createState() => _ScanBarcodeTrackState();
}

class _ScanBarcodeTrackState extends State<ScanBarcodeTrack> {
   final box=GetStorage();
   final  _TextBarcode=TextEditingController();
   final   _TextNourut=TextEditingController();
   final   _TextP=TextEditingController();
   final   _TextL=TextEditingController();
   final   _TextT=TextEditingController();
   String? jumbarc="";

   List<BarcodeHilang> clearData=[];
   

   Future<void> dataHeader(String company,String tgl) async {
    String barcodeScanRes;
      try {
      barcodeScanRes = await FlutterBarcodeScanner.dataHeader(
           company,tgl);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

   
  }
   
  


 
  Future<void> scanBarcodeNormalBarcode() async {
    String barcodeScanRes;
        try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
        
        // Provider.of<Alldata>(context,listen: false).Insert_PR_Manual_Barcode(context, barcodeScanRes,_prno_temp.text, _tglpr.text, txttampung_dept!, box.read('u_name'))
        // .then((value) => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => 
        // PurchaseRequest_form(tipe: tipe, pr_no: _prno_temp.text, dept_pr: txttampung_dept.toString(), tgl_pr: _tglpr.text)
        // ,))
        // );
       
        
        // getRefresh_isipr(); 
     setMessage2(barcodeScanRes, context);
     setState(() {
       _TextBarcode.text=barcodeScanRes;
     });
     setState(() {
       
     });
      EasyLoading.show(status: "Processing");
            await Provider.of<Multidatas>(context,listen: false).cariBarcode_papan(_TextBarcode.text,_TextP.text,_TextL.text,_TextT.text, context);
       
    //     setState(() {
    //  // _barcodecode.text = barcodeScanRes;
    //   //_jumlah=1;
    // });
    
    // if (barcodeScanRes.isNotEmpty )
    // {

    //   if (barcodeScanRes!='-1')
    //    {
    // Future.delayed(Duration(milliseconds: 500),(){
    //     ambilHasil(_jumlah.toString(),_scanBarcode);
    //   scanBarcodeNormal();
    //      });

       //dataHeader
      


    //    setState(() {
    //   _barcodecode.text = barcodeScanRes;
    //   _jumlah++;
    // }
    //);

    //    }
    // }
    
   
  }


   getData() async{
    await  Provider.of<Multidatas>(context,listen: false).cariBarcode_papan(_TextBarcode.text,_TextP.text,_TextL.text,_TextT.text,  context);  
    setState(() {
      jumbarc=box.read('jumbarcode').toString();
    });
   }

  //  getBarcodeText(String Barcode) async{
  //   showDialog(context: context, builder: (context) {
  //     AlertDialog(
  //         title: Text("Barcode Text"),
  //         content: Text("Barcode"),
  //       actions: [

  //       ],  
  //     );
  //   },);
  //  }

  //final dataController=Get.put(DataContr);

  @override
  void initState() {
    clearData.clear();
  
    //Provider.of<Multidatas>(context,listen: false).cariBarcodeHilang(_TextKodeKayu.text, _TextNourut.text, context);
    if (_TextBarcode.text.length==0)
    {
      setState(() {
        _TextBarcode.text="";
      });
       Provider.of<Multidatas>(context,listen: false).cariBarcode_papan("xx",_TextP.text,_TextL.text,_TextT.text, context);
    }else
    {
      getData();
    }
    // TODO: implement initState
    super.initState();
  }

  getCopied(String copytext) async{
  await  Clipboard.setData(const ClipboardData(text: "Your Copy text")).then((_) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to your clipboard !')));
});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
         child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.pink),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('assets/images/barcode.png'))),
          ),
        
        onPressed: () {
          DateTime tgl=DateTime.now();
          dataHeader("PT. Paradise Island", tgl.toString());
        scanBarcodeNormalBarcode();
      },),
  
      appBar: AppBar(title: Text("Tracking Barcode Papan"),),
      body: Padding(padding: EdgeInsets.all(5),
      child:
      SingleChildScrollView(
        child: 
       Container(

        padding: EdgeInsets.all(5),
         
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(children: [
          TextFormField(
            controller: _TextBarcode,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintText: "Ketik Barcode Papan",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
          SizedBox(height: 5,),

           Row(
              children: [
              Expanded(child:   
                   TextFormField(
            controller: _TextP,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintText: "Panjang",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
              ),
          SizedBox(width: 5,),

           Expanded(child:   
                   TextFormField(
            controller: _TextL,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintText: "Lebar",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
              ),
              SizedBox(width: 5,),
               Expanded(child:   
                   TextFormField(
            controller: _TextT,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintText: "Tebal",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
              ),
              ],
           ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async{
            EasyLoading.show(status: "Processing");
             clearData.clear();
            await Provider.of<Multidatas>(context,listen: false).cariBarcode_papan(_TextBarcode.text,_TextP.text,_TextL.text,_TextT.text, context);
              setState(() {
      jumbarc=box.read('jumbarcode').toString();
    });
          }, child: Text("Process")),



          SizedBox(height: 5,),

          Row(
            children: [
                 Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("Barcode",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("P",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("L",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("T",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("KOde Kayu",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
  
  
  
  
  

            ],
          ),
          SizedBox(height: 5,),
          Text('Jumlah Barcode :'+jumbarc!),
          SingleChildScrollView(
            child: 
            Container(
              height: MediaQuery.of(context).size.height/2.2,
              child: 
          Consumer<Multidatas>(builder: (context, provx, child) {
            return ListView.builder(
              itemCount: provx.getGlobalCariBarcodepapan.length,
              itemBuilder: (context, i) {
                return  Row(
                  children: [
                    
                      Expanded(child:
                       GestureDetector(
                      child: 
                      
                       Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalCariBarcodepapan[i].barcodepapan!,style: TextStyle(fontSize: 8,color: Colors.yellow,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                       onTap: () async {
                          final String textToCopy = provx.getGlobalCariBarcodepapan[i].barcodepapan!;
                if (textToCopy.isNotEmpty) {
                  try {
                    await Clipboard.setData(ClipboardData(text: textToCopy));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(provx.getGlobalCariBarcodepapan[i].barcodepapan!+ '  Copied',textAlign: TextAlign.center,),
                      padding: EdgeInsets.all(5),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: MediaQuery.of(context).size.height-250),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to copy to clipboard.')),
                    );
                  }
                }
                       }  
                      ),
                      
                      
                      ),
                     
                   
                    
                      
                      SizedBox(width: 2,),
                    
                          Expanded(child: Container(
                             padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalCariBarcodepapan[i].P!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                           Expanded(child: Container(
                             padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalCariBarcodepapan[i].L!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                           Expanded(child: Container(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalCariBarcodepapan[i].T!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                        Expanded(child: Container(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalCariBarcodepapan[i].kode_kayu!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      ))

                  ],
                );
            },);
          },)),
            
          )
        ],),
      ),
      ),
      )
    );
  }
}