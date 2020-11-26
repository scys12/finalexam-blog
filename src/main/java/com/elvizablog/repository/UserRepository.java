package com.elvizablog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.elvizablog.model.User;
import com.elvizablog.payload.UserRequest;
import com.elvizablog.util.DatabaseConnection;

public class UserRepository {
  private final String INSERT_SQL = "insert into users (name, email, password) values (?, ?, ?)";
  private final String CHECK_EMAIL_USER = "SELECT TOP 1 email from  users where email=?";
  private final String GET_BY_USER_ID = "select * from users where id=?";

  public void insertUser(User user) throws SQLException {
    try (Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SQL)) {
      preparedStatement.setString(1, user.getName());
      preparedStatement.setString(2, user.getEmail());
      preparedStatement.setString(3, user.getPassword());
      preparedStatement.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public boolean checkEmailExist(String email) throws SQLException {
    boolean isEmailExist = true;
    try (Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_USER)) {
      preparedStatement.setString(1, email);
      ResultSet resultQuery = preparedStatement.executeQuery();
      if (resultQuery.first()) {
        isEmailExist = true;
      } else {
        isEmailExist = false;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return isEmailExist;
  }

  public User login(UserRequest userRequest) throws SQLException {
    User user = null;
    try (Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_USER)) {
      preparedStatement.setString(1, userRequest.getEmail());
      ResultSet resultQuery = preparedStatement.executeQuery();
      while (resultQuery.next()) {
        user = new User(resultQuery.getLong("id"), resultQuery.getString("name"), resultQuery.getString("email"),
            resultQuery.getString("password"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return user.getPassword().compareTo(userRequest.getPassword()) == 0 ? user : null;
  }

  public User getUserDetail(Long id) throws SQLException {
    User user = null;
    try (Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_USER_ID)) {
      preparedStatement.setLong(1, id);
      ResultSet resultQuery = preparedStatement.executeQuery();
      while (resultQuery.next()) {
        user = new User(resultQuery.getLong("id"), resultQuery.getString("name"), resultQuery.getString("email"),
            resultQuery.getString("password"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return user;
  }
}