import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/functions/validators.dart';
import '../../../../book_appoitment_with _trainer/presentation/views/add_new_card_screen.dart';
import 'card_text_form_field.dart';

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
            CardTextFromField(
              subTitle: 'Card Holder Name',
              hintText: 'Enter Your Name',
              onChange: (val) {
                cardHolderName = val;
                setState(() {});
              },
            ),
            CardTextFromField(
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
                  child: CardTextFromField(
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
                  child: CardTextFromField(
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

