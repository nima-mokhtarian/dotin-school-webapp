package DAL;

import model.Category;
import static util.EMF.runJpaCode;

public class CategoryService {
    public static Category findCategoryByName(String name){
        return runJpaCode(em -> em.createQuery("select c from Category c where c.name = :name", Category.class).setParameter("name", name).getSingleResult());
    }
}
