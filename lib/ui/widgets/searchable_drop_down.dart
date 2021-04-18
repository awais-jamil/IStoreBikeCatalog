import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/app/theme/app_icons.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SearchableDropDown extends StatelessWidget {
  final List<DropdownMenuItem> dropDownItems;
  final dynamic value;
  final String hintText;
  final String searchHint;
  final bool readOnly;
  final Function(dynamic value) onChanged;
  final Function(dynamic item) selectedValueWidgetFn;
  final Function(String keyword, List items) searchFn;
  final Function(dynamic value) validator;

  const SearchableDropDown({
    Key key,
    this.dropDownItems,
    this.value,
    this.searchHint,
    this.hintText = 'Select',
    this.onChanged,
    this.selectedValueWidgetFn,
    this.readOnly = false,
    this.searchFn,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SearchableDropdown.single(
      items: dropDownItems,
      onChanged: onChanged,
      value: value,
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppColors.filterSelection,
      ),
      readOnly: readOnly,
      clearIcon: Icon(Icons.delete),
      displayClearIcon: value != null && !readOnly,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.placeholderText,
      ),
      hint: Container(
        height: 48.0,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        alignment: Alignment.centerLeft,
        child: subTitleTextWidget(
          text: hintText,
          textColor: AppColors.placeholderText,
        ),
      ),
      searchHint: searchHint,
      selectedValueWidgetFn: selectedValueWidgetFn,
      displayItem: (item, selected) => Card(
        color: AppColors.background,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.all(2.0),
        child: Row(
          children: [
            SizedBox(width: 8.0),
            selected
                ? Image.asset(AppIcons.checkboxChecked)
                : Image.asset(AppIcons.checkboxUnchecked),
            SizedBox(width: 8.0),
            Expanded(
              child: item,
            ),
          ],
        ),
      ),
      searchFn: searchFn,
      isExpanded: true,
      closeButton: 'Done',
      validator: validator,
    );
  }
}
