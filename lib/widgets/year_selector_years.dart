import 'package:flutter/material.dart';
class YearSelectorYears extends StatefulWidget {
  final Function(int) onYearChanged;
  const YearSelectorYears({super.key, required this.onYearChanged});
  

  @override
  State<YearSelectorYears> createState() => _YearSelectorYearsState();
}

class _YearSelectorYearsState extends State<YearSelectorYears> {
  int? selectedYear;
  int startYear = 2025;
  List<int> years = [2024];

  


  @override
  void initState() {
    super.initState();
    years = List.generate(100, (index) => startYear + index);
    selectedYear = years.first;
    
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
       padding: EdgeInsets.zero,
      itemCount: years.length, 
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Add spacing between items
                    child: GestureDetector(
                      onTap: () => widget.onYearChanged(years[index]),
                      child: Text(years[index].toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color: const Color.fromRGBO(0, 107, 255, 1),
                        ),
                      ),
                    ),
                  ),
        );
      },
    );
  }
}