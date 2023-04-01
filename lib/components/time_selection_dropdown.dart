import 'package:deliveryapp/components/snackbar.dart';
import 'package:deliveryapp/controller/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeSelectionDropdown extends StatefulWidget {
  final List<String> timeSlots;
  final bool isCollection;
  final bool isMorningSlot;
  const TimeSelectionDropdown(
      {super.key,
      required this.timeSlots,
      required this.isCollection,
      required this.isMorningSlot});

  @override
  State<TimeSelectionDropdown> createState() => _TimeSelectionDropdownState();
}

class _TimeSelectionDropdownState extends State<TimeSelectionDropdown> {
  String? selectedTimeSlot;
  late HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: DropdownButton<String>(
        value: selectedTimeSlot,
        onChanged: (String? newValue) {
          if (widget.isCollection) {
            if (homeProvider.isCollectionSlotMorning == null) {
              homeProvider.collectionTime = newValue!;
              homeProvider.isCollectionSlotMorning = widget.isMorningSlot;
              setState(() {
                selectedTimeSlot = newValue;
              });
            } else {
              if (homeProvider.isCollectionSlotMorning ==
                  widget.isMorningSlot) {
                homeProvider.collectionTime = newValue!;
                setState(() {
                  selectedTimeSlot = newValue;
                });
              } else {
                CustomSnackBar(
                  context,
                  const Text('You can only select one time slot'),
                  backgroundColor: Colors.red,
                );
              }
            }
          } else {
            if (homeProvider.isDeliverySlotMorning == null) {
              homeProvider.deliveryTime = newValue!;
              homeProvider.isDeliverySlotMorning = widget.isMorningSlot;
              setState(() {
                selectedTimeSlot = newValue;
              });
            } else {
              if (homeProvider.isDeliverySlotMorning == widget.isMorningSlot) {
                homeProvider.deliveryTime = newValue!;
                setState(() {
                  selectedTimeSlot = newValue;
                });
              } else {
                CustomSnackBar(
                  context,
                  const Text('You can only select one time slot'),
                  backgroundColor: Colors.red,
                );
              }
            }
          }
        },
        hint: const Text('Select time'),
        underline: Container(
          height: 0,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        items:
            widget.timeSlots.map<DropdownMenuItem<String>>((String timeSlot) {
          return DropdownMenuItem<String>(
            value: timeSlot,
            child: Text(
              timeSlot,
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
      ),
    );
  }
}
