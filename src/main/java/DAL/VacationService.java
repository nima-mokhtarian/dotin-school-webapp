package DAL;

import model.CategoryElement;
import model.Employee;
import model.Vacation;

import java.util.List;

import static util.EMF.runJpaCode;


public class VacationService {

    public static void saveVacation(Vacation vacation){
        runJpaCode(em -> {
            em.persist(vacation);
            return null;
        });
    }

    public static List getVacationByApplicantId(long id){
        return runJpaCode(em -> em.createQuery("from Vacation v where v.employee.id = :id").setParameter("id", id).getResultList());
    }

    public static List getVacationByManagerId(long id){
        return runJpaCode(em -> em.createQuery("from Vacation v where v.employee.manger.id = :id").setParameter("id", id).getResultList());
    }

    public static void acceptVacation(long id){
        CategoryElement accepted = CategoryElementService.getCategoryElementByName("accepted");
        runJpaCode(em -> em.createQuery("update Vacation set status = :status where id = :id").setParameter("status", accepted).setParameter("id", id).executeUpdate());
    }

    public static void rejectVacation(long id){
        CategoryElement rejected = CategoryElementService.getCategoryElementByName("rejected");
        runJpaCode(em -> em.createQuery("update Vacation set status = :status where id = :id").setParameter("status", rejected).setParameter("id", id).executeUpdate());
    }
}
