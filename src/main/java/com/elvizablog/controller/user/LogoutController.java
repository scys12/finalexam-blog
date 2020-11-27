package com.elvizablog.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import com.elvizablog.model.User;
import com.elvizablog.payload.UserLoginRequest;
import com.elvizablog.repository.UserRepository;
import com.elvizablog.util.InputContextValidation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogoutController", urlPatterns = { "/logout" })
public class LogoutController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    session.invalidate();
    response.sendRedirect(request.getContextPath());
  }
}
