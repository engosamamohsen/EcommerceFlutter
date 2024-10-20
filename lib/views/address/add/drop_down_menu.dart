import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class DropdownMenuGlobal extends StatefulWidget {
  String hint;
  List<String> items;
  Function(int) selected;

  DropdownMenuGlobal(
      {required this.hint, required this.items, required this.selected});

  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuGlobal> {
  _DropdownMenuExampleState();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
            ]),
        child: DropdownButton(
            isExpanded: true,
            value: selectedValue,
            hint: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextGlobal(
                text: widget.hint,
                color: Colors.black,
              ),
            ),
            selectedItemBuilder: (BuildContext context) {
              return widget.items.map((String item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12),
                  child: Text(item),
                );
              }).toList();
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade300,
            ),
            underline: SizedBox.shrink(),
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newvalue) {
              setState(() {
                selectedValue = newvalue;
                int index =
                    widget.items.indexWhere((item) => item == selectedValue);
                widget.selected(index);
              });
            }));
  }
}
