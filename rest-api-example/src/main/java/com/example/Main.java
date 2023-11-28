package com.example;

import java.sql.Connection;
import static spark.Spark.*;

public class Main {

    public static void main(String[] args) {
        Connection connection = DatabaseConnection.connect();
        port(8080); // Set the port (change as needed)

        get("/hello", (req, res) -> "Hello, Spark Java!"); // Define a simple endpoint
        // Add more endpoints as needed

        get("/checkConnection", (req, res) -> {
            if (DatabaseConnection.isConnected()) {
                return "Connected to the database.";
            } else {
                return "Not connected to the database.";
            }
        });

        // Ensure to disconnect from the database when the application exits
        Runtime.getRuntime().addShutdownHook(new Thread(DatabaseConnection::disconnect));

    }
}
