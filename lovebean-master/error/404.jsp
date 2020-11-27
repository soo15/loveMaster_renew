<%@ page pageEncoding="UTF-8" isErrorPage="true" %>
<c:set var="CTX_PATH" value="${pageContext.request.contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>404</title>
<link rel="stylesheet" href="${CTX_PATH}/common/css/ui.base.css">
</head>
<body>
    <div class="base-skip" id="baseSkip"></div>
    <div class="base-layer" id="baseLayer"></div>
    <div class="base-wrap" id="baseWrap">
        <div class="base-body type-error" id="baseBody">
            <div class="error-area">
                <i class="icon-error"></i>
                <p class="error-title">찾으시는 <span class="point-color1">페이지가 없습니다.</span></p>
                <p class="error-txt">찾으시는 페이지가 삭제 또는 변경 되었거나,<br>일시적으로 사용이 중단되었습니다.</p>
                <div class="btn-area">
                    <a href="javascript:history.go(-1);" class="btn-base">이전</a>
                    <a href="https://www.chest.or.kr" class="btn-base-imp">홈으로</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>