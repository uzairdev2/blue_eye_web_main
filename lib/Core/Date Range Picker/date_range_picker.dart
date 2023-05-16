import 'package:blue_eye_web/Core/Constants/Common%20Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  late TextEditingController _textEditingController;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _showDatePickerDialog() async {
    final List<DateTime>? picked = await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: SizedBox(
              height: 350.h,
              width: 500.w,
              child: Column(
                children: [
                  SfDateRangePicker(
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {
                      if (args.value is PickerDateRange) {
                        setState(() {
                          _startDate = args.value!.startDate!;
                          _endDate = args.value!.endDate!;
                        });
                      }
                    },
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                      _startDate,
                      _endDate,
                    ),
                    enableMultiView: true,
                    allowViewNavigation: true,
                    endRangeSelectionColor: Colors.red,
                    startRangeSelectionColor: mainColor,
                    view: DateRangePickerView.month,
                    backgroundColor: white,
                    rangeSelectionColor: mainColor.withOpacity(0.5),
                  ),
                  Container(
                    color: white,
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: mainColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop([_startDate, _endDate]);
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (picked != null && picked.isNotEmpty) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
        _textEditingController.text =
            '${_startDate.year}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')} ~ ${_endDate.year}-${_endDate.month.toString().padLeft(2, '0')}-${_endDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      readOnly: true,
      onTap: _showDatePickerDialog,
      decoration: InputDecoration(
        hintText: 'yyyy-MM-dd ~ yyyy-MM-dd',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        contentPadding: EdgeInsets.all(10.sp),
        suffixIcon: _textEditingController.text.isEmpty
            ? IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                onPressed: _showDatePickerDialog,
              )
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(
                    () {
                      _textEditingController.clear();
                      _startDate = DateTime.now();
                      _endDate = DateTime.now();
                    },
                  );
                },
              ),
      ),
    );
  }
}
