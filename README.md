# KShop - Fashion E-commerce Website

KShop is a full-featured e-commerce web application built with the Java Web stack (Servlets & JSP) following the MVC architectural pattern. It provides a complete online shopping experience for customers and a comprehensive management dashboard for administrators.

## ✨ Features

### Customer-Facing
- **User Authentication:** Secure user registration and login system.
- **Product Catalog:** Browse products by category, search for specific items, and view detailed product pages.
- **Shopping Cart:** Add, remove, and update product quantities in a persistent shopping cart.
- **Checkout Process:** A streamlined, multi-step checkout process to place orders.
- **Account Management:** Users can view and update their profile information.
- **Order History:** View past orders and check their status.

### Admin Panel
- **Dashboard:** An overview of key metrics, including sales, new customers, and recent orders.
- **Product Management:** Full CRUD (Create, Read, Update, Delete) functionality for products.
- **Customer Management:** View and manage the list of registered customers.
- **Order Management:** Track and update the status of all customer orders.
- **Banner Management:** Update promotional banners displayed on the homepage.

## 🚀 Technology Stack

- **Backend:** Java (Servlet API)
- **Frontend:** JavaServer Pages (JSP), JSTL, HTML, CSS, JavaScript
- **Database:** Microsoft SQL Server
- **Web Server:** Apache Tomcat
- **Build Tool:** Apache Ant (via NetBeans integration)
- **Recommended IDE:** Apache NetBeans

## 🛠️ Prerequisites & Setup Guide

To get the project up and running locally, please follow these steps.

### Prerequisites
- **JDK 8** or a later version.
- **Apache Tomcat 9.0** or a compatible version.
- **Microsoft SQL Server** (2019 or a compatible version).
- **Apache NetBeans IDE** (Version 12.0 or later is recommended for seamless compatibility).

### Installation Steps

**1. Clone the Repository**
```bash
git clone <YOUR_REPOSITORY_URL>
```

**2. Set Up the Database**
- Open **SQL Server Management Studio (SSMS)**.
- Create a new, empty database named `FashionShop`.
- Open the `FashionShopDB.sql` file located in the project's root directory.
- Execute the entire script against the `FashionShop` database. This will create the necessary tables and populate them with initial data.

**3. Configure the Database Connection**
- Open the project in the NetBeans IDE.
- Navigate to the file `src/java/dal/DBContext.java`.
- Update the database connection credentials (`USERNAME` and `PASSWORD`) to match your local SQL Server configuration.
  ```java
  public class DBContext {

      protected Connection connection;
      // Modify these credentials to match your environment
      private final String USERNAME = "sa";
      private final String PASSWORD = "123";
      private final String DATABASE = "FashionShop";

      public DBContext() {
          try {
              String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DATABASE;
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
              connection = DriverManager.getConnection(url, USERNAME, PASSWORD);
          } catch (ClassNotFoundException | SQLException ex) {
              System.out.println(ex);
          } 
      }
      //...
  }
  ```
- **Important:** Ensure the `sqljdbc42.jar` library is included in the project's libraries. NetBeans should automatically detect it in the `Lib` folder. If not, right-click the `Libraries` folder in the project tree, select `Add JAR/Folder`, and navigate to `Lib/sqljdbc42.jar`.

**4. Build and Run the Project**
- Press `F6` or click the `Run Project` button in NetBeans.
- The IDE will automatically build the project using Ant and deploy it to your configured Apache Tomcat server.
- Once deployment is complete, the application will launch in your default web browser. The default URL is:
  [http://localhost:8080/KShop/](http://localhost:8080/KShop/)
  *(Note: The `8080` port may vary depending on your Tomcat configuration)*.

## 📂 Project Structure

A brief overview of the key directories within the project:

```
KShop/
├── src/java/
│   ├── controller/  # Servlets that handle user requests
│   ├── dal/         # Data Access Objects (DAOs) for database interaction
│   └── model/       # POJO (Plain Old Java Objects) representing data entities
├── web/             # Contains JSPs, CSS, JS, images, and other web resources
│   ├── WEB-INF/
│   └── ...
├── Lib/             # Contains required JAR libraries for the project
├── FashionShopDB.sql # The database initialization script
└── README.md        # This documentation file
```

## 📄 License

This project is governed by the terms outlined in the `LICENSE` file.
