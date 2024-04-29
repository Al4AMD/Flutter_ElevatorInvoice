import 'package:invoice_app/view/common/customSwitch.dart';
import 'package:invoice_app/view/common/exports.dart';

import 'mainPage.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  late String subNumber; //شماره اشتراک
  late String sex = 'آقا'; //جنسیت
  late String name; //نام مدیر ساختمان
  late String date; //تاریخ
  late String repairName; //نام سرویس کار
  late bool fixPieces = false; //آچارکشی قطعات و متعلقات
  late bool floorCondition = false; //هم سطحی طبقات
  late bool oilRails = false; //روغنکاری ریل ها
  late bool doorCondition = false; //کنترل وضعیت درها
  late bool engineGearCheck = false; //کنترل وضعیت موتور و گیربکس
  late bool parachoutTest = false; //تست پاراشوت
  late bool controlBanner = false; //وضعیت تابلو فرمان
  late bool boxelCheck = false; //کنترل سیم بکسل
  late bool cabinCondition = false; //کنترل وضعیت کابین رنگ و تهویه
  late String description = ""; // توضیحات
  late BigInt monthlyCharge; //شارژ ماهیانه
  late BigInt piecesTotal; // مبلغ کل خرید قطعات
  late BigInt pieceChangeTotal; //اجرت تعویض قطعات
  late BigInt remainingDebt; //بدهی قبلی
  late BigInt totalPayment; //مبلغ پرداختی
  late BigInt totalRemain; //مانده حساب

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check, color: Colors.white);
      }
      return const Icon(Icons.close, color: Colors.white);
    },
  );

  Future<void> _writeInDatabse() async {
    final invoiceBox = await Hive.openBox<Invoice>('invoice');
    debugPrint("\n\nHive Box $invoiceBox opened successfully\n\n");
    final invoice = Invoice(
        subNumber: subNumber,
        sex: sex,
        name: name,
        date: date,
        repairName: repairName,
        fixPieces: fixPieces,
        floorCondition: floorCondition,
        oilRails: oilRails,
        doorCondition: doorCondition,
        engineGearCheck: engineGearCheck,
        parachoutTest: parachoutTest,
        controlBanner: controlBanner,
        boxelCheck: boxelCheck,
        cabinCondition: cabinCondition,
        description: description,
        monthlyCharge: monthlyCharge,
        piecesTotal: piecesTotal,
        pieceChangeTotal: pieceChangeTotal,
        remainingDebt: remainingDebt,
        totalPayment: totalPayment,
        totalRemain: totalRemain);
    try {
      await invoiceBox.add(invoice);
      debugPrint("\n\nForm Adeed to Hive succesfully\n\n");
      final snackbar = CustomSnackBar(
        backgroundColor: Colors.lightGreen,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        mainAlignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
        duration: const Duration(milliseconds: 2000),
        widgets: [
          ReusableText(
              text: "فاکتور با شماره اشتراک $subNumber با موفقیت ایجاد شد",
              style: appstyle(16, Colors.white, FontWeight.w600))
        ],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _navigateToHome();
    } catch (e) {
      debugPrint("\n\nForm ading failed $e\n\n");
      final snackbar = CustomSnackBar(
        backgroundColor: Colors.red,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        mainAlignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
        duration: const Duration(milliseconds: 2000),
        widgets: [
          ReusableText(
              text: "قبت فاکتور ناموفق بود\n$e",
              style: appstyle(16, Colors.white, FontWeight.w600))
        ],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  Future<void> _navigateToHome() async {
    final invoiceBox = await Hive.openBox<Invoice>('invoice');
    final invoice = invoiceBox.values.toList();
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.offAll(() => mainPage(invoice: invoice),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 1000)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff0f0c29),
            Color(0xff302b63),
            Color(0xff24243e)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: _navigateToHome,
                  child: const Icon(
                    MaterialCommunityIcons.arrow_left_bold,
                    color: Colors.white,
                  )),
              ReusableText(
                  text: "اضافه کردن فاکتور",
                  style: appstyle(18, Colors.white, FontWeight.w600)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.055, vertical: hieght * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "فرم اضافه کردن فاکتور",
                      style: appstyle(20, Colors.black87, FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "مشخصات فردی",
                      style: appstyle(15, Colors.black87, FontWeight.w500)),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  const Icon(
                    MaterialCommunityIcons.account,
                    size: 20,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Divider(
                color: Colors.deepPurple,
                thickness: 1.8,
                height: 4.0,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                label: "شماره اشتراک",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "شماره اشتراک",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.subtitles),
                onChanged: (value) => setState(() => subNumber = value),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.white70,
                width: double.infinity,
                height: 60,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButton<String>(
                    style: appstyle(16, Colors.black87, FontWeight.w500),
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    focusColor: Colors.blueAccent,
                    // hint: ReusableText(
                    //     text: "جنسیت",
                    //     style: appstyle(14, Colors.black, FontWeight.w500)),
                    icon: Icon(
                      sex == 'آقا'
                          ? MaterialCommunityIcons.gender_male
                          : MaterialCommunityIcons.gender_female,
                      size: 25,
                    ),
                    value: sex,
                    onChanged: (String? newValue) {
                      setState(() {
                        sex = newValue.toString();
                      });
                    },
                    items: <String>['خانم', 'آقا']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "نام مدیرساختمان",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "نام مدیرساختمان",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(MaterialCommunityIcons.account),
                onChanged: (value) => setState(() {
                  name = value;
                }),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "تاریخ",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "تاریخ",
                keyboardType: TextInputType.datetime,
                prefixIcon: const Icon(MaterialCommunityIcons.calendar),
                onChanged: (value) => setState(() {
                  date = value;
                }),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "نام سرویس کار",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "نام سرویس کار",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(MaterialCommunityIcons.account),
                onChanged: (value) => setState(() {
                  repairName = value;
                }),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "سرویس های انجام شده",
                      style: appstyle(15, Colors.black87, FontWeight.w500)),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  const Icon(
                    MaterialCommunityIcons.hammer,
                    size: 20,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Divider(
                color: Colors.deepPurple,
                thickness: 1.8,
                height: 4.0,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "آچارکشی قطعات و متعلقات",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: fixPieces,
                        onChange: (value) => setState(() {
                              fixPieces = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "هم سطحی طبقات",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: floorCondition,
                        onChange: (value) => setState(() {
                              floorCondition = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "روغنکاری ریل ها",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: oilRails,
                        onChange: (value) => setState(() {
                              oilRails = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "کنترل وضعیت درب ها",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: doorCondition,
                        onChange: (value) => setState(() {
                              doorCondition = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "کنترل وضعیت موتور و گیربکس",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: engineGearCheck,
                        onChange: (value) => setState(() {
                              engineGearCheck = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "تست پاراشوت",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: parachoutTest,
                        onChange: (value) => setState(() {
                              parachoutTest = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "وضعیت تابلوفرمان",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: controlBanner,
                        onChange: (value) => setState(() {
                              controlBanner = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "بررسی سیم بکسل",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: boxelCheck,
                        onChange: (value) => setState(() {
                              boxelCheck = value;
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                        text: "کنترل وضعیت کابین رنگ و تهویه",
                        style: appstyle(17, Colors.black87, FontWeight.w500)),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    CustomSwitch(
                        defaultValue: cabinCondition,
                        onChange: (value) => setState(() {
                              cabinCondition = value;
                            })),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "توضیحات ارائه شده",
                      style: appstyle(15, Colors.black87, FontWeight.w500)),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  const Icon(
                    MaterialCommunityIcons.pencil_box,
                    size: 20,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Divider(
                color: Colors.deepPurple,
                thickness: 1.8,
                height: 4.0,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "توضیحات",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "توضیحات",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.note_add_outlined),
                onChanged: (value) => setState(() => description = value),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "پرداخت های انجام شده(تومان)",
                      style: appstyle(15, Colors.black87, FontWeight.w500)),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  const Icon(
                    MaterialCommunityIcons.currency_usd,
                    size: 20,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Divider(
                color: Colors.deepPurple,
                thickness: 1.8,
                height: 4.0,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                label: "شارژ ماهیانه(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "شارژ ماهیانه(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => monthlyCharge = BigInt.parse(value)),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "مبلغ کل خرید قطعات(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "مبلغ کل خرید قطعات(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => piecesTotal = BigInt.parse(value)),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "اجرت تعویض قطعات(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "اجرت تعویض قطعات(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => pieceChangeTotal = BigInt.parse(value)),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "بدهی قبلی(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "بدهی قبلی(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => remainingDebt = BigInt.parse(value)),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "مبلغ پرداختی(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "مبلغ پرداختی(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => totalPayment = BigInt.parse(value)),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "مانده حساب(تومان)",
                labelStyle: appstyle(17, Colors.black87, FontWeight.w500),
                hintText: "مانده حساب(تومان)",
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(MaterialCommunityIcons.currency_usd),
                onChanged: (value) =>
                    setState(() => totalRemain = BigInt.parse(value)),
              ),
              const SizedBox(height: 50),
              CustomOutlineBtn(
                  onTap: _writeInDatabse,
                  width: width * 0.7,
                  hieght: hieght * 0.075,
                  text: "ایجاد فیش",
                  btnColor: const [
                    Colors.indigo,
                    Colors.blueAccent,
                  ]),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
