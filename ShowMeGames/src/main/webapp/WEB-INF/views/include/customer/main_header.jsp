<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <div id="main-header">
            <div id="main-header-img">
                <img src="${faq_img}/Img-header.jpg" alt="헤더이미지">
            </div>
            <div id="main-header-content">
                <div>
                    <h1>무엇을 도와드릴까요?</h1>
                </div>
                <div>
                    <div id="search-container">
                        <form action="${pageContext.request.contextPath}/customer/faq">
                            <input type="text" name="search" placeholder="질문이나 키워드를 적으십시오..."/>
                            <button type="submit"><i class="fa-solid fa-magnifying-glass"style="color: #fff; font-size: 25px;"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>    
