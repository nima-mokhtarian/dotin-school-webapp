package DAL;

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
}
