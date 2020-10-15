/* ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : chest_date.js
 * Author      : Chest Front
 * Date        : 2019. 9. 16.
 * Description : [ Common JS ] Common JS 
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 16.    Chest Front      Initial Release
 * CH_01   
 **************************************************************************************************/
// 문자열 날짜를 입력받아 Date 형의 객체를 구함.
function gf_getDate(sdate) {
    var arrDate = null;
    
    if(sdate.indexOf(".") > 0)
        arrDate = sdate.split(".");
    
    if(sdate.indexOf("-") > 0)
        arrDate = sdate.split("-");
    
    if(sdate.indexOf("/") > 0)
        arrDate = sdate.split("/");
    
    if(arrDate != null)
        sdate = arrDate.join("");
    
    year  = Number(sdate.substr(0,4));
    month = Number(sdate.substr(4,2));
    day   = Number(sdate.substr(6,2));
    
    return new Date(year, month - 1, day);
}

// Date형 날짜를 입력받아 문자열 날짜를 구함.
function gf_getSDate(date) {
    var year  = date.getFullYear();
    var month = date.getMonth() + 1;
    var day   = date.getDate();
    
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
    
    return ("" + year + month + day);
}

// 문자열 날짜의 일 또는 월, 년도를 더하거나 뺀 날짜를 구함.
function gf_calDate(sdate, filter, add) {
    var date  = gf_getDate(sdate);
    var year  = date.getFullYear();
    var month = date.getMonth();
    var day   = date.getDate();
    
    if(filter == "year")
        year += add;
    else if(filter == "month")
        month += add;
    else if(filter == "day")
        day += add;
    
    return gf_getSDate(new Date(year, month, day));
}

// 문자열 날짜의 일 또는 월, 년도를 더하거나 뺀 날짜를 구함
function gf_calDate2(syear, y, smonth, m, sday, d) {
    var date = new Date(Number(syear) + y, Number(smonth) + m - 1, Number(sday) + d);
    
    return gf_getSDate(date);
}

// 두 날짜의 년 차이 구함
function gf_getYearDiff(sdate1, sdate2){
    var startDate = gf_getDate(sdate1);
    var endDate   = gf_getDate(sdate2);
     
    var yearDiff = endDate.getYear() - startDate.getYear();
    
    return yearDiff;
}

// 두 날짜의 월 차이 구함
function gf_getMonthDiff(sdate1, sdate2){
    var startDate = gf_getDate(sdate1);
    var endDate   = gf_getDate(sdate2);
     
    var yearDiff  = endDate.getYear()  - startDate.getYear();
    var monthDiff = endDate.getMonth() - startDate.getMonth();
     
    var result = yearDiff*12 + monthDiff;
    
    return result;
}

// 현재 일자를 구함. 날짜 포맷은 아님.
function gf_todayStr() {
    var now   = new Date();
    
    var year  = now.getFullYear();
    var month = now.getMonth() + 1;
    var day   = now.getDate();
    
    month = month < 10 ? ("0" + month) : month.toString();
    day   = day   < 10 ? ("0" + day)   : day.toString();
    
    return (year.toString() + month + day);
}

// 현재 일자 구함. 날짜 포맷임.
function gf_today(){
    var args = gf_today.arguments;
    
    var prefix = args.length > 1 ? args[1] : "-";
    
    return gf_formatDate(gf_todayStr(prefix));
}

// 날짜 포맷임. 년월일
function gf_strToKrFormat(strDate, opt){
    var arrDate = gf_formatDate(strDate).split("-");
    
    opt = opt == null ? "ymd" : opt;
    
    if(opt == "y"){
        return (arrDate[0] + "년");
    } else if(opt == "ym"){
        return (arrDate[0] + "년 " + Number(arrDate[1]) + "월");
    } else {
        return (arrDate[0] + "년 " + Number(arrDate[1]) + "월 " + Number(arrDate[2]) + "일");
    }
}


