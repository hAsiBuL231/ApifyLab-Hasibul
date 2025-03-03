import 'package:apifylab_hasib/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

enum CustomInputType { text, password, number, email, date, phone, multiline }

class CustomTextField extends StatefulWidget {
  final String? text;
  final Color? color;
  final TextEditingController? controller;
  final String? placeHolder;
  final String? hint;
  final bool? required;
  final double? fontSize;
  final CustomInputType? inputType;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final Function? onCallBack;
  final bool disable;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final EdgeInsets? margin;
  final bool? readOnly;
  final bool? shouldUpdate;

  const CustomTextField(
      {super.key,
      this.text,
      this.placeHolder,
      this.hint,
      this.controller,
      this.color,
      this.required = false,
      this.fontSize = 20,
      this.fontWeight = FontWeight.normal,
      this.inputType = CustomInputType.text,
      this.textAlign = TextAlign.start,
      this.onCallBack,
      this.disable = false,
      this.minLine,
      this.maxLine,
      this.maxLength,
      this.shouldUpdate,
      this.textInputAction = TextInputAction.next,
      this.margin,
      this.readOnly});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  TextEditingController controller = TextEditingController();
  bool isWidgetUpdated = false;

  @override
  void initState() {
    super.initState();
    showPassword = widget.inputType == CustomInputType.password ? false : true;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1920), lastDate: DateTime(2101));
    if (picked != null) {
      setState(() async {
        controller = TextEditingController(text: DateFormat('yyyy-MM-dd').format(picked));
        // final AppPreferences preference = instance.get();
        // var language = await preference.getLanguage();
        // String weekdayString;
        //if (!language) {
        String weekdayString = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'][picked.weekday - 1];
        // } else {
        //   weekdayString = ['সোম', 'মঙ্গল', 'বুধ', 'বৃহস্পতি', 'শুক্র', 'শনি', 'রবি'][picked.weekday - 1];
        // }

        //print(" \n \n \n   weekdayString = $weekdayString  \n \n \n ");
        //widget.onCallBack!(controller.text);
        widget.onCallBack!({'date': controller.text, 'weekday': weekdayString});
      });
    }
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((widget.text ?? "") == "" && (oldWidget.text ?? "") != "") {
      controller.setValue("");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shouldUpdate != null) {
      if ((widget.shouldUpdate ?? false) && controller.text == "") {
        controller.setValue("${widget.text} ");
      }
    } else {
      if ((widget.text ?? "") != "" && controller.text == "") {
        controller.setValue("${widget.text} ");
      }
    }

    return Container(
      margin: widget.margin,
      child: widget.inputType == CustomInputType.phone
          ? IntlPhoneField(
              decoration: InputDecoration(
                label: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: widget.placeHolder, style: const TextStyle(color: Colors.black)),
                  if (widget.required ?? false) ...[const TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
                ])),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              initialCountryCode: 'BD',
              showCursor: false,
              controller: controller,
              onChanged: (phone) => {widget.onCallBack!(phone.completeNumber)},
            )
          : widget.inputType == CustomInputType.multiline
              ? TextFormField(
                  minLines: widget.minLine,
                  maxLines: widget.maxLine,
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: widget.hint ?? "Enter value",
                    hintMaxLines: 5,
                    alignLabelWithHint: true,
                    label: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: widget.placeHolder, style: const TextStyle(color: Colors.black)),
                      if (widget.required ?? false) ...[const TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
                    ])),
                    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 0.035.sw),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    widget.onCallBack!(value);
                  },
                )
              : TextFormField(
                  enabled: !widget.disable,
                  readOnly: widget.readOnly ?? false,
                  minLines: widget.minLine ?? 1,
                  maxLines: widget.maxLine ?? 1,
                  maxLength: widget.maxLength,
                  validator: (value) {
                    if (widget.required ?? false) {
                      if ((value ?? "").isEmpty) {
                        return 'This field is required';
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: widget.hint ?? "Enter value",
                    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 0.035.sw),
                    hintMaxLines: 5,
                    alignLabelWithHint: true,
                    label: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: widget.placeHolder, style: const TextStyle(color: Colors.black)),
                      if (widget.required ?? false) ...[const TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
                    ])),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: widget.inputType == CustomInputType.password
                        ? IconButton(
                            icon: Icon(
                              showPassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showPassword = !showPassword;
                              setState(() {});
                            },
                          )
                        : widget.inputType == CustomInputType.date
                            ? IconButton(
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {});
                                },
                              )
                            : null,
                  ),
                  onTap: widget.inputType == CustomInputType.date ? () => {_selectDate(context)} : null,
                  obscureText: !showPassword,
                  keyboardType: widget.inputType == CustomInputType.number
                      ? TextInputType.number
                      : widget.inputType == CustomInputType.email
                          ? TextInputType.emailAddress
                          : widget.inputType == CustomInputType.multiline
                              ? TextInputType.multiline
                              : TextInputType.text,
                  controller: controller,
                  textInputAction: widget.textInputAction,
                  onChanged: (value) {
                    widget.onCallBack!(value);
                  },
                ),
    );
  }
}
