import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///============================= TEXT FIELD =====================================///

class TTextField extends StatelessWidget {
  const TTextField({
    super.key,
    this.hintText,
    this.controller,
    this.cursorColor,
    this.textInputType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.words,
    this.focusNode,
    this.enableBorderColor = Colors.grey,
    this.focusBorderColor,
    this.hintTextColor,
    this.autoFocus = false,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines,
  });

  final int? maxLines;
  final Color? cursorColor;
  final int? maxLength;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? hintTextColor;
  final bool autoFocus;
  final bool readOnly;
  final bool enabled;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    // final darkmode = THelperFunctions.isDarkMode(context);
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      cursorColor:cursorColor?? Colors.deepPurple,
      obscureText: obscureText,
      autofocus: autoFocus,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: enabled,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      textInputAction: TextInputAction.next,
      style: textStyle.headlineMedium?.copyWith(
          // color: TColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText??"Label",
        hintStyle: textStyle.headlineMedium?.copyWith(

            color:hintTextColor??Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.transparent, // Light Grey Background
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1.0,
          ), // Default Light Grey Border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: BorderSide(
            color: focusBorderColor ?? Colors.deepPurple,
            width: 1.0,
          ), // Primary Color on Focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: BorderSide(
            color: enableBorderColor ?? Colors.grey,
            width: 1.0,
          ), // Light Grey when not focused
        ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(9.0),
        //   borderSide: const BorderSide(
        //       color: TColors.grey, width: 1.0), // Light Grey for Disabled
        // ),
      ),
    );
  }
}

///============================= OTP TEXT FIELD =====================================///

// class TOtpField extends StatefulWidget {
//   final Function(String) onCompleted;
//   final VoidCallback resendOtpTap;
//   final TextEditingController? otpController;
//   // final String
//   const TOtpField({
//     super.key,
//     required this.onCompleted,
//     this.otpController,
//     required this.resendOtpTap,
//   });

//   @override
//   State<TOtpField> createState() => _TOtpFieldState();
// }

// class _TOtpFieldState extends State<TOtpField> {
//   int _secondsRemaining = 30; // Initial Timer 30 seconds
//   late Timer _timer;
//   bool _isResendEnabled = false;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     setState(() {
//       _secondsRemaining = 60;
//       _isResendEnabled = false;
//     });

//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsRemaining > 0) {
//         setState(() {
//           _secondsRemaining--;
//         });
//       } else {
//         _timer.cancel();
//         setState(() {
//           _isResendEnabled = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//      final darkmode = THelperFunctions.isDarkMode(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // OTP Input Field with Increased Spacing
//         Pinput(
//           length: 4,
//           controller: widget.otpController,
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(4),
//           ],
//           onCompleted: widget.onCompleted,
//           onChanged: (value) {},
//           showCursor: false,
//           separatorBuilder:
//               (index) =>
//                   const SizedBox(width: 16), // Increased spacing between boxes
//           defaultPinTheme: PinTheme(
//             width: 48, // Increased width
//             height: 54, // Increased height
//             textStyle: GoogleFonts.poppins(
//               fontSize: TSizes.fontSizeMd, // Slightly larger font
//               fontWeight: FontWeight.normal,
//               color: darkmode? TColors.textWhite:TColors.textPrimary,
//             ),
//             decoration: BoxDecoration(
//               // color: TColors.white,
//               borderRadius: BorderRadius.circular(12), // More rounded corners
//               border: Border.all(color: TColors.grey, width: 1.5),
//             ),
//           ),
//           focusedPinTheme: PinTheme(
//             width: 48, // Increased width
//             height: 54, // Increased height
//             textStyle: GoogleFonts.poppins(
//               fontSize: TSizes.fontSizeMd,
//               fontWeight: FontWeight.normal,
//               color: TColors.primary,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: TColors.primary, width: 1.8),
//               boxShadow: [
//                 BoxShadow(
//                   color: TColors.primary.withOpacity(0.2),
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 20), // Increased space below OTP field
//         // Timer and Resend OTP Button
//         _isResendEnabled
//             ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${"Didn't Recieve ?"} ",
//                   style: GoogleFonts.poppins(
//                     color:darkmode?TColors.grey: TColors.textSecondary,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     _startTimer(); // Restart Timer
//                     print("Resend OTP clicked");
//                     widget.resendOtpTap();
//                   },
//                   child: Text(
//                     "Resend", // or localize if needed
//                     style: GoogleFonts.poppins(
//                       color: TColors.accent,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//             : Text(
//               "${"Resend In"} 00:${_secondsRemaining.toString().padLeft(2, '0')}",
//               style: GoogleFonts.poppins(
//                 color: darkmode?TColors.grey:TColors.textSecondary,
//                 fontSize: 14,
//               ),
//             ),
//       ],
//     );
//   }
// }

