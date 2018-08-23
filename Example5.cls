public class Example5 {
    /* This method run method deleteUniqueRecord for delete dublicates*/
    public static void func() {
        deleteNotUniqueRecord('Contact');
        deleteNotUniqueRecord('Lead');
    }
    /*This method deleted dublicates of sObjects*/
    private static void deleteNotUniqueRecord(String nameSObject) {
        Set<String> setNamesOfSobjects = new Set<String>();
        List<sObject> deleteListSobject = new List<sObject>();

        List<sObject> listSObjects = Database.query('SELECT Id, Name, Phone, Email, Title ' +
                                                    ' FROM '+nameSObject+
                                                    ' LIMIT 1000');
        System.debug('List size is '+listSObjects.size());

        for(sObject thisSObject : listSObjects) {
            if(setNamesOfSobjects.contains((String)thisSObject.get('Name'))){
                deleteListSobject.add(thisSObject);
            } else {
                setNamesOfSobjects.add((String)thisSObject.get('Name'));
            }
        }
        try{
        delete deleteListSobject;
        } catch (DmlException thisDmlExseption) {
           System.debug('Error. The following exception has occurred:' +thisDmlExseption.getMessage());
        }
    }


//        list<contact> list1 = [select id,name,phone, email from contact];
//        list<contact> list1new = new list<contact>();
//        for(contact c: list1)
//        {
//        Boolean f = false;
//            integer i = 0;
//            for(i=0;i<list1new.size();i++)
//            {
//                if(c.Name == list1new[i].Name){f=true;}
//
//            }
//            if(f!=true)
//          {
//         list1new.add(c);
//            }
//        }
//        list<Contact> list1newt = new list<contact>();
//        for(integer i=0;i<list1.size();i++){
//            boolean f = false;
//            for(integer j=0;j<list1new.size();j++){
//                if(list1[i].id == list1new[j].id){
//                    f = true;
//                }
//            }
//            if(!f){list1newt.add(list1[i]);}
//        }
//        delete list1newt;
//        list<lead> list2 = [select id,name,phone, email,title from Lead];
//        list<lead> list2new = new list<lead>();
//        for(lead c: list2)
//        {
//        Boolean f = false;
//            integer i = 0;
//            for(i=0;i<list2new.size();i++)
//            {
//                if(c.Name == list2new[i].Name){f=true;}
//
//            }
//            if(f!=true)
//          {
//         list2new.add(c);
//            }
//        }
//        list<Lead> list2newt = new list<lead>();
//        for(integer i=0;i<list2.size();i++){
//            boolean f = false;
//            for(integer j=0;j<list2new.size();j++){
//                if(list2[i].id == list2new[j].id){
//                    f = true;
//                }
//            }
//            if(!f){list2newt.add(list2[i]);}
//        }
//        delete list2newt;
//    }
}