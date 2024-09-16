/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ContactTest {

    @isTest
    static void insertDefaultTitleTest() {
        // TO DO: implement unit test
        List<Contact> listContact = new List<Contact>();
        //Create test data
        for(Integer x = 1; x <= 5; x++){
            Contact con = new Contact();
            con.FirstName = 'Real';
            con.LastName = 'Madrid';
            con.Title = 'Club';
            con.Salutation = 'Mr.';
            con.RecordTypeId = '0128d000001ODgBAAW';

            listContact.add(con);
        }
        //Insert the data
        Test.startTest();
        insert listContact;
        Test.stopTest();

        //Retrieve the data
        List<Contact> conList = [SELECT Id, Title FROM Contact WHERE Id =: listContact[0].Id];

        //Compare the data
        System.Assert.areEqual('Club', conList[0].Title);
    }
}