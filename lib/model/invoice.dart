import 'package:hive/hive.dart';
import 'package:invoice_app/view/common/exports.dart';

part 'invoice.g.dart';

@HiveType(typeId: 0)
class Invoice extends HiveObject {
  Invoice({
    required this.subNumber,
    required this.sex,
    required this.name,
    required this.date,
    required this.repairName,
    required this.fixPieces,
    required this.floorCondition,
    required this.oilRails,
    required this.doorCondition,
    required this.engineGearCheck,
    required this.parachoutTest,
    required this.controlBanner,
    required this.boxelCheck,
    required this.cabinCondition,
    required this.description,
    required this.monthlyCharge,
    required this.piecesTotal,
    required this.pieceChangeTotal,
    required this.remainingDebt,
    required this.totalPayment,
    required this.totalRemain,
  });

  @HiveField(0)
  String subNumber; //شماره اشتراک
  @HiveField(1)
  String sex; //جنسیت
  @HiveField(2)
  String name; //نام مدیر ساختمان
  @HiveField(3)
  String date; //تاریخ
  @HiveField(4)
  String repairName; //نام سرویس کار
  @HiveField(5)
  bool fixPieces; //آچارکشی قطعات و متعلقات
  @HiveField(6)
  bool floorCondition; //هم سطحی طبقات
  @HiveField(7)
  bool oilRails; //روغنکاری ریل ها
  @HiveField(8)
  bool doorCondition; //کنترل وضعیت درها
  @HiveField(9)
  bool engineGearCheck; //کنترل وضعیت موتور و گیربکس
  @HiveField(10)
  bool parachoutTest; //تست پاراشوت
  @HiveField(11)
  bool controlBanner; //وضعیت تابلو فرمان
  @HiveField(12)
  bool boxelCheck; //کنترل سیم بکسل
  @HiveField(13)
  bool cabinCondition; //کنترل وضعیت کابین رنگ و تهویه
  @HiveField(14)
  String description; // توضیحات
  @HiveField(15)
  BigInt monthlyCharge; //شارژ ماهیانه
  @HiveField(16)
  BigInt piecesTotal; // مبلغ کل خرید قطعات
  @HiveField(17)
  BigInt pieceChangeTotal; //اجرت تعویض قطعات
  @HiveField(18)
  BigInt remainingDebt; //بدهی قبلی
  @HiveField(19)
  BigInt totalPayment; //مبلغ پرداختی
  @HiveField(20)
  BigInt totalRemain; //مانده حساب
}
