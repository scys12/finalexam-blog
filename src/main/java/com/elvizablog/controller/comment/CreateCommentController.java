package com.elvizablog.controller.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elvizablog.model.Comment;
import com.elvizablog.repository.CommentRepository;
import com.elvizablog.util.InputContextValidation;

@WebServlet(name = "CreateCommentController", urlPatterns = { "/comment/create" })
public class CreateCommentController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private CommentRepository commentRepository;

  public CreateCommentController() {
    commentRepository = new CommentRepository();
  }

}