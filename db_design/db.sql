CREATE DATABASE social_market;
\c social_market

-- CREATE TABLE 

CREATE TABLE "product" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY , 
        "product_name" TEXT NOT NULL, 
        "price" INTEGER NOT NULL, 
        "date_added" TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
    );
--
-- Create table User
--
CREATE TABLE "user" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "username" VARCHAR(225) NOT NULL, 
        "first_name" VARCHAR(100)  NULL, 
        "last_name" VARCHAR(100)  NULL, 
        "profile_image" VARCHAR(100) NOT NULL, 
        "email" VARCHAR(225) NOT NULL, 
        "mobile" VARCHAR(20)  NULL, 
        "password" VARCHAR(225) NOT NULL, 
        "is_admin" BOOLEAN NOT NULL DEFAULT FALSE,
        "is_staff" BOOLEAN NOT NULL DEFAULT FALSE,
        "is_active" BOOLEAN NOT NULL DEFAULT FALSE,
        "date_added" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
--
-- Create table Profile
--
CREATE TABLE "profile" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "gender" VARCHAR(10) NULL, 
        "date_of_birth" DATE NULL, 
        "home_address" TEXT NULL, 
        "office_address" TEXT NULL, 
        "country" VARCHAR(100) NULL, 
        "state" VARCHAR(125) NULL, 
        "city" VARCHAR(125) NULL, 
        "user_id" BIGINT NOT NULL UNIQUE REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductSize
--
CREATE TABLE "product_size" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "size" VARCHAR(50) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductImage
--
CREATE TABLE "product_image" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "image" VARCHAR(100) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductDescription
--
CREATE TABLE "product_description" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "description" TEXT NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductColor
--
CREATE TABLE "product_color" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY , 
        "color" VARCHAR(30) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table DiscountPrice
--
CREATE TABLE "discount_price" (
        "id" BIGSERIAL NOT NULL PRIMARY KEY, 
        "price" INTEGER NOT NULL, 
        "Product_id" BIGINT NOT NULL UNIQUE REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
-- COMMIT;


-- /Users/USER/Desktop/files/projects/job_projects/social_market/db_design/db.sql
