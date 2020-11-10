package DAL;

import model.Attachment;
import model.Email;

import java.sql.Blob;
import java.util.List;

import static util.EMF.runJpaCode;


public class AttachmentService {

    public static void saveAttachment(Attachment attachment) {
        runJpaCode(em -> {
            em.persist(attachment);
            return null;
        });
    }
}
