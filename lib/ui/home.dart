import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List Tasks=[
    "eat",
    "sleep",
    "anime",
    "repeat"
  ];

  List Tasksval=[
    false,
    false,
    false,
    false,    
     ];


  bool _adval=false;
  //bool _cl = false;

  

  void add(){
    setState(() {
      if(_adval==true){
        _adval=false;
      }
      else{
        _adval=true;
      } 
    });
    
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    int index=Tasks.length;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("TODO app"),
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(30),)
             ),
        ),
      // drawer: Drawer(),
      backgroundColor: Colors.grey,
      body: Column(
        
        children: <Widget>[
         
          // Container(
          //     decoration: BoxDecoration(
          //       color: Colors.blueGrey,
          //       borderRadius: BorderRadius.circular(20.0)
          //     ),
          //   child:Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child:  Row(
                
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         Text("TODO",style: TextStyle(
          //           fontSize: 20.0
          //         ),),
          //         Text("Reminders",style: TextStyle(
          //           fontSize: 20.0
          //         ),),
          //         Text("Goals",style: TextStyle(
          //           fontSize: 20.0
          //         ),)            ],
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey[400], 
            ),
            
            child: ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: _adval==false?Icon(Icons.add):Icon(Icons.arrow_downward)
                ),
                onTap: (){
                  add();
                },
                
              ),
            ),
          ),
          _adval==false?Container():Container(
            child: TextField(
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.arrow_right),
                hintText: "enter task here"
              ),
              onSubmitted:(value) {
                Tasks.insert(0,value);
                Tasksval.insert(0,false);
                add();
              },
            )
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              // height: MediaQuery.of(context).size.height*75/100,
              // width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                //reverse: true,
                itemCount: index,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: Text(Tasks[index]),
                    trailing:
                     GestureDetector(
                      child: Icon(Icons.delete,),
                      onLongPress: (){
                        setState(() {
                          Tasks.removeAt(index);  
                          Tasksval.removeAt(index);  
                        });
                        
                      },
                      ),
                    leading: GestureDetector(
                      child: Icon(Icons.done_outline,color: Tasksval[index]==true?Colors.blue:Colors.black,),
                      onTap: (){
                        setState(() {
                          if(Tasksval[index]==true){
                            Tasksval[index]=false;
                          }
                          else{
                            Tasksval[index]=true;
                          } 
                        });
                      },
                      ),
                      
                  );
                }
              ),
            ),
          )

        ],
        
      ),
    );
  }
}
    
    
      
         
    
  
