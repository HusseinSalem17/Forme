// Implement a multi select on the Home screen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/languages_multi_select.dart';

class PickLanguages extends StatefulWidget {
  const PickLanguages({Key? key}) : super(key: key);

  @override
  State<PickLanguages> createState() => _PickLanguagesState();
}

class _PickLanguagesState extends State<PickLanguages> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> languages = [
      'Afrikaans',
      'Albanian',
      'Amharic',
      'Arabic',
      'Armenian',
      'Azerbaijani',
      'Basque',
      'Bengali',
      'Bosnian',
      'Bulgarian',
      'Burmese',
      'Catalan',
      'Cebuano',
      'Chichewa',
      'Chinese',
      'Corsican',
      'Croatian',
      'Czech',
      'Danish',
      'Dutch',
      'English',
      'Estonian',
      'Filipino',
      'Finnish',
      'French',
      'Frisian',
      'Galician',
      'Georgian',
      'German',
      'Greek',
      'Gujarati',
      'Haitian Creole',
      'Hausa',
      'Hawaiian',
      'Hebrew',
      'Hindi',
      'Hmong',
      'Hungarian',
      'Icelandic',
      'Igbo',
      'Indonesian',
      'Irish',
      'Italian',
      'Japanese',
      'Javanese',
      'Kannada',
      'Kazakh',
      'Khmer',
      'Korean',
      'Kurdish',
      'Kyrgyz',
      'Lao',
      'Latin',
      'Latvian',
      'Lithuanian',
      'Luxembourgish',
      'Macedonian',
      'Malagasy',
      'Malay',
      'Malayalam',
      'Maltese',
      'Maori',
      'Marathi',
      'Mongolian',
      'Nepali',
      'Norwegian',
      'Pashto',
      'Persian',
      'Polish',
      'Portuguese',
      'Punjabi',
      'Romanian',
      'Russian',
      'Samoan',
      'Scots Gaelic',
      'Serbian',
      'Sindhi',
      'Sinhala',
      'Slovak',
      'Slovenian',
      'Somali',
      'Spanish',
      'Sundanese',
      'Swahili',
      'Swedish',
      'Tajik',
      'Tamil',
      'Telugu',
      'Thai',
      'Turkish',
      'Ukrainian',
      'Urdu',
      'Uzbek',
      'Vietnamese',
      'Welsh',
      'Xhosa',
      'Yiddish',
      'Yoruba',
      'Zulu'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguagesMultiSelect(items: languages);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _showMultiSelect,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pick Languages',
                        style: TextStyle(
                          color: AppColors.n400color,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _selectedItems.isEmpty
                          ? Text(
                              'Select Languages',
                              style: TextStyle(
                                color: AppColors.n400color,
                                fontSize: 12.sp,
                              ),
                            )
                          : _selectedItems.length <= 5
                              ? Text(
                                  _selectedItems.join(', '),
                                  style: TextStyle(
                                    color: AppColors.n400color,
                                    fontSize: 12.sp,
                                  ),
                                )
                              : Text(
                                  '${_selectedItems.length} is selected Language',
                                  style: TextStyle(
                                    color: AppColors.n400color,
                                    fontSize: 12.sp,
                                  ),
                                ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: _showMultiSelect,
                  icon: Icon(
                    FontAwesomeIcons.chevronRight,
                    color: AppColors.n400color,
                    size: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
