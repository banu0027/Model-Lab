<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bookmanagement.model.Book" %>
<%
    Book book = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: #ffffff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }
        h2 {
            margin-top: 0;
            color: #1f2937;
        }
        label {
            display: block;
            margin: 12px 0 6px;
            color: #374151;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-sizing: border-box;
        }
        .actions {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        .btn {
            display: inline-block;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary {
            background: #059669;
            color: #ffffff;
        }
        .btn-secondary {
            background: #e5e7eb;
            color: #111827;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Book</h2>
    <form action="update" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">

        <label for="title">Title</label>
        <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required>

        <label for="author">Author</label>
        <input type="text" id="author" name="author" value="<%= book.getAuthor() %>" required>

        <label for="price">Price</label>
        <input type="number" id="price" name="price" value="<%= book.getPrice() %>" step="0.01" min="0" required>

        <div class="actions">
            <button type="submit" class="btn btn-primary">Update Book</button>
            <a href="list" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
