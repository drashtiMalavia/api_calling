import 'package:api_calling/PostModel.dart';
import 'package:api_calling/infoOfPost.dart';
import 'package:flutter/material.dart';

class DisplayPost extends StatefulWidget {
  List<PostModel> myList;
  DisplayPost(this.myList, {super.key});

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {
  int allDataLength=0;
  int item=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allDataLength=widget.myList.length;
    item=(widget.myList[allDataLength-1].userId)!.toInt();
    print("allDataLength=$item");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Users',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('image/img_1.png',fit: BoxFit.cover,),
            ),
            Container(
              child: ListView.builder(
                itemCount: item,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return InfoOfPost(index+1,widget.myList);
                      },));
                    });
                  },
                  child: Container(
                    height: 65,
                    child: Card(
                      child: Container(
                        alignment: Alignment.center,
                          child: Text('Userid = ${index+1}',style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,)
                      ),
                      color: Colors.white,
                      elevation: 20,
                    ),
                  ),
                );
              },),
              // child: ListView.builder(
              //   itemCount: widget.myList.length,
              //   itemBuilder: (context, index) {
              //   return Container(
              //     height: 200,
              //     width: 200,
              //     child: Card(
              //       elevation: 20,
              //       child: Column(
              //         children: [
              //           Container(
              //             child: Text('id=${widget.myList[index].id}'),
              //           ),
              //           Container(
              //             child: Text('userid=${widget.myList[index].userId}'),
              //           ),
              //           Container(
              //             child: Text('Title=${widget.myList[index].title}'),
              //           ),
              //           Container(
              //             child: Text('Body=${widget.myList[index].body}'),
              //           ),
              //         ],
              //       ),
              //     ),
              //   );
              // },),
            ),
          ],
        ),
      ),
    );
  }
}
