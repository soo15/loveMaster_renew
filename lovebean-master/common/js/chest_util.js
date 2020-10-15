/* ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : chest_util.js
 * Author      : Chest Front
 * Date        : 2019. 9. 16.
 * Description : [ Common JS ] Common Utility JS
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 16.    Chest Front      Initial Release
 * CH_01
 **************************************************************************************************/
/*******************************************************
 * NULL Check !!
 *
 * @param {string} str
 * @returns {string} str
 * @description :  NULL Check !!
 *******************************************************/
function gf_isNull(str){
    if(str == null || str == "undefined" || str == "null" || str == "NULL" || str == "")
        return true;
    else
        return false;
}

/*******************************************************
 * NULL TO String return !!
 *
 * @param {string} str
 * @returns {string} str
 * @description :  NULL TO String return
 *******************************************************/
function gf_getNullToString(str){
    return gf_isNull(str) ? "" : str;
}

/***********************************************************************
 * 체크 관련 함수
 **********************************************************************/
/*******************************************************
 * Browser 종류 !!
 *
 * @returns {string} Browser 종류
 * @description : Browser 종류 !!
 *******************************************************/
function gf_getBrowser(){
    var _ua = navigator.userAgent;

    // IE 11, 10, 9, 8
    var trident = _ua.match(/Trident\/(\d.\d)/i);

    if(trident != null ) {
        if( trident[1] == "7.0" ) return "IE" + 11;
        if( trident[1] == "6.0" ) return "IE" + 10;
        if( trident[1] == "5.0" ) return "IE" + 9;
        if( trident[1] == "4.0" ) return "IE" + 8;
    }

    // IE 7
    if(navigator.appName == "Microsoft Internet Explorer"){
        return "IE" + 7;
    }

    // other
    var agt = _ua.toLowerCase();

    if (agt.indexOf("chrome")      != -1) return "Chrome";
    if (agt.indexOf("opera")       != -1) return "Opera";
    if (agt.indexOf("staroffice")  != -1) return "Star Office";
    if (agt.indexOf("webtv")       != -1) return "WebTV";
    if (agt.indexOf("beonex")      != -1) return "Beonex";
    if (agt.indexOf("chimera")     != -1) return "Chimera";
    if (agt.indexOf("netpositive") != -1) return "NetPositive";
    if (agt.indexOf("phoenix")     != -1) return "Phoenix";
    if (agt.indexOf("firefox")     != -1) return "Firefox";
    if (agt.indexOf("safari")      != -1) return "Safari";
    if (agt.indexOf("skipstone")   != -1) return "SkipStone";
    if (agt.indexOf("netscape")    != -1) return "Netscape";
    if (agt.indexOf("mozilla/5.0") != -1) return "Mozilla";
}

/*******************************************************
 * Device 구분 (pc or mobile) !!
 *
 * @returns {string} pc or mobile
 * @description : Device 구분 (pc or mobile) !!
 *******************************************************/
function gf_getDevice(){
    var device = "";

    /*==================================================
     * PC 일 경우 가능한 값
     *
     * Win16 : 16비트 윈도위기반 컴퓨터
     * Win32 : 32비트 윈도위기반 컴퓨터
     * Win64 : 64비트 윈도위기반 컴퓨터
     * MacIntel : 인텔CPU 를 가진 매킨토시 컴퓨터
     * Mac : 매킨토시컴퓨터
     ==================================================*/
    var filter = "win16|win32|win64|macintel|mac";

    if( navigator.platform) {
        if(filter.indexOf(navigator.platform.toLowerCase()) < 0) {
            device = "mobile";
        } else {
            device = "pc";
        }
    }

    return device;
}

/*******************************************************
 * Device Type 구분 (android or ios) !!
 *
 * @returns {string} android or ios
 * @description : Device Type 구분 (android or ios) !!
 *******************************************************/
function gf_getDeviceType(){
    var deviceType = "";

    var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기

    if (varUA.match("android") != null) {
        deviceType = "android";
    } else if (varUA.indexOf("iphone") > -1 || varUA.indexOf("ipad") > -1 || varUA.indexOf("ipod") > -1) {
        deviceType = "ios";
    }

    return deviceType;
}


/*******************************************************
 * 업로드 파일 확장자 체크 !!
 *
 * @param {string} file
 * @param {string} chkOpt (img or file)
 * @returns {string} PC or Mobile
 * @description : Device Type 구분 (Android or ios) !!
 *******************************************************/
