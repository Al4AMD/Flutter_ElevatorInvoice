import 'package:flutter/rendering.dart';
import 'package:invoice_app/view/UI/invoiveCard.dart';
import 'package:invoice_app/view/common/app_style.dart';
import 'package:invoice_app/view/common/exports.dart';
import 'package:hive/hive.dart';

import 'mainPage.dart';

class InvoiceList extends StatefulWidget {
  InvoiceList({super.key, required this.invoiceList});

  late List<Invoice> invoiceList;

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  void _refreshInvoiceList() {
    setState(() {
      widget.invoiceList = Hive.box<Invoice>('invoice').values.toList();
    });
  }

  Future<void> _navigateToHome() async {
    final invoiceBox = await Hive.openBox<Invoice>('invoice');
    final invoice = invoiceBox.values.toList();
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.offAll(() => mainPage(invoice: widget.invoiceList),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 1000)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.indigo, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: _navigateToHome,
                  child: const Icon(
                    MaterialCommunityIcons.arrow_left_bold,
                    color: Colors.white,
                  )),
              ReusableText(
                  text: "لیست فاکتورها",
                  style: appstyle(18, Colors.white, FontWeight.w600)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "لیست فاکتورها",
                      style: appstyle(20, Colors.black87, FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                thickness: 2,
                color: Colors.black38,
                height: 4.0,
              ),
              const SizedBox(height: 10),
              widget.invoiceList.isEmpty
                  ? ReusableText(
                      text: "موردی برای نمایش وجود ندارد!",
                      style: appstyle(18, Colors.black, FontWeight.w500))
                  : GestureDetector(
                      onTap: null,
                      child: ListView.builder(
                        itemCount: widget.invoiceList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: InvoiceCard(
                                name: widget.invoiceList[index].name,
                                sex: widget.invoiceList[index].sex,
                                index: index,
                                onDelete: _refreshInvoiceList,
                                date: widget.invoiceList[index].date),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
