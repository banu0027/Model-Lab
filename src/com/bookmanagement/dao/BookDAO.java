package com.bookmanagement.dao;

import com.bookmanagement.model.Book;
import com.bookmanagement.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private static final String INSERT_BOOK =
            "INSERT INTO books (title, author, price) VALUES (?, ?, ?)";
    private static final String SELECT_BOOK_BY_ID =
            "SELECT id, title, author, price FROM books WHERE id = ?";
    private static final String SELECT_ALL_BOOKS =
            "SELECT id, title, author, price FROM books ORDER BY id DESC";
    private static final String UPDATE_BOOK =
            "UPDATE books SET title = ?, author = ?, price = ? WHERE id = ?";
    private static final String DELETE_BOOK =
            "DELETE FROM books WHERE id = ?";

    public void insertBook(Book book) throws SQLException {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_BOOK)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.executeUpdate();
        }
    }

    public Book selectBook(int id) throws SQLException {
        Book book = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String title = resultSet.getString("title");
                    String author = resultSet.getString("author");
                    double price = resultSet.getDouble("price");
                    book = new Book(id, title, author, price);
                }
            }
        }

        return book;
    }

    public List<Book> selectAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_BOOKS);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                double price = resultSet.getDouble("price");
                books.add(new Book(id, title, author, price));
            }
        }

        return books;
    }

    public boolean updateBook(Book book) throws SQLException {
        boolean rowUpdated;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_BOOK)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.setInt(4, book.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }

        return rowUpdated;
    }

    public boolean deleteBook(int id) throws SQLException {
        boolean rowDeleted;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BOOK)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }

        return rowDeleted;
    }
}
