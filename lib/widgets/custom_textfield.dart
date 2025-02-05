import 'package:flutter/material.dart';
import 'package:notes/shared/colors.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool noIcon;
  final Function(String)? onChanged;
  final bool phoneNumber;
  final bool isObsecure;

  CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.noIcon = true,
    this.onChanged,
    this.phoneNumber = false,
    this.isObsecure = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool isObsecure;

  // Country selectedCountry = Country(
  //   phoneCode: '213',
  //   countryCode: 'DZ',
  //   e164Sc: 0,
  //   geographic: true,
  //   level: 1,
  //   name: 'Algeria',
  //   example: 'Algeria',
  //   displayName: 'Algeria',
  //   displayNameNoCountryCode: 'DZ',
  //   e164Key: '',
  // );

  @override
  void initState() {
    super.initState();
    isObsecure = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObsecure ? isObsecure : false,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType:
          widget.phoneNumber ? TextInputType.phone : TextInputType.text,
      style: widget.phoneNumber
          ? TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
          : null,
      decoration: InputDecoration(
        prefix: widget.phoneNumber
            ? Container(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    // showCountryPicker(
                    //   context: context,
                    //   showPhoneCode: true, // Show phone codes in picker
                    //   onSelect: (Country country) {
                    //     setState(() {
                    //       selectedCountry = country;
                    //     });
                    //   },
                    // );
                  },
                  child: Text(
                    '',
                    // '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : null,
        suffixIconColor: appPrimary,
        suffixIcon: widget.noIcon
            ? null
            : (widget.isObsecure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    icon: isObsecure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey[500]),
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
    );
  }
}
