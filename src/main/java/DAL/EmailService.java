package DAL;

import model.Email;
import java.sql.Blob;

import java.util.List;

import static util.EMF.runJpaCode;


public class EmailService {

    public static void saveEmail(Email email){
        runJpaCode(em -> {
            em.persist(email);
            return null;
        });
    }

    public static List getEmailByReceiverId(long id){
        return runJpaCode(em -> em.createQuery("select e from Email e inner join  e.receiver r where r.id = :id ").setParameter("id", id).getResultList());
    }

    public static List getAttachmentsByEmailId(long id){
        return runJpaCode(em -> em.createQuery("select e.attachments from Email e where e.id = :id").setParameter("id", id).getResultList());
    }
}
