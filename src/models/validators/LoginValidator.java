package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class LoginValidator {
    public static List<String> validate(User u, String pass1, String pass2, Boolean name_duplicate_check_flag, Boolean email_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();

        String name_error = _validateName(u.getName(), name_duplicate_check_flag);
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String email_error = _validateEmail(u.getEmail(), email_duplicate_check_flag);
        if(!email_error.equals("")) {
            errors.add(email_error);
        }

        String password_error = _validatePassword(pass1, pass2, password_check_flag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    //ユーザー名
    private static String _validateName(String name, Boolean name_duplicate_check_flag) {
        //必須入力チェック
        if(name == null || name.equals("")) {
            return "ユーザー名を入力してください。";
        }

        //すでに登録されているユーザー名との重複チェック
        if(name_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredName", Long.class)
                                       .setParameter("name", name)
                                       .getSingleResult();
            em.close();
            if(users_count > 0) {
                return "入力されたユーザー名はすでに使用されています。";
            }
        }

        return "";
    }

    //メールアドレス
    private static String _validateEmail(String email, Boolean email_duplicate_check_flag) {
        //必須入力チェック
        if(email == null || email.equals("")) {
            return "メールアドレスを入力してください。";
        }

        //すでに登録されているメールアドレスとの重複チェック
        if(email_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredEmail", Long.class)
                                       .setParameter("email", email)
                                       .getSingleResult();
            em.close();
            if(users_count > 0) {
                return "入力されたメールアドレスはすでに使用されています。";
            }
        }

        return "";
    }

    //パスワード
    private static String _validatePassword(String pass1, String pass2, Boolean password_check_flag) {
        //パスワードを変更する場合のみ
        if(password_check_flag) {
            //パスワード欄必須入力チェック
            if(pass1 == null || pass1.equals("")) {
                return "パスワードを入力してください。";
            }

            //パスワード再入力欄必須入力チェック
            if(pass2 == null || pass2.equals("")) {
                return "再入力欄にもパスワードを入力してください。";
            }

            //パスワードと再入力パスワードの一致チェック
            if(!pass1.equals(pass2)) {
                return "パスワードの入力ミスがあります。再度入力してください。";
            }
        }

        return "";
    }

}
