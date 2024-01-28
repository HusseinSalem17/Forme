import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/functions/validators.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';



class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Add New Card'),
      ),
      body: CustomCreditCard(),
    );
  }
}

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({Key? key}) : super(key: key);

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  String data = '';
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreditCardWidget(
              cardBgColor: AppColors.p300PrimaryColor,
              padding: 0,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (value) {},
            ),
            CardTextFromFields(
              subTitle: 'Card Holder Name',
              hintText: 'Enter Your Name',
              onChange: (val) {
                cardHolderName = val;
                setState(() {});
              },
            ),
            CardTextFromFields(
              subTitle: 'Card Number',
              hintText: 'xxxx xxxx xxxx xxxx',
              onChange: (val) {
                // Remove any non-digit characters from the input
                val = val.replaceAll(RegExp(r'\D'), '');
                // Ensure the card number doesn't exceed 14 digits
                if (val.length <= 16) {
                  cardNumber = formatCardNumber(val);
                  setState(() {});
                }
              },
              inputFormats: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormatter(),
              ],
              textInputType: TextInputType.number,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CardTextFromFields(
                    subTitle: 'Expiry Date',
                    hintText: '02/30',
                    inputFormats: [
                      ExpireDateFormatter(),
                    ],
                    onChange: (value) {
                      expiryDate = value;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CardTextFromFields(
                    subTitle: 'CVV',
                    hintText: '000',
                    onChange: (value) {
                      // Remove any non-digit characters from the input
                      value = value.replaceAll(RegExp(r'\D'), '');

                      // Limit the input to 4 digits
                      if (value.length <= 4) {
                        cvvCode = value;
                        setState(() {
                          // Check if the CVV code has been fully entered
                          if (value.isNotEmpty) {
                            showBackView = true;
                          } else {
                            showBackView = false;
                          }
                        });
                      }
                    },
                    onEditingComplete: () {
                      setState(() {
                        showBackView = false;
                      });
                      // Close the keyboard
                      FocusScope.of(context).unfocus();
                    },
                    inputFormats: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    // Remove the onSubmit callback
                  ),
                ),
              ],
            ),
            CreditCardForm(
              isHolderNameVisible: false,
              isCardNumberVisible: false,
              isExpiryDateVisible: false,
              enableCvv: false,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (creditCardModelData) {
                cardNumber = creditCardModelData.cardNumber;
                expiryDate = creditCardModelData.expiryDate;
                cardHolderName = creditCardModelData.cardHolderName;
                cvvCode = creditCardModelData.cvvCode;
                showBackView = creditCardModelData.isCvvFocused;
                setState(() {});
              },
              formKey: formKey,
            ),
          ],
        ),
      ),
    );
  }
}

class CardTextFromFields extends StatelessWidget {
  final String hintText;
  final String subTitle;
  final ValueChanged<String>? onChange;

  final List<TextInputFormatter>? inputFormats;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;

  const CardTextFromFields(
      {super.key,
        required this.hintText,
        required this.subTitle,
        this.onChange,
        this.inputFormats,
        this.textInputType,
        this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    final subTitleStyle = TextStyles.textStyleSemiBold.copyWith(
      fontSize: 16,
      color: AppColors.neutralsN9,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          subTitle,
          style: subTitleStyle,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11.5,
            ),
            hintText: hintText,
            hintStyle: TextStyles.textStyleRegular.copyWith(
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.n40BorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.p300PrimaryColor),
            ),
          ),
          keyboardType: textInputType,

          ///initialValue: formatCardNumber(cardNumber),
          onChanged: onChange,
          //keyboardType: TextInputType.number,
          inputFormatters: inputFormats,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    if (text.length <= 4) {
      return newValue;
    }

    final formattedText = StringBuffer();
    for (int i = 0; i < text.length; i += 4) {
      final end = (i + 4 < text.length) ? i + 4 : text.length;
      formattedText.write(text.substring(i, end));

      if (end < text.length) {
        formattedText.write(' ');
      }
    }

    return newValue.copyWith(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class ExpireDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String newText = newValue.text;

    // Allow only numeric characters
    final String sanitizedText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedText.length >= 2) {
      // Insert '/' after the second numeric character
      final String formattedText =
          '${sanitizedText.substring(0, 2)}${sanitizedText.length > 2 ? '/${sanitizedText.substring(2, min(4, sanitizedText.length))}' : ''}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    return newValue.copyWith(
      text: sanitizedText,
      selection: TextSelection.collapsed(offset: sanitizedText.length),
    );
  }
}
