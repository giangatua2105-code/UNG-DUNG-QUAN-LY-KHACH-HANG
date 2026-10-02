<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Tạo khách hàng</title>
<style>body{font-family:Arial;margin:30px;background:#f8fafc}.c{background:white;padding:30px;border-radius:8px;box-shadow:0 4px 6px rgba(0,0,0,0.1);max-width:500px;margin:auto}h2{color:#1b2a7a;text-align:center}label{display:block;margin-bottom:5px;font-weight:bold}input{width:100%;padding:10px;border:1px solid #ccc;border-radius:4px;box-sizing:border-box;margin-bottom:15px}.b{background:#27ae60;color:white;padding:10px 20px;border:none;border-radius:4px;cursor:pointer;font-weight:bold;width:100%}.l{display:block;text-align:center;margin-top:15px;color:#1b2a7a;text-decoration:none}.m{background:#e8f5e9;color:#27ae60;padding:10px;border-radius:4px;text-align:center;margin-bottom:15px}</style></head>
<body><div class="c"><h2>Tạo Khách Hàng Mới</h2>
<c:if test="${not empty requestScope.message}"><div class="m">${requestScope.message}</div></c:if>
<form action="${pageContext.request.contextPath}/customers?action=create" method="POST">
<label>Họ và Tên:</label><input type="text" name="name" required/>
<label>Email:</label><input type="email" name="email" required/>
<label>Địa chỉ:</label><input type="text" name="address" required/>
<button type="submit" class="b">Lưu khách hàng</button></form>
<a href="${pageContext.request.contextPath}/customers" class="l">Quay lại danh sách</a></div></body></html>
