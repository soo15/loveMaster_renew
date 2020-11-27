package com.common.config;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GlobalConstants.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common Configuration ] Global Configuration Constants
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class GlobalConstants {
    /**
     * session Key
     */
    public static final String CHEST_SESSION_KEY = "CHEST_SESSION";
    
    /**
     * General File Path
     */
    public static final String GEN_FILE_PATH = PropertyConfig.getString("gen.filePath");
    
    /**
     * Check Access URL
     */
    public static final String ACCESS_SERVER_NAME = PropertyConfig.getString("access.server.name");
    
    /**
     * Default Thumbnail Image Size
     */
    public static final int DEFAULT_THUMB_WIDTH = 100;
    public static final int DEFAULT_THUMB_HEIGHT = 80;
    
    /**
     * gallery Thumbnail Image Size
     */
    public static final int GALLERY_THUMB_WIDTH = 100;
    public static final int GALLERY_THUMB_HEIGHT = 80;
}