// 현재 일자를 기준으로 몇개월 전/후를 구함. 날짜 포맷은 아님.
function gf_preNextDateStr(){
    var args = gf_preNextDateStr.arguments;
    
    var add    = args[0];
    var filter = args.length > 1 ? args[1] : "month";
    
    return gf_calDate(gf_todayStr(), filter, add);
}

// 현재 일자를 기준으로 몇개월 전/후를 구함. 날짜 포맷임.
function gf_preNextDate(){
    var args = gf_preNextDate.arguments;
    
    var add    = args[0];
    var filter = args.length > 1 ? args[1] : "month";
    
    return gf_formatDate(gf_preNextDateStr(add, filter));
}

// 문자열 날짜를 입력받아 요일을 구함.
function gf_getDayOfWeek(sdate) {
    if(!gf_isValidDate(sdate)){
        return "";
    }
    
    var date = gf_getDate(sdate);
    var day  = date.getDay();
    var week = new Array('일','월','화','수','목','금','토');
    
    return week[day];
}

// 문자열 날짜를 입력받아 요일의 숫자를 구함.
function gf_getDayIntOfWeek(sdate) {
    var date = gf_getDate(sdate);
    var day  = date.getDay();
    
    return day;
}

// 문자열 날짜를 입력받아 해당 월의 마지막날짜를 구함.
function gf_getLastDay(sdate) {
    var date = gf_getDate(sdate);
    
    return gf_calDate2(date.getFullYear(), 0, date.getMonth() + 1, 1, "01", -1);
}

// 현재 년
function gf_getYear(){
    var year = new Date().getFullYear()
    
    return year.toString();
}

// 현재 월
function gf_getMonth(){
    var month = new Date().getMonth() + 1;
    
    return month.toString();
}

// 현재 일
function gf_getDay(){
    var day = new Date().getDate();
    
    return day.toString();
}

// 현재 시간
function gf_getTime() {
    var now = new Date();
    
    var hours   = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    
    return (hours.toString() + minutes + seconds);
}

// 현재 시간
function gf_getHour() {
    var now = new Date();
    
    var hours = now.getHours();
    
    return hours.toString();
}

// 현재 분
function gf_getMinute() {
    var now = new Date();
    
    var minutes = now.getMinutes();
    
    return minutes.toString();
}

// 현재 초
function gf_getSecond() {
    var now = new Date();
    
    var seconds = now.getSeconds();
    
    return seconds.toString();
}

// date 형식으로 만들어 주기
function gf_formatDate(){
    var args = gf_formatDate.arguments;
    
    var val = args[0];
    
    if(val == null || val == ""){
        return "";
    } else {
        val = val.replace(/[^\d]/g, "");
        
        var prefix = args.length > 1 ? args[1] : "-";
        
        var mask = "";
        
        if(val.length == 4){    // 년
            mask = "9999";
        } if(val.length == 6){    // 년-월
            mask = "9999" + prefix + "99";
        } else {                // 년-월-일
            mask = "9999" + prefix + "99" + prefix + "99";
        }
        
        return gf_toMask(val, mask);
    }
}

// 날짜 유효성 체크
function gf_isValidDate(param) {
    try {
        param = param.replace(/-/g, "").replace(/\./g, "");
        
        //년월인경우 유효성 체크를 위해 01을 붙여줌
        if(param.length == 6)
            param += "01";
        
        // 자리수가 맞지않을때
        if(isNaN(param) || param.length != 8) {
            return false;
        }
        
        var year  = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day   = Number(param.substring(6, 8));
        
        var dd = day / 0;
        
        
        if(month < 1 || month > 12) {
            return false;
        }
        
        var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var maxDay = maxDaysInMonth[month-1];
        
        // 윤년 체크
        if(month == 2 && ( year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
            maxDay = 29;
        }
        
        if(day <= 0 || day > maxDay) {
            return false;
        }
        return true;
        
    } catch (err) {
        return false;
    }
}