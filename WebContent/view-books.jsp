<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookmanagement.model.Book" %>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: #ffffff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        h2 {
            margin: 0;
            color: #1f2937;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }
        th {
            background: #f9fafb;
        }
        .btn {
            display: inline-block;
            padding: 9px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-primary {
            background: #2563eb;
            color: #ffffff;
        }
        .btn-edit {
            background: #f59e0b;
            color: #ffffff;
        }
        .btn-delete {
            background: #dc2626;
            color: #ffffff;
        }
        .empty {
            padding: 20px 0;
            color: #6b7280;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>Book Management System</h2>
        <a href="new" class="btn btn-primary">Add Book</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (bookList != null && !bookList.isEmpty()) {
                for (Book item : bookList) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getTitle() %></td>
            <td><%= item.getAuthor() %></td>
            <td><%= item.getPrice() %></td>
            <td>
                <a href="edit?id=<%= item.getId() %>" class="btn btn-edit">Edit</a>
                <a href="delete?id=<%= item.getId() %>" class="btn btn-delete"
                   onclick="return confirm('Delete this book?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" class="empty">No books found. Click "Add Book" to create your first record.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
