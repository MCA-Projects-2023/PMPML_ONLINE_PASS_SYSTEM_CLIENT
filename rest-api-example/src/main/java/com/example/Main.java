package com.example;

import spark.Request;
import spark.Response;
import com.google.gson.Gson;
import java.sql.Connection;
import static spark.Spark.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        DatabaseConnection.initialize();
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
        get("/tickets", (req, res) -> getTickets(req, res), new JsonTransformer());

        // Ensure to disconnect from the database when the application exits
        Runtime.getRuntime().addShutdownHook(new Thread(DatabaseConnection::closeConnection));

    }

    private static List<Ticket> getTickets(Request req, Response res) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Retrieve all tickets from the database
            ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM tickets");

            List<Ticket> tickets = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String description = resultSet.getString("description");
                // ... other fields

                Ticket ticket = new Ticket(id, description); // Create a Ticket object with the retrieved data
                tickets.add(ticket);
            }

            // Check if any tickets were found
            if (!tickets.isEmpty()) {
                res.status(200);
            } else {
                res.status(404);
            }

            return tickets;
        } catch (SQLException e) {
            e.printStackTrace();
            res.status(500);
            return null;
        }
    }

    // Define a simple Ticket class
    public static class Ticket {
        private int id;
        private String description;

        public Ticket(int id, String description) {
            this.id = id;
            this.description = description;
        }

        // Getters and setters...
    }

    // Define a JsonTransformer to handle JSON responses
    public static class JsonTransformer implements spark.ResponseTransformer {
        private Gson gson = new Gson();

        @Override
        public String render(Object model) {
            return gson.toJson(model);
        }
    }

}
