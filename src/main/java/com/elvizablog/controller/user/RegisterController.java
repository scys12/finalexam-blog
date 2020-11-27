package com.elvizablog.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.payload.UserRegisterRequest;
import com.elvizablog.repository.UserRepository;
import com.elvizablog.util.InputContextValidation;

@WebServlet(name = "RegisterController", urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private UserRepository userRepository;

  public RegisterController() {
    this.userRepository = new UserRepository();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    var name = request.getParameter("name");
    var email = request.getParameter("email");
    var password = request.getParameter("password");
    var confirmationPassword = request.getParameter("confirmation_password");
    UserRegisterRequest userRegisterRequest = new UserRegisterRequest(name, email, password, confirmationPassword);
    boolean isValidated;
    try {
      isValidated = this.validateInputRegister(request, userRegisterRequest);
      if (isValidated) {
        userRegisterRequest.setPassword(InputContextValidation.convertToMD5(userRegisterRequest.getPassword()));
        userRepository.insertUser(userRegisterRequest);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/login.jsp");
        requestDispatcher.forward(request, response);
      } else {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/register.jsp");
        requestDispatcher.include(request, response);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public boolean validateInputRegister(HttpServletRequest request, UserRegisterRequest user) throws SQLException {
    boolean isValidatedEmail = InputContextValidation.checkEmailRegex(user.getEmail());
    if (!isValidatedEmail) {
      String status = "Wrong email pattern";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    boolean isEmailExist = userRepository.checkEmailExist(user.getEmail());
    if (isEmailExist) {
      String status = "Your email exists. Please login using this email";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    boolean isEmailTooLong = InputContextValidation.checkMaximumLength(user.getEmail(), 30)
        && InputContextValidation.checkMinimumLength(user.getEmail(), 4);
    if (!isEmailTooLong) {
      String status = "Minimum email length is 8 and maximum length is 30";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    boolean isPasswordLong = InputContextValidation.checkMinimumLength(user.getPassword(), 8);
    if (!isPasswordLong) {
      String status = "Minimum password length is 8";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    boolean isPasswordSame = InputContextValidation.checkPasswordSame(user.getPassword(),
        user.getConfirmationPassword());
    if (!isPasswordSame) {
      String status = "Password and Confirmation password are different. Please type again";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    return true;
  }
}
