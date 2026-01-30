<%@ page import="java.util.*, com.example.p4.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Student List</title>
</head>
<body>
<h2>Students</h2>

<table border="1" cellpadding="6">
<tr>
  <th>ID</th><th>Name</th><th>Email</th><th>Course</th>
</tr>

<%
  List<Student> students = (List<Student>) request.getAttribute("students");
  if (students != null) {
    for (Student s : students) {
%>
<tr>
  <td><%= s.getId() %></td>
  <td><%= s.getName() %></td>
  <td><%= s.getEmail() %></td>
  <td><%= s.getCourse() %></td>
</tr>
<%
    }
  }
%>
</table>

</body>
</html>
