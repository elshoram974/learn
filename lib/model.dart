class MyModelName {
  int id;
  String name;
  String? note;
  DateTime? dateTime;
  bool isSelected = false;

  MyModelName({
    required this.id,
    required this.name,
    this.note,
    this.dateTime,
  }) {
    dateTime ??= DateTime.now();
  }

  static List<MyModelName> list = [
    MyModelName(id: 0, name: "0", note: "note0", dateTime: DateTime(2019)),
    MyModelName(id: 1, name: "1", note: "note1"),
    MyModelName(id: 2, name: "2", note: "note2", dateTime: DateTime(2023)),
    MyModelName(id: 3, name: "3", note: "note3"),
    MyModelName(id: 4, name: "4", note: "note4", dateTime: DateTime(2024)),
    MyModelName(id: 5, name: "5", note: "note5", dateTime: DateTime(2020)),
    MyModelName(id: 6, name: "6", note: "note6", dateTime: DateTime(2015)),
    MyModelName(id: 7, name: "7", note: "note7", dateTime: DateTime(2011)),
    MyModelName(id: 8, name: "8", note: "note8", dateTime: DateTime(2010)),
    MyModelName(id: 9, name: "9", note: "note9", dateTime: DateTime(1995)),
  ];
}
