<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Project 3 - Servlet MVC</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f6f7fb; margin: 0; }
    .container { max-width: 900px; margin: 24px auto; padding: 0 16px; }
    .card { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
    label { display:block; margin-top: 10px; font-weight: bold; }
    input, textarea, select { width: 100%; padding: 10px; margin-top: 6px; box-sizing: border-box; border: 1px solid #dcdcdc; border-radius: 8px; }
    .btn { display: inline-block; background: #2d6cdf; border: none; color: white; padding: 10px 12px; border-radius: 8px; cursor: pointer; text-decoration: none; margin-top: 12px; }
  </style>
</head>
<body>
<div class="container">
  <h1>Project 3: Servlet as Controller (MVC Start)</h1>

  <div class="card">
    <p>Open the servlet URL directly:</p>
    <p><b>/reservations</b></p>

    <form method="post" action="reservations">
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

      <button class="btn" type="submit">Submit (Handled by Servlet)</button>
    </form>
  </div>
</div>
</body>
</html>
