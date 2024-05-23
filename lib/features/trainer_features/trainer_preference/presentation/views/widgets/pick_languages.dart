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
  // Moved the list of languages to a static constant for reusability and clarity
  static const List<String> _languages = [
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

  // Function to show multi-select dialog and update selected items
  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LanguagesMultiSelect(items: _languages);
      },
    );

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
        _buildSelectionRow(),
      ],
    );
  }

  // Helper method to build the row for language selection
  Widget _buildSelectionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _showMultiSelect,
          child: _buildLanguageSelectionInfo(),
        ),
        _buildChevronIcon(),
      ],
    );
  }

  // Helper method to build the language selection information
  Widget _buildLanguageSelectionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Languages',
          style: TextStyle(
            color: AppColors.n400color,
            fontSize: 12.sp,
          ),
        ),
        Text(
          _getSelectedLanguagesText(),
          style: TextStyle(
            color: AppColors.n400color,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  // Helper method to get the text for selected languages
  String _getSelectedLanguagesText() {
    if (_selectedItems.isEmpty) {
      return 'Select Languages';
    } else if (_selectedItems.length <= 5) {
      return _selectedItems.join(', ');
    } else {
      return '${_selectedItems.length} languages selected';
    }
  }

  // Helper method to build the chevron icon button
  Widget _buildChevronIcon() {
    return IconButton(
      onPressed: _showMultiSelect,
      icon: Icon(
        FontAwesomeIcons.chevronRight,
        color: AppColors.n400color,
        size: 16.sp,
      ),
    );
  }
}
