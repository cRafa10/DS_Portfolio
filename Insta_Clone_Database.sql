CREATE DATABASE insta_clone;
USE insta_clone;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE photos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    user_followed_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(user_followed_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, user_followed_id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


INSERT INTO users (username)
VALUES ('BlueTheCat'),
       ('CharlieBrown'),
       ('ColtSteele');


INSERT INTO photos (image_url, user_id)
VALUES ('/hwe4tr5yw2', 1),
       ('/hwe4dg7kw2', 2),
       ('/hwe4w4thasyw2', 2);

INSERT INTO comments (comment_text, user_id, photo_id)
VALUES ('Meow!', 1, 2),
       ('Amazing shot', 3, 2),
       ('I <3 this', 2, 1);

INSERT INTO likes (user_id, photo_id)
VALUES (1, 1),
       (2, 1),
       (1, 2),
       (1, 3),
       (3, 3);
-- Won't work because of primary key constraint
-- INSERT INTO likes (user_id, photo_id) VALUES (1, 1)

INSERT INTO follows (follower_id, user_followed_id)
VALUES (1, 2),
       (1, 3),
       (3, 1),
       (2, 3);

INSERT INTO tags (tag_name)
VALUES ('adorable'),
       ('cute'),
       ('sunrise');

INSERT INTO photo_tags (photo_id, tag_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 2);


-- SELECT photos.image_url, users.username FROM photos
-- JOIN users ON photos.user_id = users.id;

