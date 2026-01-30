<%@ page contentType="text/html; charset=UTF-8" %>
<%
  String error = (String) request.getAttribute("error");
  String customerName = (String) request.getAttribute("customerName");
  String phone = (String) request.getAttribute("phone");
  Object paxObj = request.getAttribute("pax");
  String seating = (String) request.getAttribute("seating");
  String notes = (String) request.getAttribute("notes");

  String paxText = (paxObj == null) ? "" : paxObj.toString();
  if (customerName == null) customerName = "";
  if (phone == null) phone = "";
  if (seating == null) seating = "";
  if (notes == null) notes = "";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 3 - Result</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
    .alert { padding: 10px 12px; border-radius: 8px; margin-bottom: 12px; }
    .alert.error { background: #fdeaea; border: 1px solid #f3b7b7; }
    .alert.success { background: #e6f7ea; border: 1px solid #bfe7c8; }
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    td { padding: 10px; border-bottom: 1px solid #eee; vertical-align: top; }
    td.key { width: 220px; font-weight: bold; background: #fafafa; }
    a.btn { display: inline-block; background: #2d6cdf; color: white; padding: 10px 12px; border-radius: 8px; text-decoration: none; margin-top: 12px; }
  </style>
</head>
<body>
<div class="container">
  <h1>Project 3: Result View</h1>

  <div class="card">
    <%
      if (error != null) {
    %>
      <div class="alert error"><b>Error:</b> <%= error %></div>
      <a class="btn" href="reservations">Back</a>
    <%
      } else {
    %>
      <div class="alert success">Submitted successfully (demo). Data was processed by Servlet.</div>

      <p><b>HTTP Method:</b> <%= request.getMethod() %></p>

      <table>
        <tr><td class="key">Customer Name</td><td><%= customerName %></td></tr>
        <tr><td class="key">Phone</td><td><%= phone %></td></tr>
        <tr><td class="key">Pax</td><td><%= paxText %></td></tr>
        <tr><td class="key">Seating</td><td><%= seating %></td></tr>
        <tr><td class="key">Notes</td><td><%= notes.isEmpty() ? "(none)" : notes %></td></tr>
      </table>

      <a class="btn" href="reservations">Create another</a>
    <%
      }
    %>
  </div>
</div>
</body>
</html>
