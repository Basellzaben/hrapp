class WorkState {

  String EmployeeDisplayName="";
  String JobTitle="";


  WorkState(this.EmployeeDisplayName, this.JobTitle);


  WorkState.fromJson(Map<String, dynamic> json) {
    EmployeeDisplayName = json['Id'];
    JobTitle = json['County'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JobTitle'] = this.JobTitle;
    data['JobTitle'] = this.JobTitle;

    return data;
  }}