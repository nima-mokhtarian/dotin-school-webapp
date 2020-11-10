package model;

import org.hibernate.annotations.Fetch;

import java.time.LocalDate;
import java.util.Date;
import javax.persistence.*;
import javax.persistence.Entity;

@Entity
@Table(name = "vacation")
public class Vacation extends model.Entity {
    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date startDate;
    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date endDate;
    @ManyToOne(fetch = FetchType.EAGER)
    private CategoryElement status;
    @ManyToOne(fetch = FetchType.EAGER)
    private Employee employee;

    public Vacation() {
    }

    public Vacation(LocalDate startDate, LocalDate endDate, Employee employee, CategoryElement status) {
        this.startDate = new Date(startDate.getYear(), startDate.getMonthValue(), startDate.getDayOfMonth());
        this.endDate = new Date(endDate.getYear(), startDate.getMonthValue(), endDate.getDayOfMonth());
        this.employee = employee;
        this.status = status;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public CategoryElement getStatus() {
        return status;
    }

    public void setStatus(CategoryElement status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
