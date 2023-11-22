const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const app = express();
const PORT = 3000;
const SECRET_KEY = 'spv'; // Replace with a strong secret key
const fs = require('fs/promises');

const { v4: uuidv4 } = require('uuid');

// Use CORS middleware
app.use(cors());
// Dummy users (in a real scenario, you would use a database)
const users = [
  { username: 'admin', password: 'adminpassword', role: 'admin' },
  { username: 'superadmin', password: 'superadminpassword', role: 'superadmin' },
];

// Middleware to parse JSON requests
app.use(bodyParser.json());

// Login endpoint
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Find the user with the given username
  const user = users.find((u) => u.username === username);

  // Check if the user exists and the password is correct
  if (user && user.password === password) {
    // Generate a JWT token
    const token = jwt.sign({ username: user.username, role: user.role }, SECRET_KEY, { expiresIn: '1h' });

    res.json({ message: 'Login successful', role: user.role, token });
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
});



app.post('/tickets', async (req, res) => {
    try {
      // Load existing tickets
      let existingTickets = [];
      try {
        const data = await fs.readFile('./passes/tickets.json', 'utf8');
        existingTickets = JSON.parse(data);
      } catch (error) {
        // File may not exist yet, that's okay
      }
  
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
  
      // Add the new ticket to the existing array
      existingTickets.push(newTicket);
  
      // Save the updated array back to the file
      await fs.writeFile('./passes/tickets.json', JSON.stringify(existingTickets, null, 2));
  
      res.status(201).json({ message: 'Ticket created successfully', ticket: newTicket });
    } catch (error) {
      console.error('Error creating ticket:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
