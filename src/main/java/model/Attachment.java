package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import java.sql.Blob;

@Entity
public class Attachment extends model.Entity {
    @Column(nullable = false, length = 30)
    private String name;
    @Lob
    private Blob data;

    public Attachment(String name, Blob data) {
        this.name = name;
        this.data = data;
    }

    public Attachment() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Blob getData() {
        return data;
    }

    public void setData(Blob data) {
        this.data = data;
    }
}
