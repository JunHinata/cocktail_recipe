package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Stock;

public class StockValidator {
    public static List<String> validate(Stock s) {
        List<String> errors = new ArrayList<String>();

        String vol_error = _validateVol(s.getVol());
        if(!vol_error.equals("")) {
            errors.add(vol_error);
        }

        return errors;
    }

    private static String _validateVol(Integer vol) {
        if(vol == null || vol.equals("")) {
            return "在庫容量/個数を入力してください。";
        }

        return "";
    }

}
