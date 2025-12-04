# Blood Management System

A comprehensive Blood Bank Management System built with Java Servlets, JSP, and MySQL. This web application helps hospitals and blood banks manage blood inventory, track patient needs, and efficiently locate the nearest blood sources using Dijkstra's shortest path algorithm.

## Features

### 🩸 Patient Management
- Register patients requiring blood transfusion
- Track patient details including name, blood group, and contact information
- Store relative/emergency contact details for notifications

### 🏥 Blood Bank Administration
- Add and manage blood bank locations
- Track blood availability by type (A+, A-, B+, B-, AB+, AB-, O+, O-)
- View comprehensive blood inventory data

### 🔍 Intelligent Blood Search
- **Dijkstra's Algorithm Implementation**: Automatically finds the nearest hospital/blood bank with the required blood type
- Distance-based optimization for emergency blood procurement
- Real-time blood availability checking

### 📊 Dashboard & Reports
- Admin dashboard for centralized management
- View all patient data
- View all blood bank inventory

## Technology Stack

| Component | Technology |
|-----------|------------|
| Backend | Java (Jakarta EE) |
| Server | Apache Tomcat 10.1 |
| Database | MySQL |
| Frontend | JSP, HTML, CSS, JavaScript |
| IDE | Eclipse |
| JDK | Java SE 17 |

## Project Structure

```
BloodManagement/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/blood/step2/
│       │       ├── SearchinginJAVA.java    # Blood search servlet
│       │       └── Step2.java              # Patient processing servlet
│       └── webapp/
│           ├── WEB-INF/
│           │   └── lib/
│           │       └── web.xml             # Servlet configuration
│           ├── firstpage.html              # Main entry page
│           ├── AdminPage.jsp               # Admin dashboard
│           ├── SearchBlood.jsp             # Blood search with Dijkstra's algorithm
│           ├── InsertBloodAvail.jsp        # Add blood availability
│           ├── ShowBloodDatas.jsp          # Display blood data
│           ├── InsertDatasJsp.jsp          # Patient registration form
│           ├── InsertVictimDataJsp.jsp     # Process patient registration
│           ├── PrintVivtimData.jsp         # Display patient data
│           ├── FetchDataVictim.jsp         # Fetch patient details
│           ├── Secondpage.jsp              # Processing page
│           └── NotifyToRelative.jsp        # Relative notification page
├── .classpath
├── .project
└── .settings/
```

## Database Setup

### 1. Blood Availability Database

```sql
CREATE DATABASE bloodavailability;
USE bloodavailability;

CREATE TABLE blooddata (
    location INT PRIMARY KEY,
    locationname VARCHAR(100),
    `A+` VARCHAR(10),
    `A-` VARCHAR(10),
    `B+` VARCHAR(10),
    `B-` VARCHAR(10),
    `AB+` VARCHAR(10),
    `AB-` VARCHAR(10),
    `O+` VARCHAR(10),
    `O-` VARCHAR(10),
    bloodbankname VARCHAR(100),
    bloodbankid VARCHAR(50)
);
```

### 2. Victims/Patients Database

```sql
CREATE DATABASE victims;
USE victims;

CREATE TABLE victimsdata (
    vid INT AUTO_INCREMENT PRIMARY KEY,
    vname VARCHAR(100),
    vrelativename VARCHAR(100),
    vphone VARCHAR(20),
    vbloodgroup VARCHAR(10),
    vlocation VARCHAR(100)
);
```

## Installation & Setup

### Prerequisites
- Java Development Kit (JDK) 17 or higher
- Apache Tomcat 10.1
- MySQL Server
- MySQL Connector/J (JDBC Driver)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/MrCoyote2075/Blood-Management.git
   ```

2. **Set up the database**
   - Start MySQL server
   - Create the databases using the SQL scripts provided above
   - Update database credentials in JSP files if needed (default: root/root)

3. **Configure Tomcat**
   - Add the MySQL Connector/J JAR to your Tomcat's lib folder or project classpath
   - Deploy the BloodManagement project to Tomcat

4. **Access the application**
   - Start Tomcat server
   - Navigate to `http://localhost:8080/BloodManagement/`

## Usage

### Patient Registration Flow
1. Enter Patient ID and Hospital Name on the main page
2. System fetches patient data and blood requirement
3. Dijkstra's algorithm finds the nearest hospital with available blood
4. Results display the source hospital and nearest available blood source

### Admin Functions
1. Click "Admin Panel" from the main page
2. **ADD Blood Availability**: Add new blood bank data
3. **Show Blood Data**: View all blood bank inventories
4. **Insert New Record**: Register new patients
5. **Show Patient Data**: View all registered patients

## Algorithm Details

The system uses **Dijkstra's Shortest Path Algorithm** to find the nearest hospital with the required blood type:

- Represents hospitals as nodes in a weighted graph
- Edge weights represent distances between hospitals
- Finds the nearest hospital that has the required blood type in stock
- Optimizes emergency blood procurement routes

## Screenshots

### Main Page (Blood Alert System)
The entry point for patient registration with modern gradient UI design.

### Admin Dashboard
Centralized control panel for blood bank management.

### Blood Search Results
Displays the nearest hospital with available blood based on the algorithm.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is open source and available for educational purposes.

## Contact

For questions or support, please open an issue in the GitHub repository.

---

**Note**: This is an educational project demonstrating the integration of graph algorithms with a healthcare management system. For production use, additional security measures, input validation, and proper error handling should be implemented.
