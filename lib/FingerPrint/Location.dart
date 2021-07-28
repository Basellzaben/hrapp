class Location1
{
  String LAT="";
  String LANG="";
  String Distination="";

  Location1(this.LAT, this.LANG, this.Distination);

  Location1.fromJson(Map<String, dynamic> json) {
    LAT = json['LAT'];
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