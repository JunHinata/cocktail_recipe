package models;

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

@Table(name = "stocks")
@NamedQueries({
    @NamedQuery(
            name = "getAllMyStocks",
            query = "SELECT s FROM Stock AS s WHERE s.stockUser = :user ORDER BY s.vol DESC, s.updated_at DESC"
            ),
    @NamedQuery(
            name = "getStocksCount",
            query = "SELECT COUNT(s) FROM Stock AS s WHERE s.stockUser = :user"
            ),
    @NamedQuery(
            name = "getIngredientStocksCount",
            query = "SELECT COUNT(s) FROM Stock AS s WHERE s.stockIngredient = :ingredient"
            )
})
@Entity
public class Stock {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User stockUser;

    @ManyToOne(optional = false)
    @JoinColumn(name = "ingredient_id", nullable = false)
    private Ingredient stockIngredient;

    @Column(name = "vol", nullable = false)
    private Integer vol;

    @Lob
    @Column(name = "comment")
    private String comment;

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

    public User getStockUser() {
        return stockUser;
    }
    public void setStockUser(User stockUser) {
        this.stockUser = stockUser;
    }

    public Ingredient getStockIngredient() {
        return stockIngredient;
    }
    public void setStockIngredient(Ingredient stockIngredient) {
        this.stockIngredient = stockIngredient;
    }

    public Integer getVol() {
        return vol;
    }
    public void setVol(Integer vol) {
        this.vol = vol;
    }

    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
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
