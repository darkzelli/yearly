import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:yearly/widgets/year_selector_years.dart';
class YearSelector extends StatefulWidget {
  const YearSelector({super.key});

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  int? selectedYear = 2025;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        showPopover(
          context: context, 
          bodyBuilder: (context) => YearSelectorYears(
            onYearChanged: (int year) {
              setState(() {  
                selectedYear = year;
              });
              Navigator.pop(context);
            },
          ),
          width: screenWidth * .5,
          height: 100,
          direction: PopoverDirection.bottom
        );
      },
      child: Text(selectedYear.toString(),
        style: TextStyle(
          fontSize: 30,
          color: const Color.fromRGBO(0, 107, 255, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}