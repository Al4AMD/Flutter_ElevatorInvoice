import 'package:invoice_app/view/UI/watchInvoice.dart';
import 'package:invoice_app/view/common/app_style.dart';
import 'package:invoice_app/view/common/exports.dart';

class InvoiceCard extends StatelessWidget {
  Future<void> _deleteInvoice() async {
    final invoiceBox = await Hive.openBox<Invoice>('invoice');
    try {
      final prevLength = invoiceBox.length;
      if (prevLength == 1) {
        await invoiceBox.delete(index);
        await invoiceBox.clear();
        onDelete();
      } else {
        await invoiceBox.delete(index);
        onDelete();
      }
    } catch (e) {
      debugPrint("\n\nError deleting --> $e --> invoice with key $index");
    }
  }

  Future<void> _watchInvoice() async {
    final invoiceBox = await Hive.openBox<Invoice>('invoice');
    try {
      var invoice = invoiceBox.get(index);
      Future.delayed(
          const Duration(milliseconds: 500),
          () => Get.to(
              () => WatchInvoice(
                    invoice: invoice,
                  ),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 1000)));
    } catch (e) {
      debugPrint("\n\nError: $e");
    }
  }

  const InvoiceCard(
      {super.key,
      required this.name,
      required this.sex,
      required this.index,
      required this.onDelete,
      required this.date});

  final String name;
  final String sex;
  final int index;
  final String date;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: hieght * 0.150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade200, Colors.deepPurple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: _watchInvoice,
                      child: const Icon(
                        MaterialCommunityIcons.eye,
                        size: 25,
                        color: Colors.white,
                      )),
                  GestureDetector(
                      onTap: _deleteInvoice,
                      child: const Icon(
                        MaterialCommunityIcons.trash_can,
                        size: 25,
                        color: Colors.white,
                      ))
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableText(
                            text: "فاکتور شماره ${index + 1}",
                            style: appstyle(18, Colors.white, FontWeight.w700)),
                        const SizedBox(height: 10),
                        ReusableText(
                            text: "$sex $name",
                            style: appstyle(
                                16, Colors.deepPurple, FontWeight.w600)),
                        const SizedBox(height: 10),
                        ReusableText(
                            text: "تاریخ: $date",
                            style: appstyle(
                                14, Colors.deepPurpleAccent, FontWeight.w600)),
                      ]),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/img/image.png'),
                    radius: 55.0,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
