import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseFolder;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;


import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;


import javax.annotation.Generated;
// Funcionou sem precisar importar esses arquivos


public class Test {


	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builderKBFolder = KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource = builderKBFolder.authentication(
			"test@liferay.com", "test1"
		).build();

		
		KnowledgeBaseFolder knowledgeBaseFolder1 = new KnowledgeBaseFolder();

			knowledgeBaseFolder1.setDescription("These are my Tools");
			knowledgeBaseFolder1.setName("Tool's");

		knowledgeBaseFolder1 = 
			knowledgeBaseFolderResource.postSiteKnowledgeBaseFolder(
					20121L, knowledgeBaseFolder1);

			System.out.println("That's my tool's");
			System.out.println(knowledgeBaseFolder1.getId());

	/*knowledgeBaseFolder knowledgeBaseFolder2 = new knowledgeBaseFolder2();

		knowledgeBaseFolder2.setDescription("Description knowledgeBaseFolder2");
		knowledgeBaseFolder2.setName("Martelo");

		knowledgeBaseFolder2 = knowledgeBaseFolderResource.postKnowledgeBaseFolderKnowledgeBaseFolder(
			knowledgeBaseFolder1.getId(),
			knowledgeBaseFolder2
		); */
}
}