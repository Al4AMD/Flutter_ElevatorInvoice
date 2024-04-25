// ignore_for_file: file_names
import 'package:invoice_app/view/common/exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.borderColor,
      this.onChanged,
      this.bgColor,
      this.prefixIcon,
      required this.label,
      required this.labelStyle});

  final String hintText;
  final String label;
  final TextStyle labelStyle;
  final Color? bgColor;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textDirection: TextDirection.rtl,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: false,
          decoration: InputDecoration(
              label: ReusableText(text: label, style: labelStyle),
              hintText: hintText,
              fillColor: bgColor,
              hintStyle: appstyle(15, Colors.grey, FontWeight.w500),
              hintTextDirection: TextDirection.rtl,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(color: Colors.red, width: 2.5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      BorderSide(color: Colors.indigo.shade200, width: 2.5)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(
                      color: Colors.deepOrangeAccent, width: 2.5))),
          cursorHeight: 20,
          style: appstyle(15, Colors.black87, FontWeight.w400),
        ),
      ),
    );
  }
}
