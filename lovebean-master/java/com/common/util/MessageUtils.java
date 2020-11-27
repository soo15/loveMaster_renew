package com.common.util;

import java.util.Locale;

import org.springframework.context.support.MessageSourceAccessor;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : MessageUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Message  Utility
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class MessageUtils {
    private static MessageSourceAccessor msAcc = null;
     
    public void setMessageSourceAccessor(MessageSourceAccessor msAcc) {
        MessageUtils.msAcc = msAcc;
    }
     
    public static String getMessage(String code) {
        return msAcc.getMessage(code, Locale.getDefault());
    }
     
    public static String getMessage(String code, Object[] objs) {
        return msAcc.getMessage(code, objs, Locale.getDefault());
    }
}