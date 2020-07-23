package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.RecipeIngredient;

public class RecipeIngredientValidator {
    public static List<String> validate(RecipeIngredient ri1, RecipeIngredient ri2, RecipeIngredient ri3, RecipeIngredient ri4, RecipeIngredient ri5, RecipeIngredient ri6, RecipeIngredient ri7, RecipeIngredient ri8, RecipeIngredient ri9, RecipeIngredient ri10) {
        List<String> errors = new ArrayList<String>();

        String ri1_error = _validateRi1(ri1);
        if(!ri1_error.equals("")) {
            errors.add(ri1_error);
        }
        String ri2_error = _validateRi2(ri2);
        if(!ri2_error.equals("")) {
            errors.add(ri2_error);
        }
        String ri3_error = _validateRi3(ri3);
        if(!ri3_error.equals("")) {
            errors.add(ri3_error);
        }
        String ri4_error = _validateRi4(ri4);
        if(!ri4_error.equals("")) {
            errors.add(ri4_error);
        }
        String ri5_error = _validateRi5(ri5);
        if(!ri5_error.equals("")) {
            errors.add(ri5_error);
        }
        String ri6_error = _validateRi6(ri6);
        if(!ri6_error.equals("")) {
            errors.add(ri6_error);
        }
        String ri7_error = _validateRi7(ri7);
        if(!ri7_error.equals("")) {
            errors.add(ri7_error);
        }
        String ri8_error = _validateRi8(ri8);
        if(!ri8_error.equals("")) {
            errors.add(ri8_error);
        }
        String ri9_error = _validateRi9(ri9);
        if(!ri9_error.equals("")) {
            errors.add(ri9_error);
        }
        String ri10_error = _validateRi10(ri10);
        if(!ri10_error.equals("")) {
            errors.add(ri10_error);
        }

        return errors;
    }

    private static String _validateRi1(RecipeIngredient ri1) {
        if(ri1 == null) {
            return "材料1を選択してください。";
        }
        if(ri1.getVol() == null || ri1.getVol().equals("")) {
            return "材料1の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi2(RecipeIngredient ri2) {
        if(ri2 == null) {
            return "材料2を選択してください。";
        }
        if(ri2.getVol() == null || ri2.getVol().equals("")) {
            return "材料2の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi3(RecipeIngredient ri3) {
        if(ri3 != null && (ri3.getVol() == null || ri3.getVol().equals(""))) {
            return "材料3の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi4(RecipeIngredient ri4) {
        if(ri4 != null && (ri4.getVol() == null || ri4.getVol().equals(""))) {
            return "材料4の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi5(RecipeIngredient ri5) {
        if(ri5 != null && (ri5.getVol() == null || ri5.getVol().equals(""))) {
            return "材料5の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi6(RecipeIngredient ri6) {
        if(ri6 != null && (ri6.getVol() == null || ri6.getVol().equals(""))) {
            return "材料6の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi7(RecipeIngredient ri7) {
        if(ri7 != null && (ri7.getVol() == null || ri7.getVol().equals(""))) {
            return "材料7の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi8(RecipeIngredient ri8) {
        if(ri8 != null && (ri8.getVol() == null || ri8.getVol().equals(""))) {
            return "材料8の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi9(RecipeIngredient ri9) {
        if(ri9 != null && (ri9.getVol() == null || ri9.getVol().equals(""))) {
            return "材料9の分量を入力してください。";
        }

        return "";
    }

    private static String _validateRi10(RecipeIngredient ri10) {
        if(ri10 != null && (ri10.getVol() == null || ri10.getVol().equals(""))) {
            return "材料10の分量を入力してください。";
        }

        return "";
    }

}
