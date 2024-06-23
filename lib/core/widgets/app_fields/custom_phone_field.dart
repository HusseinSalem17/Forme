import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/consts/strings_consts.dart';
import 'package:extended_phone_number_input/widgets/country_code_list.dart';
import 'package:extended_phone_number_input/models/country.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_build_form.dart';

class CustomPhoneField extends StatefulWidget {
  final PhoneNumberInputController? controller;
  final String title;
  final String? initialValue;
  final String? initialCountry;
  final List<String>? excludedCountries;
  final List<String>? includedCountries;
  final bool allowPickFromContacts;
  final Widget? pickContactIcon;
  final void Function(String)? onChanged;
  final String? hint;
  final bool showSelectedFlag;
  final InputBorder? border;
  final String locale;
  final String? searchHint;
  final bool allowSearch;
  final CountryListMode countryListMode;
  final ContactsPickerPosition contactsPickerPosition;
  final String? errorText;
  final bool optional;
  final bool enabled;
  final bool titleVisibility;

  const CustomPhoneField({
    Key? key,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.initialCountry,
    this.excludedCountries,
    this.allowPickFromContacts = true,
    this.pickContactIcon,
    this.includedCountries,
    this.hint,
    required this.title,
    this.showSelectedFlag = true,
    this.border,
    this.locale = 'en',
    this.optional = false,
    this.searchHint,
    this.allowSearch = true,
    this.countryListMode = CountryListMode.bottomSheet,
    this.contactsPickerPosition = ContactsPickerPosition.suffix,
    this.errorText,
    this.titleVisibility = true,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CustomPhoneField> {
  late PhoneNumberInputController _phoneNumberInputController;
  late TextEditingController _phoneNumberTextFieldController;
  late Future _initFuture;
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _phoneNumberInputController = PhoneNumberInputController(context);
    } else {
      _phoneNumberInputController = widget.controller!;
    }

    _initFuture = _init();
    _phoneNumberInputController.addListener(_refresh);

    _phoneNumberTextFieldController =
        TextEditingController(text: widget.initialValue);
  }

  Future _init() async {
    await _phoneNumberInputController.init(
      initialCountryCode: widget.initialCountry,
      excludeCountries: widget.excludedCountries,
      includeCountries: widget.includedCountries,
      initialPhoneNumber: widget.initialValue,
      errorText: widget.errorText,
      locale: widget.locale,
    );

    if (widget.initialValue != null) {
      _phoneNumberInputController.innerPhoneNumber = widget.initialValue!;
    }
  }

  void _refresh() {
    _phoneNumberTextFieldController.value = TextEditingValue(
      text: _phoneNumberInputController.phoneNumber,
      selection: TextSelection(
        baseOffset: _phoneNumberInputController.phoneNumber.length,
        extentOffset: _phoneNumberInputController.phoneNumber.length,
      ),
    );

    setState(() {
      _selectedCountry = _phoneNumberInputController.selectedCountry;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(_phoneNumberInputController.fullPhoneNumber);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        return CustomBuildForm(
          optional: widget.optional,
          titleVisibility: widget.titleVisibility,
          title: widget.title,
          titleColor: AppColors.n900Black,
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                  enabled: widget.enabled,
                  style: TextStyles.textStyleRegular.copyWith(
                    color: AppColors.n900Black,
                    fontSize: 14.sp,
                  ),
                  controller: _phoneNumberTextFieldController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(kNumberRegex),
                  ],
                  onChanged: (v) {
                    _phoneNumberInputController.innerPhoneNumber = v;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: widget.optional
                      ? null
                      : _phoneNumberInputController.validator,
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: widget.hint,
                    border: widget.border,
                    hintStyle: const TextStyle(color: Color(0xFFB6B6B6)),
                    enabledBorder: textFieldBorder(),
                    focusedBorder: textFieldBorder(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                    errorBorder: textFieldBorder(
                      color: AppColors.r200ErrorColor,
                      width: 2.0,
                    ),
                    filled: true, // Enable fill color
                    fillColor: widget.enabled
                        ? AppColors.background
                        : AppColors.n20Gray,
                    suffixIcon: Visibility(
                      visible: widget.allowPickFromContacts &&
                          widget.contactsPickerPosition ==
                              ContactsPickerPosition.suffix,
                      child: widget.pickContactIcon == null
                          ? IconButton(
                              onPressed:
                                  _phoneNumberInputController.pickFromContacts,
                              icon: Icon(
                                Icons.contact_phone,
                                color: Theme.of(context).primaryColor,
                              ))
                          : InkWell(
                              onTap:
                                  _phoneNumberInputController.pickFromContacts,
                              child: widget.pickContactIcon,
                            ),
                    ),
                    prefixIcon: InkWell(
                      onTap: _openCountryList,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          if (_selectedCountry != null &&
                              widget.showSelectedFlag)
                            Image.asset(
                              _selectedCountry!.flagPath,
                              height: 12,
                            ),
                          const SizedBox(
                            width: 4,
                          ),
                          if (_selectedCountry != null)
                            Text(
                              _selectedCountry!.dialCode,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 24,
                            width: 1,
                            color: const Color(0xFFB9BFC5),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.allowPickFromContacts &&
                    widget.contactsPickerPosition ==
                        ContactsPickerPosition.bottom,
                child: widget.pickContactIcon == null
                    ? IconButton(
                        onPressed: _phoneNumberInputController.pickFromContacts,
                        icon: Icon(
                          Icons.contact_phone,
                          color: Theme.of(context).primaryColor,
                        ))
                    : InkWell(
                        onTap: _phoneNumberInputController.pickFromContacts,
                        child: widget.pickContactIcon,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openCountryList() {
    switch (widget.countryListMode) {
      case CountryListMode.bottomSheet:
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enableDrag: true,
          context: context,
          builder: (_) => SizedBox(
            height: 500,
            child: CountryCodeList(
              searchHint: widget.searchHint,
              allowSearch: widget.allowSearch,
              phoneNumberInputController: _phoneNumberInputController,
            ),
          ),
        );
        break;
      case CountryListMode.dialog:
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: double.maxFinite,
              child: CountryCodeList(
                searchHint: widget.searchHint,
                allowSearch: widget.allowSearch,
                phoneNumberInputController: _phoneNumberInputController,
              ),
            ),
          ),
        );
        break;
    }
  }
}
