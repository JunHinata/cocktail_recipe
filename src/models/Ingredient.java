package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "ingredients")
@NamedQueries({
    @NamedQuery(
            name = "getAllIngredients",
            query = "SELECT i FROM Ingredient AS i ORDER BY i.id DESC"
            ),
    @NamedQuery(
            name = "getIngredientsCount",
            query = "SELECT COUNT(i) FROM Ingredient AS i"
            )
})
@Entity
public class Ingredient {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "image")
    private byte[] image;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "abv", nullable = false)
    private Integer abv;

    @Column(name = "soda_flag", nullable = false)
    private Integer soda_flag;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public byte[] getImage() {
        return image;
    }
    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public Integer getAbv() {
        return abv;
    }
    public void setAbv(Integer abv) {
        this.abv = abv;
    }

    public Integer getSoda_flag() {
        return soda_flag;
    }
    public void setSoda_flag(Integer soda_flag) {
        this.soda_flag = soda_flag;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }
    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }
    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}
