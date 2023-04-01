import 'package:deliveryapp/components/snackbar.dart';
import 'package:deliveryapp/controller/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateSelectionButtons extends StatefulWidget {
  final bool isCollection;

  const DateSelectionButtons({super.key, required this.isCollection});

  @override
  _DateSelectionButtonsState createState() => _DateSelectionButtonsState();
}

class _DateSelectionButtonsState extends State<DateSelectionButtons> {
  late HomeProvider homeProvider;

  void validation(DateTime? _selectedDate) {
    if (widget.isCollection) {
      homeProvider.collectionDate = _selectedDate;
      homeProvider.deliveryDate = null;
      homeProvider.notify();
    } else {
      if (homeProvider.collectionDate == null) {
        CustomSnackBar(
          context,
          const Text('Please select Collection Date first'),
          backgroundColor: Colors.red,
        );
      } else {
        if (_selectedDate!.isAfter(
            homeProvider.collectionDate!.add(const Duration(days: 1)))) {
          homeProvider.deliveryDate = _selectedDate;
          homeProvider.notify();
        } else {
          CustomSnackBar(
            context,
            const Text('Delivery date should be after collection date'),
            backgroundColor: Colors.red,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDateButton('Today', DateTime.now(), () {
          validation(DateTime.now());
        }),
        _buildDateButton(
            'Tomorrow', DateTime.now().add(const Duration(days: 1)), () {
          validation(DateTime.now().add(const Duration(days: 1)));
        }),
        _buildDateButton(
            'Select Date', DateTime.now().add(const Duration(days: 2)), () {
          validation(DateTime.now().add(const Duration(days: 2)));
        }),
      ],
    );
  }

  Widget _buildDateButton(String text, DateTime date, Function()? onPressed) {
    bool isDateSelected;
    if (widget.isCollection) {
      isDateSelected = homeProvider.collectionDate == null
          ? false
          : (date.year == homeProvider.collectionDate!.year &&
              date.month == homeProvider.collectionDate!.month &&
              date.day == homeProvider.collectionDate!.day);
    } else {
      isDateSelected = homeProvider.deliveryDate == null
          ? false
          : (date.year == homeProvider.deliveryDate!.year &&
              date.month == homeProvider.deliveryDate!.month &&
              date.day == homeProvider.deliveryDate!.day);
    }

    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            elevation: 1,
            backgroundColor: isDateSelected ? Colors.blue : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isDateSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                DateFormat('dd MMM').format(date),
                style: TextStyle(
                  color: isDateSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
