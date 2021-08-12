class Location
{
  String LAT="0.0";
  String LANG="0.0";
  String Distination="20";

  Location(this.LAT, this.LANG, this.Distination);

  Location.fromJson(Map<String, dynamic> json) {
    LAT =  json['LAT'];
    LANG = json['LANG'];
    Distination = json['Distination'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LAT'] = this.LAT;
    data['LANG'] = this.LANG;
    data['Distination'] = this.Distination;
    return data;
  }
}