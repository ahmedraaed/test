
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

String getMapImage(double? latitude, double? longitude) {
  const apiKey = "AIzaSyBuAZVrgY4O-fT0MAWoNa4osf7Ovgv2KU0";

  var url =
      "https://maps.googleapis.com/maps/api/staticmap?center=${latitude ?? 0},${longitude ?? 0}&zoom=18&size=400x400&key=$apiKey";
  print(url);
  return url;
}

Widget dayDate({var searchController}){
  return SfDateRangePicker(

    initialDisplayDate: DateTime.now(),
    initialSelectedDate: DateTime.now(),
    view: DateRangePickerView.month,
    selectionMode: DateRangePickerSelectionMode.range,
    selectionTextStyle:
    const TextStyle(color: Colors.white),
    selectionColor: Colors.blue,
    startRangeSelectionColor: Colors.red,
    endRangeSelectionColor:Colors.red,
    rangeSelectionColor:
    Colors.red,
    rangeTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20),
    enablePastDates: false,
    onSelectionChanged:
        (DateRangePickerSelectionChangedArgs args) {
      if (args.value is PickerDateRange) {
        if (args.value.startDate != null) {
          searchController.changeStartAndEndDate(
              args.value.startDate
                  .toString()
                  .substring(0, 11),
              "");
          if (args.value.endDate != null) {
            searchController.changeStartAndEndDate(
                args.value.startDate
                    .toString()
                    .substring(0, 11),
                args.value.endDate
                    .toString()
                    .substring(0, 11));
          }
        }
      }
    },
  );
}