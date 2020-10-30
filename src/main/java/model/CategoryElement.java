package model;

import javax.persistence.Entity;
import javax.persistence.*;

@Entity
@Table(name = "categoryElement")
public class CategoryElement extends model.Entity {
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category")
    private Category category;

    @Column(nullable = false, length = 30)
    private String englishName;

    @Column(nullable = false, length = 30)
    private String persianName;

    public CategoryElement() {
    }

    public CategoryElement(String category, String englishName, String persianName) {
        this.category = new Category(category);
        this.englishName = englishName;
        this.persianName = persianName;
    }

    public CategoryElement(Category category, String englishName, String persianName) {
        this.category = category;
        this.englishName = englishName;
        this.persianName = persianName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getPersianName() {
        return persianName;
    }

    public void setPersianName(String persianName) {
        this.persianName = persianName;
    }
}