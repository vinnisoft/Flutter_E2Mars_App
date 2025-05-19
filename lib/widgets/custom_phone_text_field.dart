import 'package:e2mars/export.dart';

class CustomPhoneTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final String? initialCountryCode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool isRequired;
  final bool obscureText;
  final Function(PhoneNumber)? onChange;
  final Function(Country)? onCountryChange;
  final FocusNode focusNode;
  final int? minLines;
  final Color? fillColor;
  final Color? errorColor;
  final InputBorder? decoration;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIconWidget;
  final EdgeInsets? padding;
  final TextStyle? hintStyle;

  const CustomPhoneTextField({
    super.key,
    this.label,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.focusNode,
    this.validator,
    this.errorColor,
    this.padding,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
    this.keyboardType = TextInputType.phone,
    this.onChange,
    this.onCountryChange,
    this.onFieldSubmitted,
    this.minLines,
    this.fillColor,
    this.decoration,
    this.textInputAction,
    this.suffixIconWidget,
    this.initialCountryCode,
    this.initialValue,
    this.hintStyle,
    this.isRequired = false,
    this.isReadOnly = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null && label != ''
            ? Text(
          label ?? '',
          style: textStyleTitleSmall().copyWith(color: AppColors.primaryTextColor, fontWeight: FontWeight.w500),
        ).paddingOnly(bottom: 6.w)
            : const SizedBox(),
        IntlPhoneField(
          controller: controller,
          inputFormatters: inputFormatters,
          readOnly: isReadOnly,
          onCountryChanged: onCountryChange,
          onChanged: onChange,
          focusNode: focusNode,
          obscureText: obscureText,
          style:  textStyleLabelMedium(),
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          initialCountryCode: initialCountryCode,
          initialValue: initialValue,
          flagsButtonMargin: EdgeInsets.zero,
          pickerDialogStyle: PickerDialogStyle(
            countryNameStyle: textStyleTitleMedium(),
            countryCodeStyle: textStyleTitleMedium(),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
            searchFieldPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
            listTileDivider: Divider(
              color: Colors.grey.shade500,
            ),
            listTilePadding: EdgeInsets.zero,
            backgroundColor: Colors.white
          ),
          flagsButtonPadding: EdgeInsets.only(left: 10.h),
          dropdownIconPosition: IconPosition.trailing,
          dropdownTextStyle: Theme.of(context).textTheme.bodyMedium,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: fillColor ?? Colors.transparent,
            contentPadding:
                padding ?? EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
            hintText: hint,
            hintStyle: hintStyle ??
                textStyleBodyMedium()
                    .copyWith(color: AppColors.secondaryTextColor,),
            errorStyle: textStyleBodyMedium().copyWith(
                height: 0,
                color: errorColor ?? Colors.red),
            suffix: suffixIconWidget,
            errorMaxLines: 3,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: decoration ??
                OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.secondaryTextColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            enabledBorder: decoration ??
                OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.secondaryTextColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            disabledBorder: decoration ??
                OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.secondaryTextColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            focusedBorder: decoration ??
                OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.secondaryTextColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
