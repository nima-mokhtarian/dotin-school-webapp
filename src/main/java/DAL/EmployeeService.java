package DAL;

import java.util.List;
import model.Employee;
import static util.EMF.runJpaCode;

public class EmployeeService {

    public static void saveEmployee(Employee employee) {
        runJpaCode(em -> {
            em.persist(employee);
            return null;
        });
    }

    public static Employee getEmployeeByName(String name) {
        return (Employee) runJpaCode(em -> em.createQuery("from Employee where name = :name").setParameter("name", name).getSingleResult());
    }

    public static List getAllEmployee() {
        return runJpaCode(em -> em.createQuery("from Employee").getResultList());
    }

    public static List getEmployeeByRoll(String roll){
        return runJpaCode(em -> em.createQuery("from Employee e where e.role.englishName = :roll").setParameter("roll", roll).getResultList());
    }
}