package com.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.common.config.GlobalConstants;
import com.common.config.PropertyConfig;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : FileUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] File Utility
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public class FileUtils {
	public static Logger logger = LoggerFactory.getLogger(FileUtils.class);

    /**
     * File Upload 후 Information Return !!
     * @param multipartRequest
     * @param paramMap
     * @param fileUploadLimitSzie
     * @return Map<String, Object>
     * @throws Exception
     */
    public static Map<String, Object> fileUploadMap(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String fileUploadPath) throws Exception {
        return fileUploadMap(multipartRequest, paramMap, fileUploadPath, false);
    }

    @SuppressWarnings("rawtypes")
    public static Map<String, Object> fileUploadMap(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String fileUploadPath, boolean overWriteBool) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        int uploadCnt = paramMap.get("uploadCnt") == null ? 1 : Integer.parseInt(paramMap.get("uploadCnt"));
        String g_file_type = PropertyConfig.getPropertiesCon("properties/chest", "file.attach.type");
        long fileUploadLimitSize = Long.parseLong(PropertyConfig.getPropertiesCon("properties/chest", "file.attach.maxsize"));

        String[] arrLogcFileNm = new String[uploadCnt];
        String[] arrPhycFileNm = new String[uploadCnt];
        String[] arrFileSize   = new String[uploadCnt];
        String[] arrFileType   = new String[uploadCnt];
        String[] arrFileNmNum  = new String[uploadCnt];

        String upfileNm = "";

        Iterator it = multipartRequest.getFileNames();

        int upFileCnt = 0;

        try {
            while(it.hasNext()){
                upfileNm = (String) it.next();

                // File Upload
                if(!multipartRequest.getFile(upfileNm).isEmpty()){
                    MultipartFile file = multipartRequest.getFile(upfileNm);

                    Calendar cal = Calendar.getInstance();

                    String fileName    = file.getOriginalFilename();    // 파일 이름
                    long fileSize      = file.getSize();                // File Size

                    String fileType    = fileName.substring(fileName.lastIndexOf("."), fileName.length());  // 확장자
                    String preFileNm   = fileName.substring(0,fileName.lastIndexOf("."));                   // 확장자를 제외한 파일 이름
                    String replaceName = preFileNm + "_" + cal.getTimeInMillis() + fileType;                // 파일 이름 재 설정
                    
                    boolean checkFileType = true;
                    if(g_file_type.indexOf(fileType.substring(1)) < 0)
                    	checkFileType = false;
                    
                    // 확장자 체크
                    if(!checkFileType) {
                    	resMap.put("uploadCnt",      "0");
                    	resMap.put("uploadFailType", "1001");
                    	resMap.put("fileSize",       arrFileSize);
                    	return resMap;
                    	
                    }                    
                    // 파일명 체크
                    Pattern pattern = Pattern.compile("[!@#$%^&*(),.?\":;{}|<>-]");
                    if(pattern.matcher(preFileNm).find()) {
                    	resMap.put("uploadCnt",      "0");
                    	resMap.put("uploadFailType", "1002");
                    	resMap.put("fileSize",       arrFileSize);
                    	return resMap;
                    }
                    // 파일크기 체크
                    if(fileSize > 0 && (file.getSize() < fileUploadLimitSize || fileUploadLimitSize == -1 )){
                        fileUploadDetail(file, fileUploadPath, overWriteBool ? fileName : replaceName);
                    } else {
                        //break;
                    	resMap.put("uploadCnt",      "0");
                    	resMap.put("uploadFailType", "1003");
                    	resMap.put("fileSize",       arrFileSize);
                    	return resMap;
                    }
                    

                    arrLogcFileNm[upFileCnt] = replaceName;
                    arrPhycFileNm[upFileCnt] = fileName;
                    arrFileSize[upFileCnt]   = String.valueOf(fileSize);
                    arrFileType[upFileCnt]   = fileType;
                    arrFileNmNum[upFileCnt]  = upfileNm;

                    upFileCnt++;
                } else {
                	MultipartFile file = multipartRequest.getFile(upfileNm);
                	String fileName    = file.getOriginalFilename();
                	long fileSize      = file.getSize();
            		 
            		if(!StringUtils.isNull(fileName) && fileSize == 0) {
            			resMap.put("uploadCnt",      "0");
            			resMap.put("uploadFailType", "1004");
            			resMap.put("fileSize",       arrFileSize);
            			return resMap;
            		}
                }
            }
            resMap.put("uploadFailType", ""+uploadCnt);
            resMap.put("uploadCnt",      ""+uploadCnt);     // Upload Count
            resMap.put("fileUploadPath", fileUploadPath);   // File Upload Path
            resMap.put("logcFileNm",     arrLogcFileNm);    // Logical File Name
            resMap.put("phycFileNm",     arrPhycFileNm);    // Physical File Name
            resMap.put("fileSize",       arrFileSize);      // File Size
            resMap.put("fileType",       arrFileType);      // File Type (확장자)
            resMap.put("fileNmNum",      arrFileNmNum);     // Input File Name (upload input name)
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return resMap;
    }

    /**
     * File Upload 만 원할 시 !!
     * @param multipartRequest
     * @param paramMap
     * @param fileUploadLimitSzie
     * @return int
     * @throws Exception
     */
    public static int fileUpload(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String fileUploadLimitSzie) throws Exception {
        return fileUpload(multipartRequest, paramMap, fileUploadLimitSzie, -1);
    }

    @SuppressWarnings("rawtypes")
    public static int fileUpload(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String fileUploadPath, long fileUploadLimitSzie) throws Exception {
        int uploadCnt = 0;

        String upfileNm = "";

        Iterator it = multipartRequest.getFileNames();

        try {
            while(it.hasNext()){
                upfileNm = (String) it.next();

                if(!multipartRequest.getFile(upfileNm).isEmpty()){
                    MultipartFile file = multipartRequest.getFile(upfileNm);

                    Calendar cal = Calendar.getInstance();

                    String fileName    = file.getOriginalFilename();
                    String fileType    = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                    String preFileNm   = fileName.substring(0,fileName.lastIndexOf("."));
                    String replaceName = preFileNm+"_"+cal.getTimeInMillis() + fileType;

                    // 파일크기 체크
                    if(fileUploadLimitSzie == -1){
                        if(file.getSize() > 0){
                            fileUploadDetail(file, fileUploadPath, replaceName);
                        } else {
                            break;
                        }
                    } else {
                        if(file.getSize() > 0 && file.getSize() < fileUploadLimitSzie ){
                            fileUploadDetail(file, fileUploadPath, replaceName);
                        } else {
                            break;
                        }
                    }
                } else {
                    //
                }

                uploadCnt++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return uploadCnt;
    }

    /**
     * Real File Upload
     * @param fileData
     * @param path
     * @param fileName
     * @throws IOException
     */
    public static void fileUploadDetail(MultipartFile fileData, String path, String fileName) throws IOException {
        long fileSize = fileData.getSize();

        InputStream  is  = null;
        OutputStream out = null;

        try {
            if (fileSize > 0) {
                is = fileData.getInputStream();

                File realUploadDir = new File(path);

                if (!realUploadDir.exists()) { // 경로에 폴더가 존재하지 않으면 생성합니다.
                    realUploadDir.mkdirs();
                }

                out = new FileOutputStream(path + File.separator + fileName);

                FileCopyUtils.copy(is, out); // InputStream에서 온 파일을 outputStream으로 복사
            } else {
                new IOException("잘못된 파일을 업로드 하셨습니다.");
            }
        } finally {
            if (out != null) {
                out.close();
            }

            if (is != null) {
                is.close();
            }
        }
    }

    public static void dirMake(String makeDirName) throws IOException {
        try {
            File dir = new File(makeDirName);

            if(!dir.exists()){
                dir.mkdirs();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * [ Common ] 파일을 복사하는 메소드
     * @param inFileName
     * @param outFileName
     */
    public static void fileCopy(String inFileName, String outFileName) throws IOException {
        try {
            FileInputStream  fis = new FileInputStream(inFileName);
            FileOutputStream fos = new FileOutputStream(outFileName);

            int data = 0;

            while((data=fis.read())!=-1) {
                fos.write(data);
            }

            fis.close();
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * [ Common ] 파일을 이동하는 메소드
     * @param inFileName
     * @param outFileName
     */
    public static void fileMove(String inFileName, String outFileName) throws IOException {
        try {
            FileInputStream  fis = new FileInputStream(inFileName);
            FileOutputStream fos = new FileOutputStream(outFileName);

            int data = 0;

            while((data=fis.read())!=-1) {
                fos.write(data);
            }

            fis.close();
            fos.close();

            // 복사한뒤 원본파일을 삭제함
            fileDelete(inFileName);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * [ Common ] 파일을 삭제하는 메소드
     * @param deleteFileName
     */
    public static void fileDelete(String deleteFileName) {
        try {
            File file = new File(deleteFileName);

            if(file.exists()){
                file.delete();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * [ Common ] 파일을 생성하는 메소드
     * @param makeFileName
     */
    public static void fileMake(String makeFileName) {
        File f1 = new File(makeFileName);

        try {
            f1.createNewFile();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * [ Thumbnail Image 만들기 ]
     * @param orgFilePath : Original Full File Path (파일명을 포함한 전체 경로)
     * @param newFilePath : New File Path (파일 경로만)
     * @param dw : width
     * @param dh : height
     * @throws Exception
     */
    public static String makeGenThumbnail(String orgFilePath) throws Exception {
        return makeThumbnail(orgFilePath, null, GlobalConstants.DEFAULT_THUMB_WIDTH, GlobalConstants.DEFAULT_THUMB_HEIGHT);
    }

    public static String makeGalThumbnail(String orgFilePath) throws Exception {
        return makeThumbnail(orgFilePath, null, GlobalConstants.GALLERY_THUMB_WIDTH, GlobalConstants.GALLERY_THUMB_HEIGHT);
    }

    public static String makeThumbnail(String orginFilePath, int thumbWidth, int thumbHeight) throws Exception {
        return makeThumbnail(orginFilePath, null, thumbWidth, thumbHeight);
    }

    public static String makeThumbnail(String orginFilePath, String newFilePath, int thumbWidth, int thumbHeight) throws Exception {
        String result = "";

        logger.info("=========================== >>>>> Make Thumnail Image Start !!");


        // File 존재 여부 체크 및 파일명과 확장자 분리 작업 !!
        File orginFile = new File(orginFilePath);

        if(!orginFile.exists()) {
            logger.info("=========================== >>>>> Make Thumbnail Exception Message : " + MessageUtils.getMessage("result.thumb.notexists"));
            return MessageUtils.getMessage("result.thumb.notexists");    // 썸네일 생성에 필요한 원본 파일이 존재하지 않습니다.
        }

        String fileType   = orginFilePath.substring(orginFilePath.lastIndexOf("."), orginFilePath.length());    // 확장자
        String preFileNm  = orginFilePath.substring(0,orginFilePath.lastIndexOf("."));                          // 확장자를 제외한 전체 경로
        String upFileType = fileType.toUpperCase();                                                             // 확장자 UpperCase

        // image 홛장자 체크 !!
        if (!(".BMP".equals(upFileType) || ".PNG".equals(upFileType) || ".JPG".equals(upFileType) || ".JPEG".equals(upFileType) || ".GIF".equals(upFileType))) {
            logger.info("=========================== >>>>> Make Thumbnail Exception Message : " + MessageUtils.getMessage("result.thumb.wrong"));
            return MessageUtils.getMessage("result.thumb.wrong");    // 이미지 파일을 선택해주세요.(bmp,png,jpg,jpeg,gif)
        }


        // 저장된 원본파일로부터 BufferedImage 객체 생성 !!
        BufferedImage srcImg = ImageIO.read(orginFile);

        BufferedImage destImg = null;

        if(thumbWidth > 0 && thumbHeight > 0) {
            // 원본 이미지를 원하는 사이즈로 썸네일을 만들려면 아래와 같이 사용
            destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, thumbWidth, thumbHeight);
        } else if(thumbWidth > 0 && thumbHeight == 0) {
            // 원본 이미지를 너비를 기준으로 동릴한 비율을 유지하면서 썸네일을 만들려면 아래와 같이 사용.
            destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, thumbWidth);
        } else if(thumbWidth == 0 && thumbHeight > 0) {
            // 원본 이미지를 농이를 기준으로 동릴한 비율을 유지하면서 썸네일을 만들려면 아래와 같이 사용.
            destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, thumbHeight);
        }

        // Exception 처리 !!
        if(destImg == null) {
            logger.info("=========================== >>>>> Make Thumbnail Exception Message : " + MessageUtils.getMessage("result.thumb.fail"));
            return MessageUtils.getMessage("result.thumb.fail");    // 썸네일 이미지 생성에 실패하였습니다.
        }



        // thumbnail 저장. 원본 이미지 이름 뒤에 "_thumb" 를 붙여 표시 !!
        String thumbFilePath = (StringUtils.isNull(newFilePath) ? preFileNm : newFilePath ) + "_thumb" + fileType;   // 파일 이름 재 설정

        File thumbFile = new File(thumbFilePath);

        ImageIO.write(destImg, upFileType.replace(".", ""), thumbFile);

        logger.info("=========================== >>>>> Make Thumnail Image End !!");

        return result;
    }
}