CREATE DATABASE CHATAPP
USE CHATAPP

CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  username VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  phone_number VARCHAR(255),
  status VARCHAR(255) UNIQUE,
  password_hash VARCHAR(255),
  profile_picture VARCHAR(255),
  is_active BIT DEFAULT 1,
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE Messages (
  message_id INT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  content VARCHAR(255),
  media_url VARCHAR(255),
  sent_at DATETIME,
  status VARCHAR(255),
  FOREIGN KEY (sender_id) REFERENCES Users(user_id),
  FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

CREATE TABLE Contacts (
  contact_id INT PRIMARY KEY,
  user_id INT,
  contact_user_id INT,
  nickname VARCHAR(255),
  created_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (contact_user_id) REFERENCES Users(user_id)
);

CREATE TABLE Groups (
  group_id INT PRIMARY KEY,
  group_name VARCHAR(255),
  created_by INT,
  created_at DATETIME,
  FOREIGN KEY (created_by) REFERENCES Users(user_id)
);

CREATE TABLE GroupMembers (
  group_member_id INT PRIMARY KEY,
  group_id INT,
  user_id INT,
  joined_at DATETIME,
  role VARCHAR(255),
  FOREIGN KEY (group_id) REFERENCES Groups(group_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE MessageStatus (
  status_id INT PRIMARY KEY,
  message_id INT,
  user_id INT,
  status VARCHAR(255),
  updated_at DATETIME,
  FOREIGN KEY (message_id) REFERENCES Messages(message_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Calls (
  call_id INT PRIMARY KEY,
  caller_id INT,
  receiver_id INT,
  start_time DATETIME,
  end_time DATETIME,
  call_type VARCHAR(255),
  FOREIGN KEY (caller_id) REFERENCES Users(user_id),
  FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

CREATE TABLE GroupChats (
  group_chat_id INT PRIMARY KEY,
  group_id INT,
  sender_id INT,
  content VARCHAR(255),
  media_url VARCHAR(255),
  sent_at DATETIME,
  status VARCHAR(255),
  FOREIGN KEY (group_id) REFERENCES Groups(group_id),
  FOREIGN KEY (sender_id) REFERENCES Users(user_id)
);

CREATE TABLE UserStatus (
  status_id INT PRIMARY KEY,
  user_id INT,
  text VARCHAR(255),
  media_url VARCHAR(255),
  created_at DATETIME,
  expires_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

