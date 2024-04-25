import 'package:invoice_app/view/common/exports.dart';

class CustomSwitch extends Switch {
  CustomSwitch(
      {super.key, required Function(bool) onChange, required bool defaultValue})
      : super(
          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const Icon(Icons.check, color: Colors.white);
              }
              return const Icon(Icons.close, color: Colors.white);
            },
          ),
          activeColor: Colors.lightBlue,
          inactiveThumbColor: Colors.red,
          inactiveTrackColor: Colors.red.shade100,
          value: defaultValue,
          onChanged: onChange,
        );
}
