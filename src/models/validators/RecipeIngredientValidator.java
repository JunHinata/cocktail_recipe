package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Ingredient;

public class RecipeIngredientValidator {
    public static List<String> validate(Ingredient ing1, String ing1_vol, String ing1_type, Ingredient ing2, String ing2_vol, String ing2_type, Ingredient ing3, String ing3_vol, String ing3_type, Ingredient ing4, String ing4_vol, String ing4_type, Ingredient ing5, String ing5_vol, String ing5_type, Ingredient ing6, String ing6_vol, String ing6_type, Ingredient ing7, String ing7_vol, String ing7_type, Ingredient ing8, String ing8_vol, String ing8_type, Ingredient ing9, String ing9_vol, String ing9_type, Ingredient ing10, String ing10_vol, String ing10_type) {
        List<String> errors = new ArrayList<String>();

        String ri1_error = _validateRi1(ing1, ing1_vol, ing1_type);
        if(!ri1_error.equals("")) {
            errors.add(ri1_error);
        }
        String ri2_error = _validateRi2(ing2, ing2_vol, ing2_type);
        if(!ri2_error.equals("")) {
            errors.add(ri2_error);
        }
        String ri3_error = _validateRi3(ing3, ing3_vol, ing3_type);
        if(!ri3_error.equals("")) {
            errors.add(ri3_error);
        }
        String ri4_error = _validateRi4(ing4, ing4_vol, ing4_type);
        if(!ri4_error.equals("")) {
            errors.add(ri4_error);
        }
        String ri5_error = _validateRi5(ing5, ing5_vol, ing5_type);
        if(!ri5_error.equals("")) {
            errors.add(ri5_error);
        }
        String ri6_error = _validateRi6(ing6, ing6_vol, ing6_type);
        if(!ri6_error.equals("")) {
            errors.add(ri6_error);
        }
        String ri7_error = _validateRi7(ing7, ing7_vol, ing7_type);
        if(!ri7_error.equals("")) {
            errors.add(ri7_error);
        }
        String ri8_error = _validateRi8(ing8, ing8_vol, ing8_type);
        if(!ri8_error.equals("")) {
            errors.add(ri8_error);
        }
        String ri9_error = _validateRi9(ing9, ing9_vol, ing9_type);
        if(!ri9_error.equals("")) {
            errors.add(ri9_error);
        }
        String ri10_error = _validateRi10(ing10, ing10_vol, ing10_type);
        if(!ri10_error.equals("")) {
            errors.add(ri10_error);
        }

        return errors;
    }

    private static String _validateRi1(Ingredient ing1, String ing1_vol, String ing1_type) {
        if(ing1 == null) {
            return "材料1を選択してください。";
        }
        if(!ing1_type.equals("適量") && (ing1_vol == null || ing1_vol.equals(""))) {
            return "材料1の分量を入力してください。";
        }
        if(ing1_type == null || ing1_type.equals("")) {
            return "材料1の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi2(Ingredient ing2, String ing2_vol, String ing2_type) {
        if(ing2 == null) {
            return "材料2を選択してください。";
        }
        if(!ing2_type.equals("適量") && (ing2_vol == null || ing2_vol.equals(""))) {
            return "材料2の分量を入力してください。";
        }
        if(ing2_type == null || ing2_type.equals("")) {
            return "材料2の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi3(Ingredient ing3, String ing3_vol, String ing3_type) {
        if(ing3 != null && !ing3_type.equals("適量") && (ing3_vol == null || ing3_vol.equals(""))) {
            return "材料3の分量を入力してください。";
        }
        if(ing3 != null && (ing3_type == null || ing3_type.equals(""))) {
            return "材料3の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi4(Ingredient ing4, String ing4_vol, String ing4_type) {
        if(ing4 != null && !ing4_type.equals("適量") && (ing4_vol == null || ing4_vol.equals(""))) {
            return "材料4の分量を入力してください。";
        }
        if(ing4 != null && (ing4_type == null || ing4_type.equals(""))) {
            return "材料4の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi5(Ingredient ing5, String ing5_vol, String ing5_type) {
        if(ing5 != null && !ing5_type.equals("適量") && (ing5_vol == null || ing5_vol.equals(""))) {
            return "材料5の分量を入力してください。";
        }
        if(ing5 != null && (ing5_type == null || ing5_type.equals(""))) {
            return "材料5の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi6(Ingredient ing6, String ing6_vol, String ing6_type) {
        if(ing6 != null && !ing6_type.equals("適量") && (ing6_vol == null || ing6_vol.equals(""))) {
            return "材料6の分量を入力してください。";
        }
        if(ing6 != null && (ing6_type == null || ing6_type.equals(""))) {
            return "材料6の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi7(Ingredient ing7, String ing7_vol, String ing7_type) {
        if(ing7 != null && !ing7_type.equals("適量") && (ing7_vol == null || ing7_vol.equals(""))) {
            return "材料7の分量を入力してください。";
        }
        if(ing7 != null && (ing7_type == null || ing7_type.equals(""))) {
            return "材料7の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi8(Ingredient ing8, String ing8_vol, String ing8_type) {
        if(ing8 != null && !ing8_type.equals("適量") && (ing8_vol == null || ing8_vol.equals(""))) {
            return "材料8の分量を入力してください。";
        }
        if(ing8 != null && (ing8_type == null || ing8_type.equals(""))) {
            return "材料8の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi9(Ingredient ing9, String ing9_vol, String ing9_type) {
        if(ing9 != null && !ing9_type.equals("適量") && (ing9_vol == null || ing9_vol.equals(""))) {
            return "材料9の分量を入力してください。";
        }
        if(ing9 != null && (ing9_type == null || ing9_type.equals(""))) {
            return "材料9の単位を入力してください。";
        }

        return "";
    }

    private static String _validateRi10(Ingredient ing10, String ing10_vol, String ing10_type) {
        if(ing10 != null && !ing10_type.equals("適量") && (ing10_vol == null || ing10_vol.equals(""))) {
            return "材料10の分量を入力してください。";
        }
        if(ing10 != null && (ing10_type == null || ing10_type.equals(""))) {
            return "材料10の単位を入力してください。";
        }

        return "";
    }

}
