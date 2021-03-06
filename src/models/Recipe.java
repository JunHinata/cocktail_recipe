package models;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "recipes")
@NamedQueries({
    @NamedQuery(
            name = "getAllRecipes",
            query = "SELECT r FROM Recipe AS r ORDER BY r.name ASC"
            ),
    @NamedQuery(
            name = "getRecipesCount",
            query = "SELECT COUNT(r) FROM Recipe AS r"
            ),
    @NamedQuery(
            name = "checkRegisteredRecipeName",
            query = "SELECT COUNT(r) FROM Recipe AS r WHERE r.name = :name"
            )
})
@Entity
public class Recipe {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "image")
    private Blob image;

    @Column(name = "type")
    private String type;

    @Column(name = "color")
    private String color;

    @Column(name = "taste")
    private String taste;

    @Column(name = "glass")
    private String glass;

    @Column(name = "technique", nullable = false)
    private String technique;

    @Lob
    @Column(name = "introduction")
    private String introduction;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User createUser;

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

    public Blob getImage() {
        return image;
    }
    public void setImage(Blob image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }

    public String getTaste() {
        return taste;
    }
    public void setTaste(String taste) {
        this.taste = taste;
    }

    public String getGlass() {
        return glass;
    }
    public void setGlass(String glass) {
        this.glass = glass;
    }

    public String getTechnique() {
        return technique;
    }
    public void setTechnique(String technique) {
        this.technique = technique;
    }

    public String getIntroduction() {
        return introduction;
    }
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
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

    public User getCreateUser() {
        return createUser;
    }
    public void setCreateUser(User createUser) {
        this.createUser = createUser;
    }
}
