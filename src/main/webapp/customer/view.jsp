<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Chi tiết khách hàng</title>
<style>body{font-family:Arial;margin:30px;background:#f8fafc}.c{background:white;padding:30px;border-radius:8px;box-shadow:0 4px 6px rgba(0,0,0,0.1);max-width:500px;margin:auto}h2{color:#1b2a7a;text-align:center;border-bottom:2px solid #1b2a7a;padding-bottom:10px}td{padding:10px}.lbl{font-weight:bold;color:#555}.lnk{display:block;text-align:center;margin-top:25px;color:#1b2a7a;text-decoration:none;font-weight:bold}</style></head>
<body><div class="c"><h2>Chi Tiết Khách Hàng</h2><table>
<tr><td class="lbl">Mã KH:</td><td>${requestScope.customer.id}</td></tr>
<tr><td class="lbl">Họ và Tên:</td><td>${requestScope.customer.name}</td></tr>
<tr><td class="lbl">Email:</td><td>${requestScope.customer.email}</td></tr>
<tr><td class="lbl">Địa chỉ:</td><td>${requestScope.customer.address}</td></tr>
</table><a href="${pageContext.request.contextPath}/customers" class="lnk">Quay lại danh sách</a></div></body></html>
