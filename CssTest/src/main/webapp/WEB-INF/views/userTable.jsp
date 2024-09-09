<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/header.jsp" %>

<%@ include file="/include/ChatBot.jsp" %>

<c:choose>
	<c:when test="${not empty loggedInUser}">
		<c:choose>
			<c:when test="${userRole == 1}">
				<div style="width: 1200px; margin: auto;">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">회원 번호</th>
					      <th scope="col">닉네임</th>
					      <th scope="col">아이디</th>
					      <th scope="col">주소</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					  	<c:forEach items="${list}" var="list">
					  		<tr>
						      <th scope="row">${list.userNo}</th>
						      <td>${list.nickname}</td>
						      <td>${list.id}</td>
						      <td>${list.address}</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					접근 권한이 없습니다.
					<a href="<c:url value='/'/>" style="text-decoration: none;">메인으로 이동</a>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>
	</body>
</html>