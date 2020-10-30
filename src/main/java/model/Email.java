package model;

import java.sql.Blob;
import java.util.Set;
import javax.persistence.*;
import javax.persistence.Entity;

@Entity
@Table(name = "email")
public class Email extends model.Entity{
    @ManyToOne(fetch = FetchType.EAGER)
    private Employee sender;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "receivers", joinColumns = {@JoinColumn(name = "email", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "employee", nullable = false)})
    private Set<Employee> receiver;
    @Column(nullable = false, length = 30)
    private String title;
    @Column(nullable = false)
    private String body;
    @Lob
    private Blob attachment;

    public Email() {
    }

    public Email(Employee sender, Set<Employee> receiver, String title, String body) {
        this.sender = sender;
        this.receiver = receiver;
        this.title = title;
        this.body = body;
    }

    public Employee getSender() {
        return sender;
    }

    public void setSender(Employee sender) {
        this.sender = sender;
    }

    public Set<Employee> getReceiver() {
        return receiver;
    }

    public void setReceiver(Set<Employee> receiver) {
        this.receiver = receiver;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Blob getAttachment() {
        return attachment;
    }

    public void setAttachment(Blob attachment) {
        this.attachment = attachment;
    }
}
