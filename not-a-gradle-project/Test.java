import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseFolder;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;
import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseArticle;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.io.File;
import java.util.HashMap;
import java.util.Map;


import javax.print.attribute.standard.DocumentName;
import javax.xml.parsers.DocumentBuilder;
import java.io.File;

import com.liferay.headless.delivery.client.dto.v1_0.Document;
import com.liferay.headless.delivery.client.dto.v1_0.DocumentFolder;
 





public class Test {
    
        public static void main(String[] args) throws Exception {
            KnowledgeBaseFolderResource.Builder builderKBFolder = KnowledgeBaseFolderResource.builder();
    
            KnowledgeBaseFolderResource knowledgeBaseFolderResource = builderKBFolder.authentication(
                "test@liferay.com", "test1"
            ).build();
    
           //METHOD POST
           
            //PARENTS FILES
    
            KnowledgeBaseFolder knowledgeBaseFolder1 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder1.setDescription("These are my Tools");
                knowledgeBaseFolder1.setName("Tool's");
    
                knowledgeBaseFolder1 = 
                knowledgeBaseFolderResource.postSiteKnowledgeBaseFolder(
                        20121L, knowledgeBaseFolder1);
    
                System.out.println("That's my tool's");
                System.out.println(knowledgeBaseFolder1.getId());
    
            KnowledgeBaseFolder knowledgeBaseFolder12 = new KnowledgeBaseFolder();
                knowledgeBaseFolder12.setDescription("Available workers");
                knowledgeBaseFolder12.setName("Employees");
    
                knowledgeBaseFolder12 = 
                knowledgeBaseFolderResource.postSiteKnowledgeBaseFolder(
                        20121L, knowledgeBaseFolder12);
    
                System.out.println("Work Places");
                System.out.println(knowledgeBaseFolder12.getId());
    
            KnowledgeBaseFolder knowledgeBaseFolder123 = new KnowledgeBaseFolder();
                knowledgeBaseFolder123.setDescription("Workplaces available");
                knowledgeBaseFolder123.setName("Work Places");
    
                knowledgeBaseFolder123 = 
                knowledgeBaseFolderResource.postSiteKnowledgeBaseFolder(
                        20121L, knowledgeBaseFolder123);
    
                System.out.println("available workers");
                System.out.println(knowledgeBaseFolder123.getId());
    
    
    
    
                //CHILDREN FOLDERS - TOOL'S
    
            KnowledgeBaseFolder knowledgeBaseFolder2 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder2.setDescription("Used to hit nails");
                knowledgeBaseFolder2.setName("Hammer");
    
                knowledgeBaseFolder2 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder2);
    
                
            KnowledgeBaseFolder knowledgeBaseFolder3 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder3.setDescription("used to cut wood");
                knowledgeBaseFolder3.setName("Circular saw");
    
