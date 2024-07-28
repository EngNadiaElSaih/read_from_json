class Item {
  final int id;
  final String name;
  final int value;

  Item({required this.id, required this.name, required this.value});

  factory Item.fromJson(Map<String, dynamic> data) {
    return Item(
      id: data['id'],
      name: data['name'],
      value: data['value'],
    );
  }
}

//لماذا  لا يعمل ؟ على الرغم من استخدامه عده مرت فى المستوى الاول
// class Item {
//   final int id;
//   final String name;
//   final int value;

//   Item({required this.id, required this.name, required this.value});

//    Item.fromJson(Map<String, dynamic> data) {
   
//       id = data['id'];
//       name = data['name'];
//       value = data['value'];
  
//   }

// }



