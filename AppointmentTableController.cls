public class AppointmentTableController {
    public List<Doctor__c> DoctorList {get;set;}
    public List<SelectOption> DoctorSelectOptionList {get;set;}
    public List<Patient__c> PatientList {get;set;}
    public List<SelectOption> PatientSelectOptionList {get;set;}
    public List<Appointment__c> Appt {get;set;}
    public Appointment__c Appointment {get;set;}
    public Doctor__c Doctor {get;set;}

    public AppointmentTableController () {
        PatientList = getPatientList();
        DoctorList = getDoctorList();
 	 	DoctorSelectOptionList = getDoctorSelectOptionList();
        PatientSelectOptionList = getPatientSelectOptionList();
    
        for (Doctor__c doc : DoctorList){
        	DoctorSelectOptionList.add(new SelectOption(doc.Id, doc.Name));
            // Doctor = [SELECT Working_Hours_Start__c, Working_Hours_End__c FROM Doctor__c WHERE Id = :doc.Id];
      	}
       
        for (Patient__c patient: PatientList) {
            PatientSelectOptionList.add(new SelectOption(patient.Id, patient.Name));
        }
        
        getAppointment();
   }
    
    public PageReference addNewAppt() {
        // ??????????? Need to write the method. I don't know values for the Working_Hours_Start__c and Working_Hours_End__c
        return null;
    }
    
    // Update Working Hours.
    public PageReference updateWorkingHours() {
        // ????? how to get selected item
        return null;
    }
    
    // Redirect to create a new Doctor.
    public PageReference addNewDoctor() {
    	PageReference doctorPage = new PageReference('/apex/CreateDoctor');
    	doctorPage.setRedirect(true);
		return doctorPage;
    }
    
    // Redirect to create a new Patient.
    public PageReference addNewPatient() {
    	PageReference patientPage = new PageReference('/apex/CreatePatient');
    	patientPage.setRedirect(true);
		return patientPage;
    }
    
    public List<Doctor__c> getDoctorList() {
        DoctorList = [SELECT id, Name FROM Doctor__c];
        return DoctorList;
    }
    
    public List<Patient__c> getPatientList() {
        PatientList = [SELECT id, Name FROM Patient__c];
        return PatientList;
    }
    
    public List<SelectOption> getPatientSelectOptionList() {
        PatientSelectOptionList = new List<SelectOption>();
        return PatientSelectOptionList;
    }
    
    public List<SelectOption> getDoctorSelectOptionList() {
        DoctorSelectOptionList = new List<SelectOption>();
        return DoctorSelectOptionList;
    }
  

    public void getAppointment () {
        Appt = [SELECT Doctor__c, Patient__c, Appointment_Date__c, Duration_in_minutes__c FROM Appointment__c];
    }
    
}