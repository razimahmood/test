<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.example.p4.model.Student" %>
<%
  String error = (String) request.getAttribute("error");
  List<Student> students = (List<Student>) request.getAttribute("students");
  if (students == null) students = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 4 - Students</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); margin-bottom: 14px; }
    .row { display: grid; grid-template-columns: 1fr 1fr 1fr auto; gap: 10px; align-items: end; }
    label { display:block; margin-top: 10px; font-weight: bold; }
    input { width: 100%; padding: 10px; margin-top: 6px; box-sizing: border-box; border: 1px solid #dcdcdc; border-radius: 8px; }
    .btn { display: inline-block; background: #2d6cdf; border: none; color: white; padding: 10px 12px; border-radius: 8px; cursor: pointer; text-decoration: none; }
    .btn.danger { background: #d9534f; }
    .btn.link { background: transparent; color: #2d6cdf; padding: 0; }
    .alert { padding: 10px 12px; border-radius: 8px; margin-bottom: 12px; }
    .alert.error { background: #fdeaea; border: 1px solid #f3b7b7; }
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    th, td { padding: 10px; border-bottom: 1px solid #eee; vertical-align: top; text-align: left; }
    th { background: #fafafa; }
    .muted { color: #666; font-size: 14px; }
  </style>
</head>
<body>
<div class="container">
  <h1>Project 4: Students</h1>
  <p class="muted">Controller URL: <b>/student</b></p>

  <div class="card">
    <h2>Add Student</h2>

    <%
      if (error != null) {
    %>
      <div class="alert error"><b>Error:</b> <%= error %></div>
    <%
      }
    %>

    <form method="post" action="student">
      <div class="row">
        <div>
          <label>Name</label>
          <input name="name" maxlength="100" required />
        </div>

        <div>
          <label>Email</label>
          <input name="email" maxlength="100" required />
        </div>

        <div>
          <label>Course</label>
          <input name="course" maxlength="50" required />
        </div>

        <div>
          <button class="btn" type="submit">Add</button>
        </div>
      </div>
    </form>
  </div>

  <div class="card">
    <h2>Student List</h2>

    <table>
      <tr>
        <th style="width:70px;">ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Course</th>
        <th style="width:120px;">Action</th>
      </tr>

      <%
        if (students.isEmpty()) {
      %>
        <tr>
          <td colspan="5" class="muted">No students found.</td>
        </tr>
      <%
        } else {
          for (Student s : students) {
      %>
        <tr>
          <td><%= s.getId() %></td>
          <td><%= s.getName() %></td>
          <td><%= s.getEmail() %></td>
          <td><%= s.getCourse() %></td>
          <td>
            <a class="btn danger" href="student?action=delete&id=<%= s.getId() %>"
               onclick="return confirm('Delete this student?');">Delete</a>
          </td>
        </tr>
      <%
          }
        }
      %>
    </table>

    <p style="margin-top:12px;">
      <a class="btn link" href="./">Back to Home</a>
    </p>
  </div>
</div>
</body>
</html>
