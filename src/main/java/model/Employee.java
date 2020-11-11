package model;

import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import javax.persistence.Entity;

@Entity
@Table(name = "employee")
public class Employee extends model.Entity {
    @ManyToOne(fetch = FetchType.EAGER)
    private CategoryElement gender;
    @ManyToOne(fetch = FetchType.EAGER)
    private CategoryElement role;
    @Column(nullable = false, length = 30)
    private String name;
    @ManyToOne(fetch = FetchType.EAGER)
    private Employee manger;
    @Column(nullable = false, length = 30)
    private String username;
    @Column(unique = true, nullable = false, length = 30)
    private String password;

    public Employee() {
    }

    public Employee(String name, Employee manger, CategoryElement gender, CategoryElement role, String username, String password) {
        this.name = name;
        this.manger = manger;
        this.gender = gender;
        this.role = role;
        this.username = username;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CategoryElement getGender() {
        return gender;
    }

    public void setGender(CategoryElement gender) {
        this.gender = gender;
    }

    public CategoryElement getRole() {
        return role;
    }

    public void setRole(CategoryElement role) {
        this.role = role;
    }

    public Employee getManger() {
        return manger;
    }

    public void setManger(Employee manger) {
        this.manger = manger;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
