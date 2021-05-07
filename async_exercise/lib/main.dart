import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
//await modifier  String task2result bildirimine veri için bekleyeceksin diyor.
//Başka bir deyişle de tas2() bir future dönüşlü metod onu beklemen (await)lazım :D
  task3(task2result);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 complete');
}

//metodun dönüşü 3 saniye sonra olacağından gelecekten bir string dönecektir.
//<String> yazılmasa da olur
//metod içindeki await çalışması için async modifierini ekliyoruz.
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result;
//aşağıdaki fonksiyon çalışıp bitene kadar bekle (await)
//eğer await olmazsa gene task3() gene null alır.
  await Future.delayed(threeSeconds, () {
    result = 'Task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'Task 3 data';
  print('Task 3 complete with $task2Data');
}
