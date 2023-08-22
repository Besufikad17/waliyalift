import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MyPhoneNumberInputField extends StatelessWidget {
  const MyPhoneNumberInputField({
    super.key, 
    required this.textEditingController, 
    required this.onInputChanged
  });
  
  final TextEditingController textEditingController;
  final Function(PhoneNumber) onInputChanged;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: textEditingController,
      onInputChanged: (phonenumber) => onInputChanged(
        PhoneNumber(
          phoneNumber: phonenumber.phoneNumber,
          dialCode: phonenumber.dialCode,
          isoCode: phonenumber.isoCode
        )
      ),
    );
  }
}