                knowledgeBaseFolder3 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder3);
    
            KnowledgeBaseFolder knowledgeBaseFolder4 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder4.setDescription("used to cut down trees");
                knowledgeBaseFolder4.setName("Motorcycle saw");
    
                knowledgeBaseFolder4 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder4);
    
            KnowledgeBaseFolder knowledgeBaseFolder5 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder5.setDescription("Used to weld iron, steel and aluminum");
                knowledgeBaseFolder5.setName("soldering machine");
        
                knowledgeBaseFolder5 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder5);
    
            KnowledgeBaseFolder knowledgeBaseFolder6 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder6.setDescription("Used to drill holes in wall, iron and wood");
                knowledgeBaseFolder6.setName("drilling machine");
        
                knowledgeBaseFolder6 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder6);				
                    
            KnowledgeBaseFolder knowledgeBaseFolder7 = new KnowledgeBaseFolder();
    
                knowledgeBaseFolder7.setDescription("used for measurement");
                knowledgeBaseFolder7.setName("measuring tape");
            
                knowledgeBaseFolder7 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder1.getId(),
                    knowledgeBaseFolder7);
                //METHOD PUT
                knowledgeBaseFolder7.setName("Sun glasses");
                knowledgeBaseFolder7.setDescription("used for to protect the eyes");
                knowledgeBaseFolderResource.putKnowledgeBaseFolder(
                    knowledgeBaseFolder7.getId(),
                    knowledgeBaseFolder7
                );

                System.out.println("I added the method PUT on the Folder");
                System.out.println(knowledgeBaseFolder7.getId());
    
            
            
                //CHILDREN FOLDERS - EMPLOYEES	

            KnowledgeBaseFolder knowledgeBaseFolder8 = null;

            try {
               knowledgeBaseFolder8 = knowledgeBaseFolderResource.getSiteKnowledgeBaseFolderByExternalReferenceCode(knowledgeBaseFolder8.getId(), "FOLDER8");

                knowledgeBaseFolder8.setName("Pedro Amaral");
                knowledgeBaseFolderResource.putKnowledgeBaseFolder(
                    knowledgeBaseFolder8.getId(),
                    knowledgeBaseFolder8
                );

            } catch (Exception e) {
                    knowledgeBaseFolder8 = new KnowledgeBaseFolder();
                    knowledgeBaseFolder8.setDescription("disponivel");
                    knowledgeBaseFolder8.setName("Pedro Henrique");
                    knowledgeBaseFolder8.setExternalReferenceCode("FOLDER8");
                    
                    knowledgeBaseFolder8 = 
                    knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                        knowledgeBaseFolder12.getId(),
                        knowledgeBaseFolder8);
                   
                 System.out.println("added the method PUT with try and catch");
                 System.out.println(knowledgeBaseFolder8.getId());
            
            }
        
                
            
            
            KnowledgeBaseFolder knowledgeBaseFolder9 = new KnowledgeBaseFolder();
        
                knowledgeBaseFolder9.setDescription("disponivel");
                knowledgeBaseFolder9.setName("Marcos Victor");
                    
                knowledgeBaseFolder9 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder12.getId(),
                    knowledgeBaseFolder9);	
                    
            KnowledgeBaseFolder knowledgeBaseFolder10 = new KnowledgeBaseFolder();
        
                knowledgeBaseFolder10.setDescription("disponivel");
                knowledgeBaseFolder10.setName("Andre Luis");
                        
                knowledgeBaseFolder10 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder12.getId(),
                    knowledgeBaseFolder10);
    
            KnowledgeBaseFolder knowledgeBaseFolder11 = new KnowledgeBaseFolder();
        
                knowledgeBaseFolder11.setDescription("disponivel");
                knowledgeBaseFolder11.setName("Alex Martins");
                            
                knowledgeBaseFolder11 = 
                knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                    knowledgeBaseFolder12.getId(),
                    knowledgeBaseFolder11);
    
    
    
            //CHILDREN FOLDERS - WORK PLACES	
    
        KnowledgeBaseFolder knowledgeBaseFolder14 = new KnowledgeBaseFolder();
        
            knowledgeBaseFolder14.setDescription("disponivel");
            knowledgeBaseFolder14.setName("Uruguai");
            
            knowledgeBaseFolder14 = 
            knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                knowledgeBaseFolder123.getId(),
                knowledgeBaseFolder14);
        
        
        KnowledgeBaseFolder knowledgeBaseFolder15 = new KnowledgeBaseFolder();
    
            knowledgeBaseFolder15.setDescription("disponivel");
            knowledgeBaseFolder15.setName("China");
                
            knowledgeBaseFolder15 = 
            knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                knowledgeBaseFolder123.getId(),
                knowledgeBaseFolder15);	
                
        KnowledgeBaseFolder knowledgeBaseFolder16 = new KnowledgeBaseFolder();
    
            knowledgeBaseFolder16.setDescription("disponivel");
            knowledgeBaseFolder16.setName("Brasil");
                    
            knowledgeBaseFolder16 = 
            knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                knowledgeBaseFolder123.getId(),
                knowledgeBaseFolder16);
    
        KnowledgeBaseFolder knowledgeBaseFolder17 = new KnowledgeBaseFolder();
    
            knowledgeBaseFolder17.setDescription("disponivel");
            knowledgeBaseFolder17.setName("Marrocos");
                        
            knowledgeBaseFolder17 = 
            knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
                knowledgeBaseFolder123.getId(),
                knowledgeBaseFolder17);
    


    //METHOD GET

        KnowledgeBaseFolder knowledgeBaseFolder20 = new KnowledgeBaseFolder();
            knowledgeBaseFolder20 =
            knowledgeBaseFolderResource.getKnowledgeBaseFolder(
                knowledgeBaseFolder1.getId()
            );

            System.out.println("Used the method GET into the Folders");
            System.out.println(knowledgeBaseFolder1.getId());


    // METHOD PUT
          /*I added the  method PUT into the knowledgeBaseFolder7 file
           */
             

    //METHOD DELETE

    knowledgeBaseFolderResource.deleteKnowledgeBaseFolder(
        knowledgeBaseFolder14.getId());
        System.out.println("I added the method DELETE");
        System.out.println(knowledgeBaseFolder14.getId());
         



        //ARTICLE


    KnowledgeBaseArticleResource.Builder builderKBArticle = KnowledgeBaseArticleResource.builder();

        KnowledgeBaseArticleResource knowledgeBaseArticleResource = builderKBArticle.authentication(
            "test@liferay.com", "test1"
        ).build();

    KnowledgeBaseArticle knowledgeBaseArticle1 = new KnowledgeBaseArticle();
    
            knowledgeBaseArticle1.setArticleBody("Body");
            knowledgeBaseArticle1.setDescription("User Name");
            knowledgeBaseArticle1.setTitle("Pedro Amaral");
            knowledgeBaseArticle1.setSiteId(20121L);
            
        
            knowledgeBaseArticle1 = knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(20121L,
                    knowledgeBaseArticle1);


    //METHOD POST

    KnowledgeBaseArticle knowledgeBaseArticle2 = new KnowledgeBaseArticle();

            knowledgeBaseArticle2.setArticleBody("Pedro Amaral");
            knowledgeBaseArticle2.setDescription("usuario");
            knowledgeBaseArticle2.setTitle("Another User");
            knowledgeBaseArticle2.setSiteId(20121L);
        

            knowledgeBaseArticle2 = knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(20121L,
                knowledgeBaseArticle2
            );


    //METHOD GET

    KnowledgeBaseArticle knowledgeBaseArticle22 = new KnowledgeBaseArticle();
            knowledgeBaseArticle22 =
            knowledgeBaseArticleResource.getKnowledgeBaseArticle(
                knowledgeBaseArticle2.getId()
            );

    System.out.println("Used the method GET into the Article");
    System.out.println(knowledgeBaseArticle22.getId());


     // METHOD PUT
     
     KnowledgeBaseArticle knowledgeBaseArticle3 = null;

     try {
        knowledgeBaseArticle3 = knowledgeBaseArticleResource.getSiteKnowledgeBaseArticleByExternalReferenceCode(
            knowledgeBaseArticle3.getId(), "ARTICLE3");

         knowledgeBaseArticle3.setTitle("nametest");
         knowledgeBaseArticleResource.putKnowledgeBaseArticle(
             knowledgeBaseArticle3.getId(),
             knowledgeBaseArticle3
         );

     } catch (Exception e) {
             knowledgeBaseArticle3 = new KnowledgeBaseArticle();
             knowledgeBaseArticle3.setDescription("new description");
             knowledgeBaseArticle3.setTitle("Admin");
             knowledgeBaseArticle3.setSiteId(20121L);
             knowledgeBaseArticle3.setArticleBody("Peter");
             
             knowledgeBaseArticle3 = knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(
                20121L,
                knowledgeBaseArticle3);
            
          System.out.println("added the method PUT with try and catch into the ARTICLE");
          System.out.println(knowledgeBaseArticle3.getId());
     
     }


    //METHOD DELETE
    /*
    knowledgeBaseArticleResource.deleteKnowledgeBaseArticle(
			knowledgeBaseArticle1.getId());
    */
    knowledgeBaseArticleResource.deleteKnowledgeBaseArticle(
            knowledgeBaseArticle2.getId());
    
    System.out.println("I added the method DELETE into the ARTICLE");
    System.out.println(knowledgeBaseArticle1.getId());




    //METHOD CRUD INTO THE DOCUMENTS FOLDERS FILES

    //METHOD POST

    DocumentFolderResource.Builder  builderDCFolder = DocumentFolderResource.builder();
    
    DocumentFolderResource documentFolderResource = builderDCFolder.authentication(
        "test@liferay.com", "test1"
    ).build();

    DocumentFolder admin = new DocumentFolder();
        admin.setName("Peter but not Peter Parker");
        admin.setDescription("The man that loves Jesus Christ");
        admin.setSiteId(20121L);

        admin = 
        documentFolderResource.postSiteDocumentFolder(
            20121L, admin);

        System.out.println("I added the first POST into the Document files");
        System.out.println(admin.getId());

    DocumentFolder img = new DocumentFolder();
        img.setName("Images");
        img.setDescription("Alls the images");

        img = documentFolderResource.postSiteDocumentFolder(
            20121L, img);

        System.out.println("Created the images files");
        System.out.println(img.getId());


    DocumentFolder link = new DocumentFolder();
        link.setName("Links");
        link.setDescription("Links a lot");

            link = documentFolderResource.postSiteDocumentFolder(
                20121L, link);

        System.out.println("Links Docs");
        System.out.println(link.getId());

    DocumentFolder youtube = new DocumentFolder();
        youtube.setName("Youtube");
        youtube.setDescription("Watches the videos on youtube");

            youtube = documentFolderResource.postDocumentFolderDocumentFolder(
                link.getId(),
                youtube
            );

    DocumentFolder google = new DocumentFolder();
        google.setName("google");
        google.setDescription("Look on the google");

            google = documentFolderResource.postDocumentFolderDocumentFolder(
                link.getId(),
                google
            );
        
    DocumentFolder facebook = new DocumentFolder();
        facebook.setName("facebook");
        facebook.setDescription("buy into the facebook");

        facebook = documentFolderResource.postDocumentFolderDocumentFolder(
            link.getId(),
            facebook
        );

    DocumentFolder liferaysite = new DocumentFolder();
        liferaysite.setName("liferaysite");
        liferaysite.setDescription("Go to liferaysite");

            liferaysite = documentFolderResource.postDocumentFolderDocumentFolder(
                link.getId(),
                liferaysite
        );

        //METHOD PUT

        liferaysite.setName("SiteofLiferay");
        liferaysite.setDescription("new Descrioption");
        liferaysite = documentFolderResource.putDocumentFolder(
            link.getId(),
            liferaysite
        );

    DocumentFolder ocean = new DocumentFolder();
        ocean.setName("ocean");
        ocean.setDescription("Go to ocean");

            ocean = documentFolderResource.postDocumentFolderDocumentFolder(
                img.getId(),
                ocean
        );

    DocumentFolder camping = new DocumentFolder();
        camping.setName("camping");
        camping.setDescription("Go to camping");

            camping = documentFolderResource.postDocumentFolderDocumentFolder(
                img.getId(),
                camping
        );

    DocumentFolder stadium = new DocumentFolder();
        stadium.setName("stadium");
        stadium.setDescription("Go to stadium");

            stadium = documentFolderResource.postDocumentFolderDocumentFolder(
                img.getId(),
                stadium
        );

        stadium.setName("Shopping mall");
        stadium.setDescription("The name chanded for shopping mall");
        documentFolderResource.putDocumentFolder(
            stadium.getId(),
            stadium
        );

        //METHOD GET

    DocumentFolder getarquivo = new DocumentFolder();
    getarquivo.setName("new Name");
    getarquivo.setDescription("new description");

    getarquivo =
    documentFolderResource.getDocumentFolder(
        camping.getId()
    );

        System.out.println("Used the method GET into the Documents");
        System.out.println(getarquivo.getId());

    //METHOD PUT
