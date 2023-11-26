const express = require("express");
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const cors = require("cors");
const app = express();
const PORT = 3000;
const SECRET_KEY = "spv"; // Replace with a strong secret key
const fs = require("fs/promises");
const mysql = require("mysql2/promise");
const { v4: uuidv4 } = require("uuid");
const nodemailer = require("nodemailer");
const pdf = require("html-pdf");

// Use CORS middleware
app.use(cors());

// Middleware to parse JSON requests
app.use(bodyParser.json());

const pool = mysql.createPool({
  host: "localhost", // or '127.0.0.1' for local MySQL server
  user: "root", // your MySQL username
  password: "mysql", // your MySQL password
  database: "pmpml", // your MySQL database name
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// Get all tickets for(admim)
app.get("/tickets", async (req, res) => {
  try {
    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Retrieve all tickets from the database
      const [ticketResults] = await connection.execute("SELECT * FROM tickets");

      // Check if any tickets were found
      if (ticketResults.length > 0) {
        res.json({
          message: "Tickets retrieved successfully",
          tickets: ticketResults,
        });
      } else {
        res.status(404).json({ message: "No tickets found" });
      }
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error retrieving tickets:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/add-admin", async (req, res) => {
  try {
    const { username, password } = req.body;

    // Hash the password before storing it in the database (for security)

    // Insert the new admin user with hardcoded role 'admin'
    const [result] = await connection.execute(
      "INSERT INTO users (username, password, role) VALUES (?, ?, ?)",
      [username, password, "admin"]
    );

    // Check if the user was successfully inserted
    if (result.affectedRows === 1) {
      res.status(201).json({ message: "Admin user created successfully" });
    } else {
      res.status(500).json({ error: "Failed to create admin user" });
    }
  } catch (error) {
    console.error("Error creating admin user:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.post("/feedback", async (req, res) => {
  try {
    const { name, email, feedback } = req.body;

    // Insert the feedback into the database
    const [result] = await pool.execute(
      "INSERT INTO feedback (name, email, feedback) VALUES (?, ?, ?)",
      [name, email, feedback]
    );

    // Check if the feedback was successfully inserted
    if (result.affectedRows === 1) {
      res.status(201).json({ message: "Feedback submitted successfully" });
    } else {
      res.status(500).json({ error: "Failed to submit feedback" });
    }
  } catch (error) {
    console.error("Error submitting feedback:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.get("/complaints", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM complaints");
    res.json(rows);
  } catch (error) {
    console.error("Error fetching complaints:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.get("/feedback", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM feedback");
    res.json(rows);
  } catch (error) {
    console.error("Error fetching feedback:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.get('/contact-us', async (req, res) => {
  try {
    const [results] = await pool.execute('SELECT * FROM contact_us');
    res.status(200).json(results);
  } catch (error) {
    console.error('Error fetching contact submissions:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
app.post('/transaction-history', async (req, res) => {
  try {
    const { ticket_id, amount, description } = req.body;

    const [result] = await pool.execute(
      'INSERT INTO transaction_history (ticket_id, amount, description) VALUES (?, ?, ?)',
      [ticket_id, amount, description]
    );

    if (result.affectedRows === 1) {
      res.status(201).json({ message: 'Transaction history saved successfully' });
    } else {
      res.status(500).json({ error: 'Failed to save transaction history' });
    }
  } catch (error) {
    console.error('Error saving transaction history:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
app.get('/all-transactions', async (req, res) => {
  try {
    // Assuming you have a table named transaction_history
    const [transactions] = await pool.execute(
      'SELECT * FROM transaction_history'
    );

    res.json(transactions);
  } catch (error) {
    console.error('Error fetching all transactions:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post("/contact-us", async (req, res) => {
  try {
    const { name, email, message } = req.body;

    const [result] = await pool.execute(
      "INSERT INTO contact_us (name, email, message) VALUES (?, ?, ?)",
      [name, email, message]
    );

    if (result.affectedRows === 1) {
      res
        .status(201)
        .json({ message: "Contact information saved successfully" });
    } else {
      res.status(500).json({ error: "Failed to save contact information" });
    }
  } catch (error) {
    console.error("Error saving contact information:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.post("/notifications", async (req, res) => {
  try {
    const { title, message } = req.body;

    const [result] = await pool.execute(
      "INSERT INTO notifications (title, message) VALUES (?, ?)",
      [title, message]
    );

    if (result.affectedRows === 1) {
      res.status(201).json({ message: "Notification added successfully" });
    } else {
      res.status(500).json({ error: "Failed to add notification" });
    }
  } catch (error) {
    console.error("Error adding notification:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.get("/notifications", async (req, res) => {
  try {
    const [notifications] = await pool.execute(
      "SELECT * FROM notifications ORDER BY created_at DESC"
    );

    res.status(200).json(notifications);
  } catch (error) {
    console.error("Error retrieving notifications:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Login API
app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).json({
      error: "Username and password are required in the request body",
    });
  }

  try {
    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();

    try {
      // Retrieve user from the database with the given username
      const [rows] = await connection.execute(
        "SELECT * FROM users WHERE username = ?",
        [username]
      );

      if (rows.length === 0) {
        return res.status(401).json({ message: "Invalid credentials" });
      }

      const user = rows[0];

      // Check if the password is correct
      if (user.password === password) {
        // Generate a JWT token
        const token = jwt.sign(
          { username: user.username, role: user.role },
          SECRET_KEY,
          { expiresIn: "1h" }
        );

        res.json({ message: "Login successful", role: user.role, token });
      } else {
        res.status(401).json({ message: "Invalid credentials" });
      }
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error during login:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
// get all users
app.get("/users", async (req, res) => {
  try {
    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Retrieve all users from the database
      const [userResults] = await connection.execute("SELECT * FROM users");

      // Check if any users were found
      if (userResults.length > 0) {
        res.json({
          message: "Users retrieved successfully",
          users: userResults,
        });
      } else {
        res.status(404).json({ message: "No users found" });
      }
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error retrieving users:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
// add Tickets
app.post("/add_ticket", async (req, res) => {
  try {
    // Extract ticket data from the request body
    const { adharCard, mobileNumber, ticketType } = req.body;

    // Create a new ticket object with a unique ID
    const newTicket = {
      ticketId: uuidv4(), // Generate a unique ID
      adharCard,
      mobileNumber,
      ticketType,
      ticketTime: new Date().toLocaleString(),
    };

    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Insert the new ticket into the database
      await connection.execute(
        "INSERT INTO tickets (ticketId, adharCard, mobileNumber, ticketType, ticketTime) VALUES (?, ?, ?, ?, ?)",
        [
          newTicket.ticketId,
          newTicket.adharCard,
          newTicket.mobileNumber,
          newTicket.ticketType,
          newTicket.ticketTime,
        ]
      );
    } finally {
      connection.release(); // Release the connection back to the pool
    }

    res
      .status(201)
      .json({ message: "Ticket created successfully", ticket: newTicket });
  } catch (error) {
    console.error("Error creating ticket:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// view tickets by mobile and adharcard
app.post("/show_tickets", async (req, res) => {
  try {
    // Extract mobile number and adhar card number from the request body
    const { mobileNumber, adharCard } = req.body;

    console.log(mobileNumber, adharCard);
    if (!mobileNumber || !adharCard) {
      return res.status(400).json({
        error: "Mobile number and adhar card are required in the request body",
      });
    }

    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Retrieve tickets from the database based on mobile number and adhar card number
      const [rows] = await connection.execute(
        "SELECT * FROM tickets WHERE mobileNumber = ? AND adharCard = ? ORDER BY ticketTime DESC",
        [mobileNumber, adharCard]
      );
      // console.log(rows)
      if (rows.length === 0) {
        return res.status(404).json({
          message:
            "No tickets found for the given mobile number and adhar card",
        });
      }

      res
        .status(200)
        .json({ message: "Tickets retrieved successfully", tickets: rows });
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error retrieving tickets:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Verifiy ticket by ticketID and username
app.post("/verify-ticket", async (req, res) => {
  try {
    const { username, ticketId } = req.body;

    if (!username || !ticketId) {
      return res
        .status(400)
        .json({ message: "Username and ticketId are required" });
    }

    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Check if the username exists in the users table
      const [userResults] = await connection.execute(
        "SELECT * FROM users WHERE username = ?",
        [username]
      );

      if (userResults.length === 0) {
        // Username does not exist
        return res.status(404).json({ message: "Username not found" });
      }

      // Check if the ticket with the given ticketId is associated with the provided username
      const [ticketResults] = await connection.execute(
        "SELECT * FROM tickets WHERE ticketId = ?",
        [ticketId]
      );

      if (ticketResults.length > 0) {
        // Ticket is valid, send the full ticket data in the response
        const ticketData = ticketResults[0];
        res.json({
          message: "Ticket verification successful",
          ticket: ticketData,
        });
      } else {
        // Ticket is not found or not associated with the provided username
        res.status(404).json({
          message:
            "Ticket not found or not associated with the provided username",
        });
      }
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error verifying ticket:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Tickets between time
app.post("/tickets-between-times", async (req, res) => {
  try {
    const { mobileNumber, adharCard } = req.body;

    if (!mobileNumber || !adharCard) {
      return res
        .status(400)
        .json({ message: "Mobile number and adhar card are required" });
    }

    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Verify the mobile number and adhar card
      const [userResults] = await connection.execute(
        "SELECT * FROM tickets WHERE mobileNumber = ? AND adharCard = ?",
        [mobileNumber, adharCard]
      );

      if (userResults.length === 0) {
        // User not found or verification failed
        return res.status(401).json({
          message: "Mobile number and adhar card verification failed",
        });
      }

      // Get today's date in 'YYYY-MM-DD' format
      const today = new Date().toISOString().split("T")[0];

      // Set the start time to the beginning of today
      const startOfDay = new Date(today);
      startOfDay.setHours(0, 0, 0, 0);

      // Set the end time to the end of today
      const endOfDay = new Date(today);
      endOfDay.setHours(23, 59, 59, 999);

      // Get ticket details within the specified start and end time
      const [ticketResults] = await connection.execute(
        "SELECT * FROM tickets WHERE ticketTime BETWEEN ? AND ?",
        [startOfDay, endOfDay]
      );

      res.json({
        message: "Tickets retrieved successfully",
        tickets: ticketResults,
      });
    } finally {
      connection.release(); // Release the connection back to the pool
    }
  } catch (error) {
    console.error("Error retrieving tickets between times:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
// Contact Us
// app.post("/contact-us", async (req, res) => {
//   try {
//     const { name, email, message } = req.body;

//     if (!name || !email || !message) {
//       return res
//         .status(400)
//         .json({ message: "Name, email, and message are required" });
//     }

//     // Use MySQL connection pool to execute queries
//     const connection = await pool.getConnection();
//     try {
//       // Insert the contact details into the database
//       await connection.execute(
//         "INSERT INTO contact_us (name, email, message) VALUES (?, ?, ?)",
//         [name, email, message]
//       );
//     } finally {
//       connection.release(); // Release the connection back to the pool
//     }

//     res.status(201).json({ message: "Contact details submitted successfully" });
//   } catch (error) {
//     console.error("Error submitting contact details:", error);
//     res.status(500).json({ error: "Internal Server Error" });
//   }
// });

app.post("/send_ticket", async (req, res) => {
  // console.log(req.body)
  try {
    const { email, ticketId } = req.body;

    // Use MySQL connection pool to execute queries
    const connection = await pool.getConnection();
    try {
      // Retrieve ticket details from the database based on the ticketId
      const [ticketResults] = await connection.execute(
        "SELECT * FROM tickets WHERE ticketId = ?",
        [ticketId]
      );

      if (ticketResults.length === 0) {
        return res.status(404).json({ error: "Ticket not found" });
      }

      const ticketDetails = ticketResults[0];

      // Create a QR code URL with the ticketId
      const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${ticketId}`;

      // Compose the HTML content for the email
      const htmlContent = `
        <p>Dear Customer,</p>
        <p>Your ticket details:</p>
        <p><strong>Ticket ID:</strong> ${ticketId}</p>
        <p><strong>QR Code:</strong><br/><img src="${qrCodeUrl}" alt="QR Code"></p>
        <a href="http://127.0.0.1:5501/success.html?ticketId=${ticketDetails.ticketId}&ticketType=${ticketDetails.ticketType}&Time=${ticketDetails.ticketTime}">SEE TICKET HERE</a>
      `;

      // Generate a PDF version of the ticket
      const pdfBuffer = await generatePdf(htmlContent);

      // Configure nodemailer
      const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          user: "mohanalkarvaibhav@gmail.com",
          pass: "sdsxlvqnevxizocr",
        },
      });

      // Compose the email options
      const mailOptions = {
        from: "mohanalkarvaibhav@gmail.com",
        to: email,
        subject: "Your Ticket Details",
        html: htmlContent,
        attachments: [
          {
            filename: "ticket.pdf",
            content: pdfBuffer,
            encoding: "base64",
          },
        ],
      };

      // Send the email
      await transporter.sendMail(mailOptions);

      res.json({ success: true, message: "Ticket sent successfully" });
      console.log("sent");
    } finally {
      connection.release();
    }
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});

// Function to generate PDF from HTML content
async function generatePdf(htmlContent) {
  return new Promise((resolve, reject) => {
    pdf.create(htmlContent).toBuffer((err, buffer) => {
      if (err) {
        reject(err);
      } else {
        resolve(buffer);
      }
    });
  });
}

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
