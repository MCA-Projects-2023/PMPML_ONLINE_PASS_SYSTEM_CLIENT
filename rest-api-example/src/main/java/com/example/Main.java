package com.example;

import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        port(8080); // Set the port (change as needed)

        get("/hello", (req, res) -> "Hello, Spark Java!"); // Define a simple endpoint

        // Add more endpoints as needed
    }
}
