CREATE DATABASE social_market;
-- \c social_market;
USE social_market;
CREATE TABLE 

CREATE TABLE "product" (
        "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "product_name" text NOT NULL, "price" real NOT NULL, 
        "date_added" datetime NOT NULL
    );
--
-- Create table User
--
CREATE TABLE "user" (
        "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "username" varchar(225) NOT NULL, 
        "first_name" varchar(100) NOT NULL, 
        "last_name" varchar(100) NOT NULL, 
        "profile_image" varchar(100) NOT NULL, 
        "email" varchar(225) NOT NULL, 
        "mobile" varchar(20) NOT NULL, 
        "password" varchar(225) NOT NULL, 
        "date_added" datetime NOT NULL
    );
--
-- Create table Profile
--
CREATE TABLE "profile" (
        "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "gender" varchar(10) NULL, "date_of_birth" date NULL, 
        "home_address" text NULL, "office_address" text NULL, 
        "country" varchar(100) NULL, 
        "state" varchar(125) NULL, 
        "city" varchar(125) NULL, 
        "user_id" bigint NOT NULL UNIQUE REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductSize
--
CREATE TABLE "product_size" (
        "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "size" VARCHAR(50) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "generator_product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductImage
--
CREATE TABLE "product_image" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "image" VARCHAR(100) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "generator_product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductDescription
--
CREATE TABLE "product_description" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "description" text NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "generator_product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table ProductColor
--
CREATE TABLE "product_color" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "color" VARCHAR(30) NOT NULL, 
        "product_id" BIGINT NOT NULL UNIQUE REFERENCES "generator_product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
--
-- Create table DiscountPrice
--
CREATE TABLE "discount_price" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        "price" INTEGER NOT NULL, 
        "Product_id" BIGINT NOT NULL UNIQUE REFERENCES "generator_product" ("id") DEFERRABLE INITIALLY DEFERRED
    );
COMMIT;
