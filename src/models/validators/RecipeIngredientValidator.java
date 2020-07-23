package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Ingredient;

public class RecipeIngredientValidator {
    public static List<String> validate(Ingredient ing1, String ing1_vol, Ingredient ing2, String ing2_vol, Ingredient ing3, String ing3_vol, Ingredient ing4, String ing4_vol, Ingredient ing5, String ing5_vol, Ingredient ing6, String ing6_vol, Ingredient ing7, String ing7_vol, Ingredient ing8, String ing8_vol, Ingredient ing9, String ing9_vol, Ingredient ing10, String ing10_vol) {
        List<String> errors = new ArrayList<String>();

        String ri1_error = _validateRi1(ing1, ing1_vol);
        if(!ri1_error.equals("")) {
            errors.add(ri1_error);
        }
        String ri2_error = _validateRi2(ing2, ing2_vol);
        if(!ri2_error.equals("")) {
            errors.add(ri2_error);
        }
        String ri3_error = _validateRi3(ing3, ing3_vol);
        if(!ri3_error.equals("")) {
            errors.add(ri3_error);
        }
        String ri4_error = _validateRi4(ing4, ing4_vol);
        if(!ri4_error.equals("")) {
            errors.add(ri4_error);
        }
        String ri5_error = _validateRi5(ing5, ing5_vol);
        if(!ri5_error.equals("")) {
            errors.add(ri5_error);
        }
        String ri6_error = _validateRi6(ing6, ing6_vol);
        if(!ri6_error.equals("")) {
            errors.add(ri6_error);
        }
        String ri7_error = _validateRi7(ing7, ing7_vol);
        if(!ri7_error.equals("")) {
            errors.add(ri7_error);
        }
        String ri8_error = _validateRi8(ing8, ing8_vol);
        if(!ri8_error.equals("")) {
            errors.add(ri8_error);
        }
        String ri9_error = _validateRi9(ing9, ing9_vol);
        if(!ri9_error.equals("")) {
            errors.add(ri9_error);
        }
        String ri10_error = _validateRi10(ing10, ing10_vol);
        if(!ri10_error.equals("")) {
            errors.add(ri10_error);
        }

        return errors;
    }

    private static String _validateRi1(Ingredient ing1, String ing1_vol) {
        if(ing1 == null) {
            return "材料1を選択してください。";
        }
        if(ing1_vol == null || ing1_vol.equals("")) {
            return "材料1の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi2(Ingredient ing2, String ing2_vol) {
        if(ing2 == null) {
            return "材料2を選択してください。";
        }
        if(ing2_vol == null || ing2_vol.equals("")) {
            return "材料2の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi3(Ingredient ing3, String ing3_vol) {
        if(ing3 != null && (ing3_vol == null || ing3_vol.equals(""))) {
            return "材料3の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi4(Ingredient ing4, String ing4_vol) {
        if(ing4 != null && (ing4_vol == null || ing4_vol.equals(""))) {
            return "材料4の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi5(Ingredient ing5, String ing5_vol) {
        if(ing5 != null && (ing5_vol == null || ing5_vol.equals(""))) {
            return "材料5の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi6(Ingredient ing6, String ing6_vol) {
        if(ing6 != null && (ing6_vol == null || ing6_vol.equals(""))) {
            return "材料6の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi7(Ingredient ing7, String ing7_vol) {
        if(ing7 != null && (ing7_vol == null || ing7_vol.equals(""))) {
            return "材料7の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi8(Ingredient ing8, String ing8_vol) {
        if(ing8 != null && (ing8_vol == null || ing8_vol.equals(""))) {
            return "材料8の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi9(Ingredient ing9, String ing9_vol) {
        if(ing9 != null && (ing9_vol == null || ing9_vol.equals(""))) {
            return "材料9の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi10(Ingredient ing10, String ing10_vol) {
        if(ing10 != null && (ing10_vol == null || ing10_vol.equals(""))) {
            return "材料10の分量を入力してください。";
        }

        return "";
    }

}
