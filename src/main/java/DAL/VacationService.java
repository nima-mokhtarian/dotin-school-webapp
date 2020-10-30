package DAL;

import model.Vacation;
import static util.EMF.runJpaCode;


public class VacationService {

    public static void saveVacation(Vacation vacation){
        runJpaCode(em -> {
            em.persist(vacation);
            return null;
        });
    }
}
