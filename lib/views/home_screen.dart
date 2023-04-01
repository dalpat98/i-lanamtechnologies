import 'package:deliveryapp/components/date_selection_button.dart';
import 'package:deliveryapp/components/time_selection_dropdown.dart';
import 'package:deliveryapp/controller/home_screen_provider.dart';
import 'package:deliveryapp/views/show_information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CollectionDateAndTime(),
                  const SizedBox(
                    height: 30,
                  ),
                  const DeliveryDateAndTime(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                          "Note : Delivery charge of €3.00 will be incurred for a full service."),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const InfoScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          elevation: 1,
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CollectionDateAndTime extends StatefulWidget {
  const CollectionDateAndTime({super.key});

  @override
  State<CollectionDateAndTime> createState() => _CollectionDateAndTimeState();
}

class _CollectionDateAndTimeState extends State<CollectionDateAndTime> {
  late HomeProvider homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Collection Date & Time",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const DateSelectionButtons(
          isCollection: true,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Morning",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TimeSelectionDropdown(
                    timeSlots: [
                      "07:00am-08:00am",
                      "08:00am-09:00am",
                      "09:00am-10:00am",
                      "10:00am-11:00am",
                      "11:00am-12:00am",
                    ],
                    isCollection: true,
                    isMorningSlot: true,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Afternoon",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TimeSelectionDropdown(
                    timeSlots: [
                      "12:00pm-1:00pm",
                      "01:00pm-2:00pm",
                      "02:00pm-3:00pm",
                      "03:00pm-4:00pm",
                      "04:00pm-5:00pm",
                    ],
                    isCollection: true,
                    isMorningSlot: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DeliveryDateAndTime extends StatefulWidget {
  const DeliveryDateAndTime({super.key});

  @override
  State<DeliveryDateAndTime> createState() => _DeliveryDateAndTimeState();
}

class _DeliveryDateAndTimeState extends State<DeliveryDateAndTime> {
  late HomeProvider homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Delivery Date & Time",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const DateSelectionButtons(
          isCollection: false,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Morning",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TimeSelectionDropdown(
                    timeSlots: [
                      "07:00am-08:00am",
                      "08:00am-09:00am",
                      "09:00am-10:00am",
                      "10:00am-11:00am",
                      "11:00am-12:00am",
                    ],
                    isCollection: false,
                    isMorningSlot: true,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Afternoon",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TimeSelectionDropdown(
                    timeSlots: [
                      "12:00pm-1:00pm",
                      "01:00pm-2:00pm",
                      "02:00pm-3:00pm",
                      "03:00pm-4:00pm",
                      "04:00pm-5:00pm",
                    ],
                    isCollection: false,
                    isMorningSlot: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
