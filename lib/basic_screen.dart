import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:belajar_no1/edit_item_screen.dart';
import 'package:belajar_no1/presentation/widgets/tag_dropdown_button.dart';

import 'model/ToDo.dart';

const tagDropdownValues = [
  "Chores",
  "Fitness",
  "Study",
];

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  // bool isDoneMandi = false;
  // List<bool> listValueToDoIsDone = [
  //   false,
  //   false,
  //   false,
  //   false,
  // ];
  //
  // List<String> listTask = [
  //   "Mandi",
  //   "Nyuci",
  //   "Belajar",
  //   "Tidur",
  // ];
  
  List<ToDo> listTodo = [
    ToDo(false,"Mandi"),
    ToDo(false,"Nyuci"),
    ToDo(false,"Belajar"),
    ToDo(false,"Tidur"),
  ];
  var inputController = TextEditingController();
  var selectedTag;

  // List<Widget> widgetTodo(){
  //   var listOfToDos = <Widget>[];
  //   for(var i = 0; i < listTodo.length; i++){
  //     listOfToDos.add(Row(
  //       children: [
  //         Checkbox(value: listTodo[i].isDone, onChanged: (val) {
  //           setState(() {
  //             listTodo[i].isDone = !listTodo[i].isDone;
  //           });
  //         }),
  //         Text(listTodo[i].task),
  //       ],
  //     ),);
  //   }
  //   return listOfToDos;
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text("Basic Screen"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listTodo.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical:8),
                      child: Row(
                        children: [
                          Checkbox(
                              value: listTodo[index].isDone,
                              onChanged: (val){
                                setState(() {
                                  listTodo[index].isDone = !listTodo[index].isDone;
                                });
                              }),
                          Expanded(child: GestureDetector(
                              onTap:() async {
                                var newValue = await Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EditItemScreen(listTodo[index]),
                                  )
                                );
                                setState(() {
                                  listTodo[index].task = newValue;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listTodo[index].task),
                                  Text("Tag: ${listTodo[index].tag ?? "-"}"),
                                ],
                              ))),
                          ElevatedButton(onPressed: () async {
                            var theDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050));
                            var theTime = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                            var nonNullDate = theDate ?? DateTime.now();
                            var nonNullTime = theTime ?? TimeOfDay.fromDateTime(DateTime.now());
                            var dateWithTime = DateTime(nonNullDate.year,nonNullDate.month,nonNullDate.day,nonNullTime.hour, nonNullTime.minute);
                            setState(() {
                              listTodo[index].jadwal = dateWithTime;
                            });
                          },
                              child: Text((listTodo[index].jadwal == null ? "Pilih Tanggal" : DateFormat("dd - MMM - yyyy \nHH:mm").format(listTodo[index].jadwal ?? DateTime.now())).toString() )),
                          Container(
                            margin: const EdgeInsets.only(right: 16, left: 16),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  listTodo.removeAt(index);
                                });
                              },
                              child: Icon(Icons.clear)),
                          )
                        ],
                      ),
                    );
                  }),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: inputController,
                    ),
                        TagDropdownButton(
                          selectedTag,
                          callbackSetState: (valueFromInternal){
                          setState(() {
                            selectedTag = valueFromInternal;
                          });
                          },),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            listTodo.add(ToDo(false,inputController.text));
                            inputController.text = "";
                            selectedTag = null;
                            print("selectedTag $selectedTag");
                          });
                        }, child: Text("Add"))
                        ],
                    )),
                  ],
                ),
              ),
            ),
          );
  }
}


