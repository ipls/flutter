import 'package:flutter/material.dart';
import 'package:belajar_no1/presentation/widgets/tag_dropdown_button.dart';
import 'package:belajar_no1/basic_screen.dart';
import 'model/ToDo.dart';

class EditItemScreen extends StatefulWidget {
  final ToDo theTask;
  const EditItemScreen(this.theTask,{Key? key}) : super(key: key);

  @override
  State<EditItemScreen> createState() => EditItemScreenState();
}

class EditItemScreenState extends State<EditItemScreen> {
  late var controller;
  var selectedTag;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.theTask.task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Screen"),),
      body: Center(child:
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: controller,
            ),
          ),
          TagDropdownButton(
            selectedTag,
            callbackSetState: (valueFromInternal){
              setState(() {
                selectedTag = valueFromInternal;
                print("Dropdown kepencet didalam edit screen");
              });
            },),
          ElevatedButton(onPressed: (){
            var newTask = widget.theTask;
            newTask.task = controller.text;
            newTask.tag = selectedTag;
            Navigator.of(context).pop(newTask);
          }, child: Text("Update"))
        ],
      )
      ),
    );
  }
}
