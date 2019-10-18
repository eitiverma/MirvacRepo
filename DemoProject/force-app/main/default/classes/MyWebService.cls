global class MyWebService {
    webService static Id makeContact(String lastName,ID aid) {
        Contact c = new Contact(lastName = 'Weissman', AccountId = aid);
        insert c;
        return c.id;
    }
}