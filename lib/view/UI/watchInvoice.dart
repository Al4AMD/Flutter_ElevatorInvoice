import 'package:invoice_app/view/UI/invoicePrint.dart';
import 'package:invoice_app/view/common/exports.dart';

class WatchInvoice extends StatelessWidget {
  const WatchInvoice({super.key, required this.invoice});

  final Invoice? invoice;

  @override
  Widget build(BuildContext context) {
    Widget? containerCheck = Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(5)),
    );
    Widget? containerUncheck = Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.teal,
            Colors.lightBlueAccent,
            Colors.indigo
          ])),
        ),
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    MaterialCommunityIcons.arrow_left_bold,
                    color: Colors.white,
                  )),
              ReusableText(
                  text: "مشاهده فاکتور",
                  style: appstyle(18, Colors.white, FontWeight.w600)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.blueGrey,
                    width: 1.5),
                textDirection: TextDirection.rtl,
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "شماره اشتراک",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "تاریخ",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.subNumber}",
                                style: appstyle(
                                    17, Colors.black, FontWeight.w600)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.date}",
                                style: appstyle(
                                    17, Colors.black, FontWeight.w600)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "مدیر ساختمان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "سرویس کار",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.name}",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.repairName}",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "آچارکشی قطعات و متعلقات",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "هم سطحی طبقات",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.fixPieces == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.floorCondition == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "روغن کاری ریل ها",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "کنترل وضعیت دربها",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.oilRails == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.floorCondition == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "کنترل موتور و گیربکس",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "تست پاراشوت",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.engineGearCheck == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.parachoutTest == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "وضعیت تابلو فرمان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "کنترل سیم بکسل",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.controlBanner == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.boxelCheck == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "وضعیت کابین رنگ و تهویه",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "توضیحات",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                              child: invoice?.cabinCondition == true
                                  ? const Icon(
                                      MaterialCommunityIcons
                                          .checkbox_marked_circle_outline,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      MaterialCommunityIcons.bookmark_remove,
                                      color: Colors.red,
                                      size: 30)),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.description}",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "شارژ ماهانه",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "مبلغ خرید قطعات",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.monthlyCharge} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.piecesTotal} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "اجرت تعویض قطعات",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "بدهی قبلی",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.pieceChangeTotal} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.remainingDebt} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "مبلغ پرداختی",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 70,
                          child: Center(
                            child: ReusableText(
                                text: "مبلغ باقی مانده",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: <Widget>[
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.totalPayment} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                        TableCell(
                            child: SizedBox(
                          height: 60,
                          child: Center(
                            child: ReusableText(
                                text: "${invoice?.remainingDebt} تومان",
                                style: appstyle(
                                    18, Colors.black, FontWeight.bold)),
                          ),
                        )),
                      ]),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomOutlineBtn(
                width: width * 0.65,
                hieght: hieght * 0.08,
                text: "ساخت پی دی اف",
                btnColor: const [Colors.blueAccent, Colors.deepPurpleAccent],
                onTap: () => Future.delayed(
                    const Duration(milliseconds: 500),
                    () => Get.to(
                        () => InvoicePrint(
                              invoice: invoice,
                            ),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 1000))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
