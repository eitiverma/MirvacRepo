@ isTest
private class TestHandleProductPriceChange{
        static testmethod void TestPriceChange(){
            
            Invoice_statement__c inv = new Invoice_statement__c (status__c='Negotiated');
            insert inv;

            merchandise__c[] merchant = new merchandise__c[]{
                new merchandise__c(Price__c=1000 , Total_Inventory__c= 15 , Description__c = 'New Television product' , Name= 'TV'),
                new merchandise__c(Price__c=9000 , Total_Inventory__c= 10 , Description__c = 'New Laptop' , Name= 'Apple')                
            };
            
            insert merchant;
            
            Line_Item__c[] lineitm = new Line_Item__c[]{
                new Line_Item__c(Invoice_statement__c = inv.id ,merchandise__c = merchant[0].id , Units_sold__c = 10 , Unit_Price__c = 1000), 
                new Line_Item__c(Invoice_statement__c = inv.id ,merchandise__c = merchant[1].id , Units_sold__c = 5 , Unit_Price__c = 9000) 

             };
              insert lineitm;
               
            merchant[0].Price__c = 500;
            Test.startTest();
            update merchant;
            Test.stopTest();
             
            lineitm = [Select id, Unit_Price__c from Line_Item__c where id in :lineitm]; 
            System.assertNotEquals(lineitm[0].Unit_Price__c,1000);  

        }

}