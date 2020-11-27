package com.elvizablog.payload;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterRequest {
  @NonNull
  private String name;
  @NonNull
  private String email;
  @NonNull
  private String password;
  @NonNull
  private String confirmationPassword;
}