package DAL;

import model.Email;
import model.Vacation;

import java.util.List;

import static util.EMF.runJpaCode;


public class EmailService {

    public static void saveEmail(Email email){
        runJpaCode(em -> {
            em.persist(email);
            return null;
        });
    }

    public static List getEmailBySenderId(long id){
        return runJpaCode(em -> em.createQuery("from Email e where e.sender.id = :id").setParameter("id", id).getResultList());
    }
}