//I added the method PUT into the liferaysite files

//METHOD DELETE

documentFolderResource.deleteDocumentFolder(
    ocean.getId()
);


//METHOD CRUD INTO THE DOCUMENTS  FILES

    //METHOD POST

    DocumentResource.Builder builderDocument = DocumentResource.builder();

    DocumentResource documentResource = builderDocument.authentication(
            "test@liferay.com", "test1"
        ).build();

    Document document1 = new Document();
    
    document1.setDescription("new");
    document1.setTitle("Pedro Amaral");
    

    Map<String, File> newfile = new HashMap<String, File>();

    File arquivox = new File("pedro.jpg");
    newfile.put("file", arquivox);

        document1 = 
        documentResource.postSiteDocument(
            20121L, document1, newfile);
      
        System.out.println("uhuu");
        System.out.println(document1.getId());
            


    Document document2 = new Document();

    document2.setDescription("description document 2");
    document2.setTitle("Brian Chan");
    Map<String, File> brianchan4 = new HashMap<String, File>();
    File document30 = new File("brianchan.jpg");
    brianchan4.put("file", document30);

    document2 = 
        documentResource.postSiteDocument(20121L,
            document2, brianchan4);

    document2.setDescription("new description");
    document2.setTitle("Brian Chan developer");
       
    document2 = documentResource.putDocument(
        document2.getId(),
        document2,
        brianchan4
        );

        

    //METHOD PUT
       

    //METHOD GET
Document document5 = new Document();
document5.setTitle("Pedro Henrique");
document5.setDescription("new");

     document5 = documentResource.getDocument(
        document1.getId()
     );
    

    //METHOD PUT
     // I ADDED THIS METHOD INTO THE DOCUMENT2

    //METHOD DELETE
/*
 *   documentResource.deleteDocument(
        document1.getId()
     );
 */
   
       
    }
}