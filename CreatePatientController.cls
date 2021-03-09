public class CreatePatientController {
      public Patient__c Patient {get; set;}

    public CreatePatientController() {
        Patient = new Patient__c();
    }

    // Save Patient.
    public PageReference savePatient() {
		PageReference cancel = new PageReference(ApexPages.currentPage().getHeaders().get('Referer'));
		insert Patient;
		return cancel;
    }

}