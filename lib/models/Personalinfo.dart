class Personalinfo {

   String EmployeeDisplayName="";
   String JobTitle="";
   String EmployeeDepartmentDescription="";
   String EmployeeSectionDescription="";
   String ManagerName="";
   String Education_Desc="";
   String AttStatus="";
   String YearsOfExp="";
   String Email="";

  Personalinfo(this.EmployeeDisplayName, this.JobTitle, this.EmployeeDepartmentDescription, this.EmployeeSectionDescription
      ,this.ManagerName, this.Education_Desc, this.AttStatus  , this.YearsOfExp  , this.Email);


  Personalinfo.fromJson(Map<String, dynamic> json) {
    EmployeeDisplayName = json['EmployeeDisplayName'];
    JobTitle = json['JobTitle'];
    EmployeeDepartmentDescription = json['EmployeeDepartmentDescription'];
    EmployeeSectionDescription = json['EmployeeSectionDescription'];
    ManagerName = json['ManagerName'];
    Education_Desc = json['Education_Desc'];
    AttStatus = json['AttStatus'];
    YearsOfExp = json['YearsOfExp'];
    Email = json['Email'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeDepartmentDescription'] = this.EmployeeDepartmentDescription;
    data['JobTitle'] = this.JobTitle;
    data['EmployeeDepartmentDescription'] = this.EmployeeDepartmentDescription;
    data['EmployeeSectionDescription'] = this.EmployeeSectionDescription;
    data['ManagerName'] = this.ManagerName;
    data['Education_Desc'] = this.Education_Desc;
    data['AttStatus'] = this.AttStatus;
    data['YearsOfExp'] = this.YearsOfExp;
    data['Email'] = this.Email;
    return data;
  }}