function gf_isFileType(file, chkOpt){
    if(gf_isNull(file) || gf_isNull(chkOpt)){
        return false;
    }

    var imgArayy  = ["bmp","png","jpg","jpeg","gif"];
    var fileArray = ["xls","xlsx","ppt","pptx","doc","docx","txt","hwp","pdf","zip"];


    var chkArray = chkOpt == "img" ? imgArayy : $.merge(imgArayy, fileArray);


    var ext = file.substring(file.lastIndexOf(".") + 1, file.length);
        ext = ext.toLowerCase();

    if($.inArray(ext, chkArray) == -1){
        var imgMgg  = "이미지 파일을 선택해주세요.\n[ bmp, png, jpg, jpeg, gif ]";
        var filemsg = "업로드 가능한 파일을 선택해주세요.\n[ Excel, PowerPoint, Word, hwp, txt, pdf 그외  이미지 파일 ]";

        var alertMsg = chkOpt == "img" ? imgMgg : filemsg;

        alert(alertMsg);
        return false;
    }

    return true;
}


/***********************************************************************
 * 문자열 관련 함수
 **********************************************************************/
/*******************************************************
 * 반올림 !!
 *
 * @param {int} val : 값
 * @param {int} precision : 자리수
 * @returns {int} 반올림 값
 * @description : 반올림 값 return
 *******************************************************/
function gf_round(val, precision){
    var p = Math.pow(10, precision);

    return Math.round(val * p) / p;
}

/*******************************************************
 * 올림 !!
 *
 * @param {int} val : 값
 * @param {int} precision : 자리수
 * @returns {int} 올림 값
 * @description : 올림 값 return
 *******************************************************/
function gf_ceil(val, precision){
    var p = Math.pow(10, precision);

    return Math.ceil(val * p) / p;
}

/*******************************************************
 * 내림 !!
 *
 * @param {int} val : 값
 * @param {int} precision : 자리수
 * @returns {int} 내림 값
 * @description : 내림 값 return
 *******************************************************/
function gf_floor(val, precision){
    var p = Math.pow(10, precision);

    return Math.floor(val * p) / p;
}

/*******************************************************
 * 숫자 3자리마다 comma 찍기 !!
 *
 * @param {int} val : 값
 * @returns {string} comma 가 찍힌 값
 * @description : comma 가 찍힌 값 return
 *******************************************************/
function gf_comma(val) {
    if(!isNaN(val)){
        var strVal = val.toString();

        if(strVal.indexOf(".") >= 0){
            var arrVal = val.toString().split(".");

            var integerVal = arrVal[0];
            var decimalVal = arrVal[1];

            var newVal = integerVal.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,') + "." + decimalVal;

            return newVal;
        } else {
            return strVal.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,');
        }
    } else {
        return val;
    }
}

/*******************************************************
 * String Byte 수 return !!
 *
 * @param {string} str
 * @returns {int} cnt
 * @description : String Byte 수 return
 *******************************************************/
function gf_getStrByte(str){
    var cnt = 0;

    for(i=0;i < str.length; i++){
        if(str.substr(i,1) > String.fromCharCode("255")) {
            cnt = cnt + 2;
        } else {
            cnt++;
        }
    }

    return cnt;
}

/*******************************************************
 * format 맞추기 !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : format 맞추기
 *******************************************************/
function gf_toMask(data, mask) {
    var data   = data.replace(/[^a-z|^A-Z|^\d]/g,'');
    var len    = data.length;
    var result = "";
    var j = 0;

    for(var i = 0; i < len; i++){
        result += data.charAt(i);

        j++;

        if (j < mask.length && "-:|/.".indexOf(mask.charAt(j)) != -1 )
            result += mask.charAt(j++);
    }

    return result;
}

/*******************************************************
 * 전화번호 포맷 맞추기 !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : format 맞추기
 *******************************************************/
function gf_toTel(str) {
    var data = str.replace(/[^\d]/g, "");

    var mask = "";

    if(data.substr(0,2) == "02") {
      mask = data.length == 9 ? "99-999-9999" : "99-9999-9999";
    } else {
        if(data.length == 8){
            mask = "9999-9999";
        } else if(data.length == 10){
            mask = "999-999-9999";
        } else if(data.length == 11){
            mask = "999-9999-9999";
        } else {
            mask = "9999-9999-9999";
        }
    }

    return gf_toMask(data, mask);
}

/*******************************************************
 * 사업자등록번호 포맷 맞추기 !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : format 맞추기
 *******************************************************/
function gf_toCorp(str) {
    var data = str.replace(/[^\d]/g, "");

    //var mask = "999-999-99999";
    var mask = "999-99-99999";

    return gf_toMask(data, mask);
}

/*******************************************************
 * 주민등록번호 포맷 맞추기 !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : format 맞추기
 *******************************************************/
function gf_toJumin(str) {
    var data = str.replace(/[^\d]/g, "");

    var mask = "999999-9999999";

    return gf_toMask(data, mask);
}

/*******************************************************
 * Input Event 설정 : 숫자만 가능하게 처리 !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : Input Event 설정 : 숫자만 가능하게 처리 !!
 *******************************************************/
