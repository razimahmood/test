<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.time.ZonedDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
  String name = request.getParameter("name");
  if (name == null || name.trim().isEmpty()) {
    name = "Guest";
  }

  String now = ZonedDateTime.now().format(DateTimeFormatter.ISO_ZONED_DATE_TIME);
  String method = request.getMethod();
  String uri = request.getRequestURI();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 1 - Hello JSP</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
    code { background: #f1f1f1; padding: 2px 6px; border-radius: 6px; }
  </style>
</head>
<body>
  <div class="container">
    <h1>Project 1: Hello JSP</h1>

    <div class="card">
      <p><b>Hello, <%= name %></b></p>

      <p><b>Server time:</b> <code><%= now %></code></p>
      <p><b>HTTP method:</b> <code><%= method %></code></p>
      <p><b>Request URI:</b> <code><%= uri %></code></p>

      <p>
        Try:
        <code>?name=Razi</code>
        (example:
        <code>/index.jsp?name=Razi</code>)
      </p>
    </div>
  </div>
</body>
</html>
