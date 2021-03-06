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
        CategoryElement employeeRole = new CategoryElement(role, "employee", "کارمند");
        Category gender = new Category("Gender");
        CategoryElement maleGender = new CategoryElement(gender, "male", "مرد");
        CategoryElement femaleGender = new CategoryElement(gender, "female", "زن");
        em.persist(role);
        em.persist(gender);
        em.persist(employeeRole);
        em.persist(managerRole);
        em.persist(maleGender);
        em.persist(femaleGender);
        Employee nima = new Employee();
        nima.setName("nima");
        nima.setRole(managerRole);
        nima.setGender(maleGender);
        nima.setUsername("nima");
        nima.setPassword("nima");
        em.persist(nima);
        IntStream.range(1, 10).forEach(e -> {
            Employee employee = new Employee();
            employee.setName("e" + e);
            employee.setRole(e % 3 == 0 ? managerRole : employeeRole);
            employee.setManger(nima);
            employee.setUsername("e" + e);
            employee.setPassword("e" + e);
            em.persist(employee);
        });
        Category vacationStatus = new Category("VacationStatus");
        CategoryElement waitingForAcceptance = new CategoryElement(vacationStatus, "waiting for acceptance", "در انتظار تایید");
        CategoryElement accepted = new CategoryElement(vacationStatus, "accepted", "تایید شده");
        CategoryElement rejected = new CategoryElement(vacationStatus, "rejected", "رد شده");
        em.persist(vacationStatus);
        em.persist(waitingForAcceptance);
        em.persist(accepted);
        em.persist(rejected);
    }
}