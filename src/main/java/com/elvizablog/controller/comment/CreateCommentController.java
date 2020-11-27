package com.elvizablog.controller.comment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.model.Comment;
import com.elvizablog.model.Post;
import com.elvizablog.model.User;
import com.elvizablog.repository.CommentRepository;
import com.elvizablog.util.InputContextValidation;

@WebServlet(name = "CreateCommentController", urlPatterns = { "/comment/create" })
public class CreateCommentController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private CommentRepository commentRepository;

  public CreateCommentController() {
    commentRepository = new CommentRepository();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    User user = (User) request.getSession().getAttribute("user");
    Long postId = Long.parseLong(request.getParameter("id"));
    Post post = new Post(postId, user, request.getParameter("title"), request.getParameter("description"));
    Comment comment = new Comment();
    comment.setDescription(request.getParameter("description"));
    comment.setPost(post);
    comment.setUser(user);
    boolean isValidated = validateInput(request, comment);
    if (isValidated) {
      try {
        commentRepository.insertComment(comment);
        String status = "Comment successsfully post";
        request.setAttribute("status", status);
        response.sendRedirect(request.getHeader("referer"));
      } catch (SQLException e) {
        e.printStackTrace();
      }
    } else {
      response.sendRedirect(request.getContextPath() + "/post/create.jsp");
    }
  }

  private boolean validateInput(HttpServletRequest request, Comment comment) {
    boolean checkDescription = InputContextValidation.checkMaximumLength(comment.getDescription(), 200)
        && InputContextValidation.checkMinimumLength(comment.getDescription(), 4);
    if (!checkDescription) {
      String status = "Minimum title length is 4 and maximum length is 50";
      request.getSession().setAttribute("wrong_auth", status);
      return false;
    }
    return true;
  }
}