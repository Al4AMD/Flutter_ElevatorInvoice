// ignore_for_file: file_names, camel_case_types
// ignore_for_file: UpperCamelCase_identifier
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoice_app/view/UI/createInvoice.dart';
import 'package:invoice_app/view/UI/invoiceList.dart';
import 'package:invoice_app/view/UI/invoiveCard.dart';
import 'package:invoice_app/view/common/exports.dart';

class mainPage extends StatefulWidget {
  mainPage({super.key, required this.invoice});

  List<Invoice> invoice;

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> with TickerProviderStateMixin {
  void _refreshInvoiceList() {
    setState(() {
      widget.invoice = Hive.box<Invoice>('invoice').values.toList();
    });
  }

  late AnimationController _titleAnimationController;
  late AnimationController _logoAnimationCOntroller;
  late AnimationController _buttonAnimationController;
  late AnimationController _dividerAnimationController;
  late AnimationController _listAnimationController;
  late Animation<double> _titleOpacity;
  late Animation<double> _logoOpacity;
  late Animation<double> _buttonOpacity;
  late Animation<double> _dividerOpacity;
  late Animation<double> _listOpacity;

  @override
  void initState() {
    super.initState();
    _titleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _logoAnimationCOntroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _buttonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _dividerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _listAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _titleOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_titleAnimationController);
    _logoOpacity =
        Tween<double>(begin: 0.0, end: 1.5).animate(_logoAnimationCOntroller);
    _buttonOpacity =
        Tween<double>(begin: 0.0, end: 2.0).animate(_buttonAnimationController);
    _dividerOpacity = Tween<double>(begin: 0.0, end: 2.5)
        .animate(_dividerAnimationController);
    _listOpacity =
        Tween<double>(begin: 0.0, end: 2.5).animate(_listAnimationController);

    _titleAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _logoAnimationCOntroller.forward();
      Future.delayed(const Duration(milliseconds: 1000), () {
        _buttonAnimationController.forward();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _dividerAnimationController.forward();
          Future.delayed(const Duration(milliseconds: 1000), () {
            _listAnimationController.forward();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _logoAnimationCOntroller.dispose();
    _buttonAnimationController.dispose();
    _dividerAnimationController.dispose();
    _listAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FadeTransition(
            opacity: _titleOpacity,
            alwaysIncludeSemantics: true,
            child: ReusableText(
              text: "نرم افزار ساخت فاکتور",
              style: appstyle(18, Colors.white, FontWeight.w500),
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo.shade700,
        ),
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: hieght * 0.05),
                  FadeTransition(
                    opacity: _logoOpacity,
                    alwaysIncludeSemantics: true,
                    child: Image.asset(
                      'assets/img/logoBlack.png',
                      width: 300,
                    ),
                  ),
                  SizedBox(height: hieght * 0.08),
                  FadeTransition(
                    opacity: _buttonOpacity,
                    alwaysIncludeSemantics: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                                const Duration(milliseconds: 500),
                                () => Get.to(
                                    () => InvoiceList(
                                        invoiceList: widget.invoice),
                                    transition: Transition.fadeIn,
                                    duration:
                                        const Duration(milliseconds: 1000)));
                          },
                          child: Container(
                              height: 100,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(18.0)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(MaterialCommunityIcons.list_status,
                                      size: 35, color: Colors.blue),
                                  ReusableText(
                                      text: "لیست فاکتورها",
                                      style: appstyle(
                                          18, Colors.blue, FontWeight.w500)),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                                const Duration(milliseconds: 500),
                                () => Get.to(() => const CreateInvoice(),
                                    transition: Transition.fadeIn,
                                    duration:
                                        const Duration(milliseconds: 1000)));
                          },
                          child: Container(
                              height: 100,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.indigo.shade50,
                                  borderRadius: BorderRadius.circular(18.0)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                      MaterialCommunityIcons.playlist_plus,
                                      size: 35,
                                      color: Colors.indigo),
                                  ReusableText(
                                      text: "ساخت فاکتور",
                                      style: appstyle(
                                          18, Colors.indigo, FontWeight.w500)),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: hieght * 0.09),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FadeTransition(
                        opacity: _dividerOpacity,
                        alwaysIncludeSemantics: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var invoiceBox =
                                    await Hive.openBox<Invoice>('invoice');
                                var invoiceList = invoiceBox.values.toList();
                                Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () => Get.to(
                                        () => InvoiceList(
                                            invoiceList: invoiceList),
                                        transition: Transition.fadeIn,
                                        duration: const Duration(
                                            milliseconds: 1000)));
                              },
                              child: ReusableText(
                                  text: "مشاهده همه",
                                  style: appstyle(13, Colors.indigoAccent,
                                      FontWeight.w500)),
                            ),
                            ReusableText(
                                text: "فاکتور های اخیر",
                                style: appstyle(
                                    16, Colors.black87, FontWeight.w600)),
                          ],
                        ),
                      )),
                  FadeTransition(
                    opacity: _dividerOpacity,
                    alwaysIncludeSemantics: true,
                    child: const Divider(
                      color: Colors.blueGrey,
                      thickness: 2.0,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  FadeTransition(
                      opacity: _listOpacity,
                      alwaysIncludeSemantics: true,
                      child: widget.invoice.isEmpty
                          ? Center(
                              child: ReusableText(
                                  text: "موردی برای نمایش وجود ندارد!",
                                  style: appstyle(
                                      16, Colors.black, FontWeight.w600)))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.invoice.length >= 5
                                  ? 5
                                  : widget.invoice.length,
                              itemBuilder: (context, index) {
                                final originalIndex = widget.invoice.length >= 5
                                    ? widget.invoice.length - 5 + index
                                    : widget.invoice.length - index - 1;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: InvoiceCard(
                                    name: widget.invoice[originalIndex].name,
                                    sex: widget.invoice[originalIndex].sex,
                                    date: widget.invoice[originalIndex].date,
                                    index: originalIndex,
                                    onDelete: _refreshInvoiceList,
                                  ),
                                );
                              })),
                  const SizedBox(height: 30)
                ],
              ),
            )));
  }
}
