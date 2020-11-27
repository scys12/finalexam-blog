package com.elvizablog.payload;

import com.elvizablog.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostRequest {
  @NonNull
  private User user;

  @NonNull
  private String title;

  @NonNull
  private String description;
}
