package com.elvizablog.controller.post;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.model.User;
import com.elvizablog.payload.PostRequest;
import com.elvizablog.repository.PostRepository;
import com.elvizablog.util.InputContextValidation;

@WebServlet(name = "CreatePostController", urlPatterns = { "/post/create" })
public class CreatePostController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private PostRepository postRepository;

  public CreatePostController() {
    postRepository = new PostRepository();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    User user = (User) request.getSession().getAttribute("user");
    PostRequest post = new PostRequest(user, request.getParameter("title"), request.getParameter("description"));
    var isValidated = validateInput(request, post);
    if (isValidated) {
      try {
        postRepository.insertPost(post);
        String status = "Post successsfully inserted";
        request.setAttribute("status", status);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register.jsp");
        requestDispatcher.forward(request, response);
      } catch (SQLException e) {
        e.printStackTrace();
      }
    } else {
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register.jsp");
      requestDispatcher.forward(request, response);
    }
  }

  private boolean validateInput(HttpServletRequest request, PostRequest post) {
    boolean checkTitle = InputContextValidation.checkMaximumLength(post.getTitle(), 50)
        && InputContextValidation.checkMinimumLength(post.getTitle(), 4);
    if (!checkTitle) {
      String status = "Minimum title length is 4 and maximum length is 50";
      request.setAttribute("wrong_auth", status);
      return false;
    }

    boolean checkDescription = InputContextValidation.checkMaximumLength(post.getDescription(), 200)
        && InputContextValidation.checkMinimumLength(post.getDescription(), 4);
    if (!checkDescription) {
      String status = "Minimum description length is 4 and maximum length is 200";
      request.setAttribute("wrong_auth", status);
      return false;
    }
    return true;
  }
}
