class ContactsModal {
  int _id;
  String _name;
  String _imgUrl;
  int _phone;

  ContactsModal({int id, String name, String imgUrl, int phone})
      : _id = id,
        _name = name,
        _imgUrl = imgUrl,
        _phone = phone;

  int get id => _id;
  String get name => _name;
  String get imgUrl => _imgUrl;
  int get phone => _phone;

  ContactsModal.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _name = data["name"];
    _imgUrl = data["imgUrl"];
    _phone = data["phone"];
  }

  Map<String,dynamic> toMap() => {"id": _id,"name":_name,"imgUrl":_imgUrl,"phone":_phone};
}