function gf_keyNumber(targetId){
    $("#" + targetId + " ._number").on("keyup", function(e){
        e.preventDefault();

        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
    });
}

/*******************************************************
 * Input Event 설정 : 숫자만 가능하게 처리 (소수점 포함) !!
 *
 * @param {string} data
 * @returns {string} mask
 * @description : Input Event 설정 : 숫자만 가능하게 처리 !!
 *******************************************************/
function gf_keyNumberPoint(targetId){
    $("#" + targetId + " ._numberpoint").on("keyup", function(e){
        e.preventDefault();

        $(this).val($(this).val().replace(/[^0-9.]/gi, ""));
    });
}

/*******************************************************
 * ID Cast !!
 *
 * @param   {string} str : Control ID
 * @returns : N/A
 * @description ID Cast [ ex) comCd ==> COM_CD ] !!
 *******************************************************/
function gf_castIdString(str, sep){
    var returnVal = "";

    str = str.replace(/-./g, "");
    sep = sep == null ? 0 : sep;

    if(sep > 0){
        var tmpStr = str.substring(0, sep + 1).toLowerCase();
        str = tmpStr.substring(sep) + str.substring(sep + 1);
    }

    var strBool = new RegExp('[A-Z]');
    var chars   = "abcdefghijklmnopqrstuvwxyz123456789";

    if(strBool.test(str)){
       for (var inx=0; inx<str.length; inx++) {
           if(chars.indexOf(str.charAt(inx)) == -1){
               returnVal += "_" + str.charAt(inx).toLowerCase();
           } else {
               returnVal += str.charAt(inx);
           }
       }
    } else {
        returnVal = str;
    }

    return returnVal.toUpperCase();
}

/*******************************************************
 * ID Cast !!
 *
 * @param   {string} str : Control ID
 * @returns : N/A
 * @description ID Cast [ ex) COM_CD ==> comCd ] !!
 *******************************************************/
function gf_castFieldString(str){
    var returnVal = "";

    str = str.replace(/-./g, "").toLowerCase();

    var strBool = new RegExp('[a-z]');
    var chars   = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";

    if(strBool.test(str)){
       for (var inx=0; inx<str.length; inx++) {
           if(str.charAt(inx) == "_"){
               returnVal += str.charAt(inx+1).toUpperCase();

               inx++;
           } else {
               returnVal += str.charAt(inx);
           }
       }
    } else {
        returnVal = str;
    }

    return returnVal.replace(/_/g, "");
}

/*******************************************************
 * 주민번호 체크 !!
 *
 * @param   {string}  : str
 * @returns {boolean} : true/false
 * @description : 주민번호 체크 !!
 *******************************************************/
function gf_isJuminNo(str) {
    if(str == null || str == ""){
        return false;
    }

    var regJumin = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-6][0-9]{6}$/;

    str = str.replace(/-/g, "");

    return str.length == 13 && regJumin.test(str) ? true : false;
}

/*******************************************************
 * 사업자등록번호 체크 !!
 *
 * @param   {string}  : str
 * @returns {boolean} : true/false
 * @description : 주민번호 체크 !!
 *******************************************************/
function gf_isCorp(str) {
    if(str == null || str == ""){
        return false;
    }

    var data = str.replace(/[^\d]/g,'');

    if(data.length != 10){
        return false;
    }

    var comp = new Array(9);
    var stnd = new Array(8);
    var strStnd = '137137135';

    for(var i=0; i<10; i++)
        comp[i] = data.substring(i, i+1);

    for(var i=0; i<9; i++)
        stnd[i] = strStnd.substring(i, i+1);

    for(var sum=0, i=0; i<9; i++)
        sum += comp[i] * stnd[i];

    sum = sum + parseInt((data.substring(8, 9) * 5) / 10);

    var mod =  10 - (sum % 10);

    if(mod>=10)
        mod-=10;

    return mod == comp[9] ? true : false;
}

/*******************************************************
 * E-Mail 체크 !!
 *
 * @param   {string}  : str
 * @returns {boolean} : true/false
 * @description : E-Mail 체크 !!
 *******************************************************/
function gf_isEmail(str){
    if(str == null || str == ""){
        return false;
    }

    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

    return regEmail.test(str) ? true : false;
}

/*******************************************************
 * 전화번호 체크 : 하이픈(-)이 들어간 상태의 값 !!
 *
 * @param   {string}  : str
 * @returns {boolean} : true/false
 * @description : 전화번호 체크 : 하이픈(-)이 들어간 상태의 값 !!
 *******************************************************/
function gf_isTel(str){
    if(str == null || str == ""){
        return false;
    }

    if(str.indexOf("-") < 0){
        str = gf_toTel(str.replace(/-/g, ""));
    }

    var regPhone = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;

    return regPhone.test(str) ? true : false;
}