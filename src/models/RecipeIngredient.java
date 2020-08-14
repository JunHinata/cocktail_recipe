package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "recipe_ingredients")
@NamedQueries({
    @NamedQuery(
            name = "getAllRecipeIngredients",
            query = "SELECT i FROM RecipeIngredient AS i ORDER BY i.id ASC"
            ),
    @NamedQuery(
            name = "getIngredients",
            query = "SELECT i FROM RecipeIngredient AS i WHERE i.makeRecipe = :makeRecipe ORDER BY i.id ASC"
            ),
    @NamedQuery(
            name = "getUsedIngredientsCount",
            query = "SELECT COUNT(i) FROM RecipeIngredient AS i WHERE i.useIngredient = :ingredient"
            )
})

@Entity
public class RecipeIngredient {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "recipe_id", nullable = false)
    private Recipe makeRecipe;

    @ManyToOne(optional = false)
    @JoinColumn(name = "ingredient_id", nullable = false)
    private Ingredient useIngredient;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "vol")
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