// ///============================= PHONE TEXT FIELD =====================================///

// class TTextPhoneField extends StatefulWidget {
//   const TTextPhoneField({
//     super.key,
//     this.hintText,
//     this.controller,
//     this.textInputType,
//     this.validator,
//     this.inputFormatters,
//     this.maxLength,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.obscureText = false,
//     this.textCapitalization = TextCapitalization.none,
//     this.focusNode,
//     this.autoFocus = false,
//     this.readOnly = false,
//     this.onChanged,
//     this.onSubmitted,
//     this.enabled = true,
//     this.onCountryChanged, // ✅ Callback added for country code changes
//   });

//   final int? maxLength;
//   final String? hintText;
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final String? Function(String?)? validator;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool obscureText;
//   final bool autoFocus;
//   final bool readOnly;
//   final bool enabled;
//   final FocusNode? focusNode;
//   final TextCapitalization textCapitalization;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final Function(String)? onCountryChanged; // ✅ New callback for country code

//   @override
//   _TTextPhoneFieldState createState() => _TTextPhoneFieldState();
// }

// class _TTextPhoneFieldState extends State<TTextPhoneField> {
//   String _selectedCountryCode = "+91";

//   @override
//   Widget build(BuildContext context) {
//     final isDark = THelperFunctions.isDarkMode(context);
//     final textStyle = Theme.of(context).textTheme;

//    return FormField<PhoneNumber>(
//   validator: (value) {
//     final number = value?.number;
//     return widget.validator?.call(number);
//   },
//   builder: (FormFieldState<PhoneNumber> field) {
//     return IntlPhoneField(
//       controller: widget.controller,
//       initialCountryCode: "IN",
//       showCountryFlag: true,
//       showDropdownIcon: false,
//       disableLengthCheck: true,
//       flagsButtonPadding: const EdgeInsets.only(left: 12.0),
//       cursorColor: TColors.primary,
//       invalidNumberMessage: "",
//       keyboardType: TextInputType.phone,
//       onChanged: (phone) {
//         // Save value in FormField state
//         field.didChange(phone);

//         if (phone.countryCode != _selectedCountryCode) {
//           setState(() {
//             _selectedCountryCode = phone.countryCode;
//           });
//           widget.onCountryChanged?.call(phone.countryCode);
//         }

//         widget.onChanged?.call(phone.number);
//       },
//       inputFormatters: widget.inputFormatters ??
//           [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(10),
//           ],
//       style: textStyle.headlineMedium?.copyWith(
//         color: isDark ? TColors.textWhite : TColors.textPrimary,
//         fontSize: TSizes.fontSizeSm,
//         fontWeight: FontWeight.w500,
//       ),
//       decoration: InputDecoration(
//         hintText: widget.hintText ?? "Mobile Number",
//         errorText: field.errorText, // ✅ show validation message
//         hintStyle: textStyle.headlineMedium?.copyWith(
//           color: isDark ? TColors.textWhite : TColors.textPrimary,
//           fontSize: TSizes.fontSizeSm,
//           fontWeight: FontWeight.w500,
//         ),
//         filled: true,
//         fillColor: Colors.transparent,
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 14,
//           horizontal: 20,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(9.0),
//           borderSide: const BorderSide(color: TColors.grey, width: 1.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(9.0),
//           borderSide: BorderSide(color: TColors.primary, width: 1.2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(9.0),
//           borderSide: const BorderSide(color: TColors.grey, width: 1.0),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(9.0),
//           borderSide: const BorderSide(color: TColors.grey, width: 1.0),
//         ),
//       ),
//     );
//   },
// );
//  }
// }
