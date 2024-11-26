-- 1. FINDING 5 OLDEST USERS
SELECT
    *
FROM users
ORDER BY created_at LIMIT 5;

-- 2. What day of the week do most users register on?
SELECT
    DAYNAME(created_at) AS day_of_week,
    COUNT(*) AS 'count'
FROM users
GROUP BY day_of_week
ORDER BY 'count' DESC;

-- 3. Target inactive users with an email campaign; find users who have never posted a photo
SELECT
    username,
    image_url
FROM users
LEFT JOIN photos
    ON photos.user_id = users.id
WHERE photos.id IS NULL;

-- 4. Most liked photo contest
SELECT
    username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total_likes
FROM photos
JOIN likes
    ON likes.photo_id = photos.id
JOIN users
    ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total_likes DESC
LIMIT 3;


-- 5. Average number of user posts
SELECT
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_posts_per_user;


-- 6. SELECT top 5 most used hashtags
SELECT
    tags.tag_name,
    COUNT(*) AS total_num_tags
FROM photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY total_num_tags DESC
LIMIT 5;


-- 7. Find bot accounts
SELECT
    username,
    COUNT(*) AS total_likes
FROM users
JOIN likes
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING total_likes = (SELECT COUNT(*) FROM photos);

