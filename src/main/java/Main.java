import model.Category;
import model.CategoryElement;
import model.Employee;

import javax.persistence.EntityManager;
import java.util.stream.IntStream;

import static util.EMF.runJpaCode;

public class Main {
    public static void main(String[] args) {
        runJpaCode(em -> {
            initDotinPortal(em);
            return null;
        });
    }

    private static void initDotinPortal(EntityManager em) {
        Category role = new Category("Role");
        CategoryElement managerRole = new CategoryElement(role, "manager", "مدیر");
        CategoryElement employeeRole = new CategoryElement(role,  "employee", "کارمند");
        Category gender = new Category("Gender");
        CategoryElement maleGender = new CategoryElement(gender, "male", "مرد");
        CategoryElement femaleGender = new CategoryElement(gender, "female", "زن");
        em.persist(role);
        em.persist(gender);
        em.persist(employeeRole);
        em.persist(managerRole);
        em.persist(maleGender);
        em.persist(femaleGender);
        IntStream.range(1, 10).forEach(e -> {
            Employee employee = new Employee();
            employee.setName("e" + e);
            employee.setRole(e % 3 == 0 ? managerRole : employeeRole);
            em.persist(employee);
        });
    }
}