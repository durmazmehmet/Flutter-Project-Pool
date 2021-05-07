import 'package:flutter/material.dart';
import 'package:autosizeproject/SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // METODU BURARADA KULLANMAK AŞAĞIDAKİ HATAYA VESİLE OLUYOR
    // MediaQuery.of() called with a context that does not contain a MediaQuery.
    // SizeConfig().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: TextScalePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//TODO: Sınıf CTOR örneği
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  //TODO: State oluştur (xcodedaki bişeye denk geliyordu unuttum ismini
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //TODO: SizeConfig sınıfına ait init metodunu context altında çağırmak
    //TODO: gerekiyor. Ancak materialapp dışı çağırma hata ile sonuçlanıyor
    SizeConfig().init(context);
    //TODO: Aşağıdaki not setState her çağrıldığında bu widgetin yeniden
    //TODO: oluşturulduğunu anlatıyor
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig(h: 25).height,
          width: SizeConfig(w: 55).width,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TextScalePage extends StatefulWidget {
  @override
  _TextScalePageState createState() => _TextScalePageState();
}

class _TextScalePageState extends State<TextScalePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text(
          "DENEME",
          style: TextStyle(fontSize: SizeConfig(w: 10).width),
        ),
      ),
    );
  }
}
