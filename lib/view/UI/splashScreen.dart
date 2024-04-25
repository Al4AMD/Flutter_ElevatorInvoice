// ignore_for_file: file_names
import 'package:invoice_app/view/UI/mainPage.dart';
import 'package:invoice_app/view/common/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _textAnimationController;
  late AnimationController _loaderAnimationController;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<double> _loaderOpacity;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _textAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _loaderAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _logoOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_logoAnimationController);
    _textOpacity =
        Tween<double>(begin: 0.0, end: 1.5).animate(_textAnimationController);
    _loaderOpacity =
        Tween<double>(begin: 0.0, end: 2.0).animate(_loaderAnimationController);

    _logoAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 1500), () {
      _textAnimationController.forward();
      Future.delayed(const Duration(milliseconds: 2000), () {
        _loaderAnimationController.forward();
      });
    });

    Future.delayed(const Duration(milliseconds: 6000), () async {
      var invoiceBox = await Hive.openBox<Invoice>('invoice');
      var invoiceList = invoiceBox.values.toList();
      Future.delayed(
          const Duration(milliseconds: 1000),
          () => Get.offAll(() => mainPage(invoice: invoiceList),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 2000)));
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _textAnimationController.dispose();
    _loaderAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff2e0000), Color(0xff020d26)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                    opacity: _logoOpacity,
                    alwaysIncludeSemantics: true,
                    child: Image.asset('assets/img/logoColor.png',
                        width: 350)),
                const SizedBox(height: 50),
                FadeTransition(
                  opacity: _textOpacity,
                  alwaysIncludeSemantics: true,
                  child: ReusableText(
                      text: "لطفا منتظر بمانید",
                      style: appstyle(22, Colors.white, FontWeight.w700)),
                ),
                const SizedBox(height: 50),
                FadeTransition(
                  opacity: _loaderOpacity,
                  alwaysIncludeSemantics: true,
                  child: const CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Colors.white,
                    color: Colors.indigoAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
