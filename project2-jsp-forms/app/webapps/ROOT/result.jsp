<%@ page contentType="text/html; charset=UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");

  String customerName = request.getParameter("customerName");
  String phone = request.getParameter("phone");
  String paxRaw = request.getParameter("pax");
  String seating = request.getParameter("seating");
  String notes = request.getParameter("notes");

  if (customerName == null) customerName = "";
  if (phone == null) phone = "";
  if (paxRaw == null) paxRaw = "";
  if (seating == null) seating = "";
  if (notes == null) notes = "";

  customerName = customerName.trim();
  phone = phone.trim();
  paxRaw = paxRaw.trim();
  seating = seating.trim();
  notes = notes.trim();

  String error = null;

  if (customerName.isEmpty() || phone.isEmpty() || paxRaw.isEmpty() || seating.isEmpty()) {
    error = "Missing required fields. Please go back and fill in all required inputs.";
  }

  int pax = 0;
  if (error == null) {
    try {
      pax = Integer.parseInt(paxRaw);
      if (pax <= 0) error = "Pax must be greater than 0.";
    } catch (NumberFormatException e) {
      error = "Pax must be a valid number.";
    }
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 2 - Result</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
    .alert { padding: 10px 12px; border-radius: 8px; margin-bottom: 12px; }
    .alert.error { background: #fdeaea; border: 1px solid #f3b7b7; }
    .alert.success { background: #e6f7ea; border: 1px solid #bfe7c8; }
    .btn { display: inline-block; background: #2d6cdf; border: none; color: white; padding: 10px 12px; border-radius: 8px; cursor: pointer; text-decoration: none; margin-top: 12px; }
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    td { padding: 10px; border-bottom: 1px solid #eee; vertical-align: top; }
    td.key { width: 220px; font-weight: bold; background: #fafafa; }
    code { background: #f1f1f1; padding: 2px 6px; border-radius: 6px; }
  </style>
</head>
<body>
<div class="container">
  <h1>Project 2: Submission Result</h1>

  <div class="card">
    <%
      if (error != null) {
    %>
      <div class="alert error"><%= error %></div>
      <a class="btn" href="index.jsp">Back to form</a>
    <%
      } else {
    %>
      <div class="alert success">
        Reservation submitted successfully (demo). This is still JSP-only (no database yet).
      </div>

      <p><b>HTTP Method:</b> <code><%= request.getMethod() %></code></p>

      <table>
        <tr><td class="key">Customer Name</td><td><%= customerName %></td></tr>
        <tr><td class="key">Phone</td><td><%= phone %></td></tr>
        <tr><td class="key">Pax</td><td><%= pax %></td></tr>
        <tr><td class="key">Seating</td><td><%= seating %></td></tr>
        <tr><td class="key">Notes</td><td><%= notes.isEmpty() ? "(none)" : notes %></td></tr>
      </table>

      <a class="btn" href="index.jsp">Create another</a>
    <%
      }
    %>
  </div>
</div>
</body>
</html>
