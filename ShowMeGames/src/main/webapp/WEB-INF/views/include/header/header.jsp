<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="conPath" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<header>
   <div id="header-top">
      <div>
         <ul class="header-top-menu" id="header-top-ul">
            <li class="clickable-li" onclick="window.location.href='${conPath}'">
               <a id="logo-btn" href="${conPath}"></a> 로고
            </li>
            <li class="clickable-li" onclick="window.location.href='${conPath}'">
               <a id="game-btn" href="${conPath}"></a> 게임
            </li>
            <li class="clickable-li"
               onclick="window.location.href='${conPath}customer/notice'"><a
               id="notices-btn" href="${conPath}customer/notice"></a> 공지 사항</li>
            <li class="clickable-li"
               onclick="window.location.href='${conPath}customer/faq'"><a
               id="customer-btn" href="${conPath}customer/faq"></a> 고객 지원</li>
            <li></li>

            <li class="clickable-li" id="login-li"
                onclick="openLoginPopup()"
               onmouseover="changeIconColor('login-icon', 'white')"
               onmouseout="changeIconColor('login-icon', '#a1a1a1')"><i
               class="fa-solid fa-circle-user fa-xl" id="login-icon"
               style="color: #a1a1a1;"></i> <a id="login-btn"
               ></a>로그인</li>
         </ul>
      </div>
      <div id="header-top-underline">
         <ul id="header-top-ul-underline">
            <li></li>
            <li id="game-btn-underline"></li>
            <li id="notices-btn-underline"></li>
            <li id="customer-btn-underline"></li>
            <li></li>
            <li></li>
         </ul>

      </div>
   </div>
   <div id="header-bottom" class="header-bottom-up">
      <div id="header-bottom-logo">로고</div>
      <div>
         <ul id="header-bottom-ul">
            <li class="title-div">
               <div class="header-bottom-btn" id="category">
                  <div>카테고리</div> 
               <div>
                  <span class="material-symbols-outlined">
                     expand_more
                  </span>
               </div>
               </div>
               <ul id="category-li" class="sub-ul">
                  <li onclick="location.href='${conPath}category/best-sellers'"><a>베스트
                        셀러</a></li>
                  <li onclick="location.href='${conPath}category/chanwoo-pick'"><a>Chanwoo
                        Pick</a></li>
                  <li onclick="location.href='${conPath}category/latest-releases'"><a>최신
                        출시작</a></li>
                  <li onclick="location.href='${conPath}category/gicheol-pick'"><a>Gicheol
                        Pick</a></li>
                  <li onclick="location.href='${conPath}category/free-games'"><a>무료
                        게임</a></li>
                  <li onclick="location.href='${conPath}category/jaehun-pick'"><a>Jaehun
                        Pick</a></li>
                  <li onclick="location.href='${conPath}category/sale-games'"><a>할인중인
                        게임</a></li>
                  <li onclick="location.href='${conPath}category/roa-pick'"><a>Roa
                        Pick</a></li>
                  <li></li>
                  <li onclick="location.href='${conPath}category/yeoungmin-pick'"><a>Yeoungmin
                        Pick</a></li>
                  <li></li>
                  <li onclick="location.href='${conPath}category/gitae-pick'"><a>Gitae
                        Pick</a></li>
               </ul>
            </li>
            <li class="title-div">
            <div class="header-bottom-btn" id="header-genre">
               <div>장르</div> 
               <div>
                  <span class="material-symbols-outlined">
                     expand_more
                  </span>
               </div>
            </div>
               <ul id="genre-li" class="sub-ul">
                  <li onclick="location.href='${conPath}genre/rpg'"><a>RPG</a></li>
                  <li onclick="location.href='${conPath}genre/action-adventure'"><a>액션
                        / 어드벤처</a></li>
                  <li onclick="location.href='${conPath}genre/casual'"><a>캐주얼</a></li>
                  <li onclick="location.href='${conPath}genre/shooter-fps'"><a>슈팅
                        / FPS</a></li>
                  <li onclick="location.href='${conPath}genre/strategy-simulation'"><a>전략
                        / 시뮬</a></li>
                  <li onclick="location.href='${conPath}genre/puzzle'"><a>퍼즐</a></li>
                  <li onclick="location.href='${conPath}genre/multi-coop'"><a>멀티
                        / 협동</a></li>
                  <li onclick="location.href='${conPath}genre/racing'"><a>레이싱</a></li>
                  <li onclick="location.href='${conPath}genre/sports'"><a>스포츠</a></li>
               </ul>
            </li>
            <li class="title-div"><div class="header-bottom-btn" id="editor">
               <div>큐레이터 추천</div> 
               <div>
                  <span class="material-symbols-outlined">
                     expand_more
                  </span>
               </div></div>
               <ul id="editor-pink-li" class="sub-ul">
                  <li><a>젤다의 전설</a></li>
                  <li><a>슬레이 서 스파이어</a></li>
                  <li><a>마리오 카트</a></li>
                  <li><a>포탈</a></li>
                  <li><a>하프라이프</a></li>
                  <li><a>카운터스트라이크</a></li>
                  <li><a>레인보우6</a></li>
                  <li><a>에이펙스</a></li>
               </ul>
            </li>
            <li><div class="bottom-title" id="header-games-btn" onclick="location.href='${conPath}games'">모든
                  게임 보기</div></li>
         </ul>
      </div>
      <div id="blank"></div>
      <form id="search-form" action="${conPath}search">
         <input type="text" id="search" name="search" placeholder="게임을 검색하세요!"></input>
         <button type="submit" id="submit-btn">
            <i class="fa-solid fa-magnifying-glass"
               style="color: #008aa4; font-size: 25px;"></i>
         </button>
      </form>
      <div id="header-cart" onclick="location.href='${conPath}cart'">
         <a class="bottom-title" id="cart-btn" href="${conPath}cart"><i
            id="cart-icon" class="fa-solid fa-cart-shopping"></i>장바구니</a>
      </div>
   </div>
</header>