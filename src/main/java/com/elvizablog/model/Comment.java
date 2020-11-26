package com.elvizablog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
  private Long id;

  private Post post;

  private User user;

  public String description;
}
