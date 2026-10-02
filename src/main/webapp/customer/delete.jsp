<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Xác nhận xóa</title>
<style>body{font-family:Arial;text-align:center;margin-top:100px;background:#f8fafc}.c{background:white;padding:30px;border-radius:8px;box-shadow:0 4px 6px rgba(0,0,0,0.1);max-width:500px;margin:auto}h2{color:#c0392b}.b{display:inline-block;padding:10px 20px;text-decoration:none;border-radius:4px;font-weight:bold;margin:0 10px;cursor:pointer;border:none}.bc{background:#c0392b;color:white}.bx{background:#bdc3c7;color:#333}</style></head>
<body><div class="c"><h2>XÁC NHẬN XÓA</h2>
<p>Bạn có chắc muốn xóa khách hàng?</p>
<p><strong>${requestScope.customer.name}</strong> - ${requestScope.customer.email}</p>
<form action="${pageContext.request.contextPath}/customers?action=delete" method="POST">
<input type="hidden" name="id" value="${requestScope.customer.id}"/>
<button type="submit" class="b bc">Đồng ý xóa</button>
<a href="${pageContext.request.contextPath}/customers" class="b bx">Hủy</a></form></div></body></html>
