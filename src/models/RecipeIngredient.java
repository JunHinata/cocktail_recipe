package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name = "recipe_ingredients")
@Entity
public class RecipeIngredient {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(optional = false)
    @Column(name = "recipe_id", nullable = false)
    private Recipe makeRecipe;

    @ManyToOne(optional = false)
    @Column(name = "ingredient_id", nullable = false)
    private Ingredient useIngredient;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "vol", nullable = false)
    private Integer vol;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Recipe getMakeRecipe() {
        return makeRecipe;
    }
    public void setMakeRecipe(Recipe makeRecipe) {
        this.makeRecipe = makeRecipe;
    }

    public Ingredient getUseIngredient() {
        return useIngredient;
    }
    public void setUseIngredient(Ingredient useIngredient) {
        this.useIngredient = useIngredient;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public Integer getVol() {
        return vol;
    }
    public void setVol(Integer vol) {
        this.vol = vol;
    }

}
