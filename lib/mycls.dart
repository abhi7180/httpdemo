class mycls {
  String? id;
  String? name;
  String? contact;

  mycls({this.id, this.name, this.contact});

  mycls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    return data;
  }
}
