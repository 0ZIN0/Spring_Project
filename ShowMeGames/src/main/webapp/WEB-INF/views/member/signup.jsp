<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/member/signup" var="resource"/>
<c:url value="/resources/img/member" var="img"/>
<c:url value="/resources/img/logo" var="logo_img" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
    <link rel="stylesheet" href="${resource}/signup.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <!-- naver sdk -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
    <div id="reg_main">
        <div id="reg_banner">
            <img src="${logo_img}/smg_mainLogo.png" alt="배너사진">
        </div>
        <div id="reg_header">
            <span>계정생성</span>
            <span>
                <a href="./login">로그인</a>
            </span>
        </div>
        <form action="./signup" id="signup" method="POST">
            <div id="reg_content">
                <div id="email_input_div" class="reg_input_div">
                    <span class="reg_input_header">이메일 입력</span>
                    <div>
                        <span class="material-icons-outlined">person</span>
                        <input type="text" id="reg_input_id" name="user_id" class="reg_input" required />
                    </div>
                </div>
                <div id="email_confirm" class="confirm_div"></div>
                
				<div id="email-accDiv">
                	<span class="accordion">이메일규정</span>
                	<button id="email-chkBtn" type="button">중복검사</button>
                </div>
                <div class="acc_panel">
                    <ul>
                        <li>글자(A-Z, a-z), 숫자(0-9), 밑줄(_), 대시(-), 온점(.)만 사용할 수 있습니다.</li>
                        <li>이메일은 사이트 로그인시에 아이디로 사용됩니다.</li>
                    </ul>
                </div>
                
                <div class="reg_input_div">
                    <span class="reg_input_header">패스워드 입력</span>
                    <div>
                        <span class="material-icons-outlined">lock</span>
                        <input type="password" id="reg_input_pwd" name="user_pw" class="reg_input" required />
                    </div>
                </div>
                <div class="confirm_div"></div>

                <span class="accordion">패스워드 규정</span>
                <div class="acc_panel">
                    <ul>
                        <li>반드시8~16자 이내여야 함</li>
                        <li>최소 소문자 1개 포함</li>
                        <li>최소 대문자 1개 포함</li>
                        <li>최소 숫자 1개 포함</li>
                        <li>최소 특수문자 1개 포함</li>
                        <li>사용자 이름 포함하지 말 것</li>
                    </ul>
                </div>        

                <div class="reg_input_div">
                    <span class="reg_input_header">사용자이름 입력</span>
                    <div>
                        <span class="material-icons-outlined">badge</span>
                        <input type="text" id="reg_input_name" name="user_name" class="reg_input" required />
                    </div>
                </div>
                <div class="confirm_div"></div>
                <span class="accordion"></span>

                <div class="reg_input_div">
                    <span class="reg_input_header">휴대전화번호 입력</span>
                    <div>
                        <span class="material-icons-outlined">smartphone</span>
                        <input type="text" id="reg_input_phone" name="phone_number" class="reg_input" required />
                    </div>
                </div>
                <div class="confirm_div">전화번호를 확인하세요</div>

                <span class="accordion"> 전화번호 규정 </span>
                <div class="acc_panel">
                    <ul>
                        <li>010으로 시작해야함</li>
                        <li>대시(-)를 포함하여 13자리여야함</li>
                    </ul>
                </div>                            

                <div class="reg_input_div">
                    <span class="reg_input_header">닉네임 입력</span>
                    <div>
                        <span class="material-icons-outlined">account_circle</span>
                        <input type="text" id="reg_input_nick" name="nick_name" class="reg_input" required />
                    </div>
                </div>
                <div class="confirm_div"></div>

                <span class="accordion">닉네임 규정</span>
                <div class="acc_panel">
                    <ul>
                        <li>3~15자 사이로 작성해야 합니다.</li>
                        <li>숫자, 영어, 한글, 대시(-), 밑줄(_)만 입력 가능합니다</li>
                        <li>남들에게 보여지는 이름입니다</li>
                    </ul>
                </div>   
				
				<div id="birth_gender_div">
	                <div class="reg_input_div">
	                    <span id="birth_header" class="reg_input_header">생년월일 선택</span>
	                    <div>
	                        <span class="material-icons-outlined">cake</span>
	                        <input type="date" id="birth_input" name="birth_date" required>
	                    </div>
	                </div>
	                <div id="gender_input_div">
	                    <span id="gender_header" class="gender_input_header">성별 선택</span>
	                    <div id="gender_input">
	                    	<span class="material-icons-outlined">male</span>
	                    	<span class="material-icons-outlined">female</span>
	                    	<div id="gender_ratio">
	                            <input type="radio" id="genderChoice1" name="gender" value="1">
							    <label for="genderChoice1">남</label>
							    <input type="radio" id="genderChoice2" name="gender" value="2">
							    <label for="genderChoice2">여</label>
							    <input type="radio" id="genderChoice3" name="gender" value="0">
							    <label for="genderChoice3">미응답</label>
						    </div>
	                    </div>
	                </div>
				</div>
                <div class="confirm_div">생년월일을 선택하세요</div>
				
                <div class="reg_checkbox_div">  
                    <input id="terms_agree" type="checkbox"/>
                    <label for="terms_agree">쇼미게임즈의 이용 약관 및 판매 약관을 이해했으며, 개인정보처리방침에 동의합니다.</label>
                </div>
                
	            <input type="hidden" id="social_key" name="social_key">    
                <input type="hidden" name="login_type" value="smg"/>
                <button class="reg_btn">쇼미게임즈 계정 만들기</button>
			</div>
        </form>
		<div id="naverIdLogin"></div>
		<button id="replaceNaverBtn" class="reg_btn" type="button">네이버로 계정 만들기</button>
	</div>

    <script src="${resource}/signup.js"></script>
    <script src="${resource}/naverLogin.js"></script>
</body>
</html>