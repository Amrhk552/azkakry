import 'package:hive/hive.dart';

class tododatabase {
  List todo = [];

  List counters = [];
  List azkar = [];


  final _mybox = Hive.box('mybox');
  final mycountbox = Hive.box('countBox');

  void createdata() {
    todo = [
      ['make a task', false],
      ['read Quran', false]
    ];
  }

  void createazkar() {
    // List<Map<String, dynamic>> azkar = [
    //   {'content': 'الحمد لله رب العالمين', 'amount': 30, "counter": 0},
    //   {'content': 'الحمد لله رب العالمين', 'amount': 25, "counter": 0},
    //   {'content': 'الحمد لله رب العالمين', 'amount': 40, "counter": 0},
    // ];
    azkar = [
      [
        'أهلا بك في جنة الأذكار',
        ' اسحب إلى اليسار  حتى تظهر لك الأذكار',
      ],
      [
        'اللهم صل على نبينا محمد وعلى آله وصحبه وسلم',
        ' عشر مرات',
      ],
      [
        'سبحان الله و بحمده',
        'مئة مرة',
      ],
      [
        ' لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيئ قدير',
        'مئة مرة',
      ],
      [
        'سبحان الله وبحمده سبحان الله العظيم',
        'كلمتان عظيمتان في الميزان',
      ],
      [
        'لا إله إلا أنت سبحانك إني كنت من الظالمين',
        '',
      ],
      ['ربي اغفر لي وتب عليَّ إنك أنت التواب الغفور', 'مئة مرة'],
      [
        'استغفر الله العظيم وأتوب إليه',
        ' مئة مرة ',
      ],
      ['اللهم إنك عفو تحب العفو فاعف عني', ''],
      [
        'حسبي الله  لا إله إلا هو عليه توكلت وهو رب العرش العظيم',
        '',
      ],
    ];
    counters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  }

  void loadcount() {
    counters = _mybox.get('COUNT');
  }

  void loaddata() {
    todo = _mybox.get('TODO');
  }

  void loadazkar() {
    azkar = _mybox.get('AZKAR');
  }

  void updatedata() {
    _mybox.put('TODO', todo);
  }

  void updateazkar() {
    _mybox.put('AZKAR', azkar);
  }

  void updateCount() {
    _mybox.put('COUNT', counters);
    print(counters);
  }
}
