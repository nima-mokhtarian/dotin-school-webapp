package DAL;

import model.CategoryElement;

import java.util.List;
import static util.EMF.runJpaCode;

public class CategoryElementService {
    public static CategoryElement getCategoryElementByName(String name){
        return runJpaCode(em -> em.createQuery("select ce from CategoryElement ce where ce.englishName = :name", CategoryElement.class).setParameter("name", name).getSingleResult());
    }
    public static List getCategoryElementsByCategoryId(long categoryId){
        return runJpaCode(em -> em.createQuery("select ce from CategoryElement ce where ce.category.id = :categoryId").setParameter("categoryId", categoryId).getResultList());
    }

    public static List getCategoryElementsByCategoryName(String name){
        long categoryId = CategoryService.findCategoryByName(name).getId();
        return getCategoryElementsByCategoryId(categoryId);
    }

    public static List getAllRole() {
        return getCategoryElementsByCategoryName("Role");
    }

    public static List getAllGender() {
        return getCategoryElementsByCategoryName("Gender");
    }
}