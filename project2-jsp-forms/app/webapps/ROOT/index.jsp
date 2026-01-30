<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 2 - JSP Forms</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
    label { display:block; margin-top: 10px; font-weight: bold; }
    input, textarea, select { width: 100%; padding: 10px; margin-top: 6px; border-radius: 8px; border: 1px solid #ccc; box-sizing: border-box; }
    .btn { background: #2d6cdf; color: white; padding: 10px 12px; border-radius: 8px; border: none; margin-top: 12px; cursor: pointer; }
  </style>
</head>
<body>
<div class="container">
  <h1>Project 2: JSP Forms (POST)</h1>

  <div class="card">
    <h2>Create a Table Reservation</h2>

    <form method="post" action="result.jsp">
      <label>Customer Name</label>
      <input name="customerName" maxlength="120" required />

      <label>Phone</label>
      <input name="phone" maxlength="40" required />

      <label>Pax</label>
      <input name="pax" type="number" min="1" value="2" required />

      <label>Seating</label>
      <select name="seating" required>
        <option value="Indoor" selected>Indoor</option>
        <option value="Outdoor">Outdoor</option>
        <option value="Window">Window</option>
      </select>

      <label>Notes (optional)</label>
      <textarea name="notes" rows="3"></textarea>

      <button class="btn" type="submit">Submit</button>
    </form>
  </div>
</div>
</body>
</html>
