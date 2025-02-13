import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatefulWidget {
  const InteractiveViewerExample({super.key});
  @override
  State<InteractiveViewerExample> createState() => _InteractiveViewerExampleState();
}

class _InteractiveViewerExampleState extends State<InteractiveViewerExample> {
  List<Offset> positions = [Offset(100, 100), Offset(300, 300)];
  List<bool> isDraggingList = [false, false];
  List<double> widths = [100, 100];
  List<double> heights = [100, 100];
  List<bool> isResizingList = [false, false];
  int? activeIndex;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        InteractiveViewer(
          boundaryMargin: EdgeInsets.symmetric(horizontal: screenWidth),
          minScale: 0.1,
          maxScale: 1.6,
          child: Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: List.generate(positions.length, (index) {
                return _buildDraggableResizableWidget(
                  index: index,
                  position: positions[index],
                  width: widths[index],
                  height: heights[index],
                  isDragging: isDraggingList[index],
                  isResizing: isResizingList[index],
                  onDragStart: (details) {
                    setState(() {
                      isDraggingList[index] = true;
                      activeIndex = index;
                    });
                  },
                  onDragUpdate: (details) {
                    setState(() {
                      positions[index] += details.delta;
                    });
                  },
                  onDragEnd: (details) {
                    setState(() {
                      isDraggingList[index] = false;
                    });
                  },
                  onHandleDragUpdate: (details, handleType) {
                    setState(() {
                      if (handleType == 'bottomRight') {
                        double newWidth = widths[index] + details.delta.dx;
                        double newHeight = heights[index] + details.delta.dy;
                        widths[index] = newWidth.clamp(1.0, screenWidth * 0.9);
                        heights[index] = newHeight.clamp(1.0, screenWidth * 0.9);
                      }
                    });
                  },
                );
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                positions.add(Offset(200, 200));
                isDraggingList.add(false);
                widths.add(100);
                heights.add(100);
                isResizingList.add(false);
              });
            },
            child: Text('Add Widget'),
          ),
        ),
      ],
    );
  }

  Widget _buildDraggableResizableWidget({
    required int index,
    required Offset position,
    required double width,
    required double height,
    required bool isDragging,
    required bool isResizing,
    required void Function(DragStartDetails) onDragStart,
    required void Function(DragUpdateDetails) onDragUpdate,
    required void Function(DragEndDetails) onDragEnd,
    required void Function(DragUpdateDetails, String) onHandleDragUpdate,
  }) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanStart: onDragStart,
        onPanUpdate: onDragUpdate,
        onPanEnd: onDragEnd,
        onTap: () {
          setState(() {
            activeIndex = index;
          });
        },
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: isDragging ? Colors.red : Colors.green,
              child: Center(child: Text('Drag & Resize')),
            ),
            if (activeIndex == index) ..._buildResizeHandles(index, onHandleDragUpdate),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildResizeHandles(int index, void Function(DragUpdateDetails, String) onHandleDragUpdate) {
    return [
      Positioned(
        right: 0,
        bottom: 0,
        child: GestureDetector(
          onPanUpdate: (details) => onHandleDragUpdate(details, 'bottomRight'),
          child: Container(
            width: 20,
            height: 20,
            color: Colors.blue,
            child: Icon(Icons.arrow_forward, size: 16),
          ),
        ),
      ),
      // You can add more handles for other corners and edges if needed
    ];
  }
}