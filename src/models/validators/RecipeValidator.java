package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.Recipe;
import utils.DBUtil;

public class RecipeValidator {
    public static List<String> validate(Recipe r, Boolean name_duplicate_check_flag) {
        List<String> errors = new ArrayList<String>();

        String name_error = _validateName(r.getName(), name_duplicate_check_flag);
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String type_error = _validateType(r.getType());
        if(!type_error.equals("")) {
            errors.add(type_error);
        }

        String color_error = _validateColor(r.getColor());
        if(!color_error.equals("")) {
            errors.add(color_error);
        }

        String taste_error = _validateTaste(r.getTaste());
        if(!taste_error.equals("")) {
            errors.add(taste_error);
        }

        String glass_error = _validateGlass(r.getGlass());
        if(!glass_error.equals("")) {
            errors.add(glass_error);
        }

        String technique_error = _validateTechnique(r.getTechnique());
        if(!technique_error.equals("")) {
            errors.add(technique_error);
        }

        return errors;
    }

    private static String _validateName(String name, Boolean name_duplicate_check_flag) {
        //必須入力チェック
        if(name == null || name.equals("")) {
            return "カクテル名を入力してください。";
        }

        //すでに登録されているカクテル名との重複チェック
        if(name_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long recipes_count = (long)em.createNamedQuery("checkRegisteredRecipeName", Long.class)
                                         .setParameter("name", name)
                                         .getSingleResult();
            em.close();
            if(recipes_count > 0) {
                return "入力されたカクテル名はすでに使用されています。";
            }
        }

        return "";
    }

    private static String _validateType(String type) {
        if(type == null || type.equals("")) {
            return "タイプを入力してください。";
        }

        return "";
    }

    private static String _validateColor(String color) {
        if(color == null || color.equals("")) {
            return "色を入力してください。";
        }

        return "";
    }

    private static String _validateTaste(String taste) {
        if(taste == null || taste.equals("")) {
            return "テイストを入力してください。";
        }

        return "";
    }

    private static String _validateGlass(String glass) {
        if(glass == null || glass.equals("")) {
            return "グラスを入力してください。";
        }

        return "";
    }

    private static String _validateTechnique(String technique) {
        if(technique == null || technique.equals("")) {
            return "技法を入力してください。";
        }

        return "";
    }

}
