public class CreateDoctorController {
    public Doctor__c Doctor {get; set;}

    public CreateDoctorController() {
        Doctor = new Doctor__c();
    }

    // Save Doctor.
    public PageReference saveDoctor() {
		PageReference cancel = new PageReference(ApexPages.currentPage().getHeaders().get('Referer'));
		insert Doctor;
		return cancel;
    }
}