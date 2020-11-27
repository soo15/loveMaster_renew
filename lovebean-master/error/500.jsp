<%@ page pageEncoding="UTF-8" isErrorPage="true" %>
<c:set var="CTX_PATH" value="${pageContext.request.contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>500</title>
<link rel="stylesheet" href="${CTX_PATH}/common/css/ui.base.css">
</head>
<body>
    <div class="base-skip" id="baseSkip"></div>
    <div class="base-layer" id="baseLayer"></div>
    <div class="base-wrap" id="baseWrap">
        <div class="base-body type-error" id="baseBody">
            <div class="error-area">
                <i class="icon-error"></i>
                <p class="error-title">
                    서비스에 <span class="point-color1">접속할 수 없습니다.</span>
                </p>
                <p class="error-txt">
                    현재 기술적인 문제로 인하여 <br>일시적으로 서비스에 접속할 수 없습니다. <br>이용에
                    불편을 드려서 죄송하오며, <br>잠시후, 다시 이용 부탁 드립니다.
                </p>
                <div class="btn-area">
                    <a href="javascript:history.go(-1);" class="btn-base">이전</a>
                    <a href="https://www.chest.or.kr" class="btn-base-imp">홈으로</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>