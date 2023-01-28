import 'package:flutter/material.dart';

class TagDropdownButton extends StatefulWidget {
  String? selectedTag;
  void Function(String?)? callbackSetState;
  TagDropdownButton(this.selectedTag, {this.callbackSetState, Key? key}) : super(key: key);

  @override
  _TagDropdownButtonState createState() => _TagDropdownButtonState();
}

class _TagDropdownButtonState extends State<TagDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: widget.selectedTag,
        hint: Text("Pilih Tag"),
        items: const [
          DropdownMenuItem(child: Text("Chores"),value: "Chores",),
          DropdownMenuItem(child: Text("Fitness"),value: "Fitness",),
          DropdownMenuItem(child: Text("Study"),value: "Study",),
        ],
        onChanged: (value){
          setState(() {
            widget.selectedTag = value;
            if(widget.callbackSetState != null) {
              widget.callbackSetState!(value);
            }
          });
        }

    );
  }
}
