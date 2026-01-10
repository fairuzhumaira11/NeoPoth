INSERT INTO category (name, description) VALUES
                                             ('Web Development', 'Web development services'),
                                             ('Graphic Design', 'Graphic design services'),
                                             ('Digital Marketing', 'Digital marketing services'),
                                             ('Writing & Translation', 'Writing and translation services'),
                                             ('Video & Animation', 'Video and animation services');

INSERT INTO skill (name) VALUES
                             ('Java'), ('Spring Boot'), ('React'), ('Angular'),
                             ('Photoshop'), ('Illustrator'), ('SEO'), ('Content Writing'),
                             ('Video Editing'), ('Animation');

-- Create Master Admin (password: admin123)
INSERT INTO user(first_name, last_name, email, username, password, user_type, created_at, updated_at)
VALUES ('Master', 'Admin', 'master@nobopoth.com', 'masteradmin', '$2a$10$YourHashedPassword', 'MASTER_ADMIN', NOW(), NOW());

INSERT INTO master_admin (user_id, is_super_admin, permission_level, can_manage_sub_admins, can_manage_all_jobs)
VALUES (1, true, 10, true, true);