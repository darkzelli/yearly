import 'package:flutter/material.dart';
class YearSelector extends StatefulWidget {
  const YearSelector({super.key});

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  String? selectedYear;
  List<DropdownMenuItem<String>>? years = [];

  @override
  void initState() {
    super.initState();
    years = List.generate(100, (index) => DropdownMenuItem<String>(value: (2025 + index).toString(), child: Text((2025 + index).toString()),));
    selectedYear = years?.first.value;
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (
        Center(
          child: DropdownButton<String>(
            value: selectedYear,
            elevation: 0,
            items: years, 
            menuMaxHeight: 100,
            style: TextStyle(
              color: Color.fromRGBO(0, 107, 255, 1),
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
            underline: Container(),
            onChanged: (newYear){
              setState(() {
                selectedYear = newYear;
              });
            }
          ),
        )
      )
    );
  }
}