package com.elvizablog.controller.post;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.model.Post;
import com.elvizablog.model.User;
import com.elvizablog.payload.PostRequest;
import com.elvizablog.repository.PostRepository;
import com.elvizablog.util.InputContextValidation;

@WebServlet(name = "DeletePostController", urlPatterns = { "/post/delete" })
public class DeletePostController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private PostRepository postRepository;

  public DeletePostController() {
    postRepository = new PostRepository();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    User user = (User) request.getSession().getAttribute("user");
    Post post;
    try {
      post = postRepository.getPost(Long.parseLong(request.getParameter("id")));
      var isValidated = validateUser(user, post.getUser());
      if (isValidated) {
        postRepository.deletePost(post.getId());
        String status = "Post successsfully deleted";
        request.setAttribute("status", status);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register.jsp");
        requestDispatcher.forward(request, response);
      } else {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(request.getHeader("referer"));
        requestDispatcher.forward(request, response);
      }
    } catch (NumberFormatException e1) {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    } catch (SQLException e1) {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
  }

  private boolean validateUser(User user, User userPost) {
    return user.getId() == userPost.getId();
  }
}
