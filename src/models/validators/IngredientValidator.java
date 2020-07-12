package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Ingredient;

public class IngredientValidator {
    public static List<String> validate(Ingredient i) {
        List<String> errors = new ArrayList<String>();

        String name_error = _validateName(i.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String type_error = _validateType(i.getType());
        if(!type_error.equals("")) {
            errors.add(type_error);
        }

        String abv_error = _validateAbv(i.getAbv());
        if(!abv_error.equals("")) {
            errors.add(abv_error);
        }

        String soda_flag_error = _validateSoda_flag(i.getSoda_flag());
        if(!soda_flag_error.equals("")) {
            errors.add(soda_flag_error);
        }

        return errors;
    }

    private static String _validateName(String name) {
        if(name == null || name.equals("")) {
            return "材料名を入力してください。";
        }

        return "";
    }

    private static String _validateType(String type) {
        if(type == null || type.equals("")) {
            return "分類を入力してください。";
        }

        return "";
    }

    private static String _validateAbv(Integer abv) {
        if(abv == null || abv.equals("")) {
            return "アルコール度数を入力してください。";
        }

        return "";
    }

    private static String _validateSoda_flag(Integer soda_flag) {
        if(soda_flag == null || soda_flag.equals("")) {
            return "炭酸の有無を入力してください。";
        }

        return "";
    }

}
