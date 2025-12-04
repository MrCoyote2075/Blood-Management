# Blood Management System

A comprehensive Blood Bank Management System built with Java Servlets, JSP, and MySQL. This web application helps hospitals and blood banks manage blood inventory, track patient needs, and efficiently locate the nearest blood sources using Dijkstra's shortest path algorithm.

---

## 📋 Overview / Introduction

### What the System Is
The Blood Management System is a web-based application designed to streamline blood bank operations and facilitate efficient blood procurement during medical emergencies. It provides a centralized platform for managing blood inventory across multiple hospitals and blood banks.

### Problem It Solves
- **Emergency Blood Procurement**: In critical situations, finding the nearest blood source quickly can save lives. This system uses Dijkstra's shortest path algorithm to locate the closest hospital/blood bank with the required blood type.
- **Inventory Management**: Hospitals and blood banks often struggle with tracking blood availability. This system provides real-time inventory management for all blood types.
- **Patient Tracking**: Maintains comprehensive records of patients requiring blood transfusions, including emergency contact information.

### Who Are the Users
- **Donors**: Can be registered in the system for blood donation tracking
- **Recipients/Patients**: Individuals requiring blood transfusions who are registered with their blood type and hospital location
- **Administrators**: Hospital and blood bank staff who manage inventory, register patients, and monitor blood availability

---

## ✨ Features

### 🩸 Patient Management
- Register patients requiring blood transfusion
- Track patient details including name, blood group, and contact information
- Store relative/emergency contact details for notifications
- View all registered patient data

### 🏥 Blood Bank Administration
- Add and manage blood bank locations
- Track blood availability by type (A+, A-, B+, B-, AB+, AB-, O+, O-)
- View comprehensive blood inventory data
- Manage multiple hospital and blood bank records

### 🔍 Intelligent Blood Search
- **Dijkstra's Algorithm Implementation**: Automatically finds the nearest hospital/blood bank with the required blood type
- Distance-based optimization for emergency blood procurement
- Real-time blood availability checking
- Graph-based hospital network mapping

### 📊 Dashboard & Reports
- Admin dashboard for centralized management
- View all patient data in tabular format
- View all blood bank inventory with detailed information
- Quick statistics overview

### 🖥️ UI Pages Included
| Page | Description |
|------|-------------|
| `firstpage.html` | Main entry point - Blood Alert System registration |
| `AdminPage.jsp` | Admin dashboard with navigation to all admin functions |
| `SearchBlood.jsp` | Blood search results with Dijkstra's algorithm output |
| `InsertBloodAvail.jsp` | Form to add blood availability data |
| `ShowBloodDatas.jsp` | Display all blood bank inventory |
| `InsertDatasJsp.jsp` | Patient registration form |
| `PrintVivtimData.jsp` | Display all patient records |
| `FetchDataVictim.jsp` | Fetch and process patient details |
| `NotifyToRelative.jsp` | Relative notification page |

### 🔧 Utilities & Validations
- Client-side form validation using JavaScript
- Input sanitization for blood unit quantities (numbers only)
- Required field validation
- Real-time input feedback with visual indicators
- Responsive design for various screen sizes

---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Programming Language** | Java (Jakarta EE) |
| **Backend** | Java Servlets, JSP |
| **Server** | Apache Tomcat 10.1 |
| **Database** | MySQL |
| **Frontend** | HTML5, CSS3, JavaScript |
| **Styling** | Custom CSS with gradient designs |
| **Icons** | Font Awesome 5.15.4 |
| **IDE** | Eclipse |
| **JDK** | Java SE 17 |
| **JDBC Driver** | MySQL Connector/J |

---

## 🏗️ Project Architecture

### High-Level Flow
```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   User Input    │────▶│   JSP/Servlet   │────▶│   MySQL DB      │
│  (HTML Forms)   │     │   (Processing)  │     │   (Storage)     │
└─────────────────┘     └─────────────────┘     └─────────────────┘
         │                       │                       │
         │                       ▼                       │
         │              ┌─────────────────┐              │
         │              │   Dijkstra's    │              │
         │              │   Algorithm     │              │
         │              └─────────────────┘              │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────────────────────────────────────────────────────┐
│                     Response (HTML/JSP Output)                   │
└─────────────────────────────────────────────────────────────────┘
```

### Java Program Structure
```
BloodManagement/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/blood/step2/
│       │       ├── SearchinginJAVA.java    # Blood search servlet with city data handling
│       │       └── Step2.java              # Patient processing servlet
│       └── webapp/
│           ├── WEB-INF/
│           │   └── lib/
│           │       └── web.xml             # Servlet configuration & URL mappings
│           ├── META-INF/                   # Application metadata
│           ├── firstpage.html              # Main entry page (Blood Alert System)
│           ├── AdminPage.jsp               # Admin dashboard
│           ├── SearchBlood.jsp             # Blood search with Dijkstra's algorithm
│           ├── InsertBloodAvail.jsp        # Form: Add blood availability
│           ├── AddBloodData.jsp            # Process: Insert blood data to DB
│           ├── ShowBloodDatas.jsp          # Display blood inventory table
│           ├── InsertDatasJsp.jsp          # Form: Patient registration
│           ├── InsertVictimDataJsp.jsp     # Process: Insert patient data to DB
│           ├── PrintVivtimData.jsp         # Display patient data table
│           ├── FetchDataVictim.jsp         # Fetch patient details from DB
│           ├── Secondpage.jsp              # Processing/redirect page
│           └── NotifyToRelative.jsp        # Relative notification page
├── build/
│   └── classes/                            # Compiled Java classes
├── .classpath                              # Eclipse classpath configuration
├── .project                                # Eclipse project file
└── .settings/                              # IDE settings
```

### How Data Is Stored/Accessed
1. **Blood Availability Data**: Stored in `bloodavailability` database, `blooddata` table
   - Contains location IDs, hospital names, blood bank names, and blood unit counts for all 8 blood types
   - Accessed via JDBC connections in JSP files

2. **Patient Data**: Stored in `victims` database, `victimsdata` table
   - Contains patient ID, name, relative name, phone, blood group, and location
   - Auto-increment primary key for unique patient identification

3. **Graph Data**: Hospital distance matrix is currently hardcoded in `SearchBlood.jsp`
   - 5x5 adjacency matrix representing distances between 5 hospital nodes
   - Used by Dijkstra's algorithm to find the nearest hospital with required blood

---

## 🚀 How to Run the Project (Setup Instructions)

### Prerequisites
- **Java Development Kit (JDK)**: Version 17 or higher
- **Apache Tomcat**: Version 10.1 (supports Jakarta EE)
- **MySQL Server**: Version 8.0 or higher
- **MySQL Connector/J**: JDBC Driver for MySQL
- **IDE**: Eclipse (recommended) or IntelliJ IDEA

### Step-by-Step Guide

#### 1. Clone the Repository
```bash
git clone https://github.com/MrCoyote2075/Blood-Management.git
cd Blood-Management
```

#### 2. Set Up MySQL Databases

**Create Blood Availability Database:**
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

**Create Patients Database:**
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

#### 3. Configure Database Connection
Update the database credentials in the JSP files if your MySQL credentials differ from the default:
- Default username: `root`
- Default password: `root`
- Connection string: `jdbc:mysql://localhost:3306/<database_name>`

#### 4. Configure Apache Tomcat

1. Download and install Apache Tomcat 10.1
2. Add the MySQL Connector/J JAR to:
   - `<TOMCAT_HOME>/lib/` folder, OR
   - `BloodManagement/src/main/webapp/WEB-INF/lib/` folder
3. Import the project into Eclipse:
   - File → Import → Existing Projects into Workspace
   - Select the `BloodManagement` folder

#### 5. Deploy and Run

**Using Eclipse:**
1. Right-click on the project → Run As → Run on Server
2. Select Apache Tomcat 10.1
3. Click Finish

**Manual Deployment:**
1. Export the project as a WAR file
2. Copy the WAR to `<TOMCAT_HOME>/webapps/`
3. Start Tomcat: `./startup.sh` (Linux/Mac) or `startup.bat` (Windows)

#### 6. Access the Application
Open your browser and navigate to:
```
http://localhost:8080/BloodManagement/
```

---

## 📱 Usage

### Patient Blood Search Flow
1. Navigate to the main page (`firstpage.html`)
2. Enter Patient ID and Hospital Name (hospital ID number)
3. Click "Start" to initiate blood search
4. System fetches patient data and required blood type
5. Dijkstra's algorithm finds the nearest hospital with available blood
6. Results display the source hospital and nearest available blood source

### Admin Functions
1. Click "Admin Panel" from the main page
2. Available options:
   - **ADD Blood Availability**: Add new blood bank data with units for all blood types
   - **Show Blood Data**: View all blood bank inventories in a table
   - **Insert New Record**: Register new patients requiring blood
   - **Show Patient Data**: View all registered patients

---

## 📸 Screenshots

### Main Page (Blood Alert System)
![Main Page](./screenshots/main-page.png)
*The entry point for patient registration with modern gradient UI design*

### Admin Dashboard
![Admin Dashboard](./screenshots/admin-dashboard.png)
*Centralized control panel for blood bank management*

### Blood Bank Data Entry
![Blood Bank Entry](./screenshots/blood-bank-entry.png)
*Form to add blood availability data for different blood types*

### Blood Inventory View
![Blood Inventory](./screenshots/blood-inventory.png)
*Table displaying all blood bank inventory data*

### Patient Registration
![Patient Registration](./screenshots/patient-registration.png)
*Form to register new patients requiring blood transfusion*

### Patient Data View
![Patient Data](./screenshots/patient-data.png)
*Table displaying all registered patient information*

### Blood Search Results
![Search Results](./screenshots/search-results.png)
*Displays the nearest hospital with available blood based on Dijkstra's algorithm*

---

## 🔮 Future Improvements

### Database Enhancements
- [ ] Add user authentication table for admin login
- [ ] Implement donor registration database
- [ ] Add blood donation history tracking
- [ ] Create audit logs for all transactions

### Feature Additions
- [ ] **Authentication System**: Implement login/logout for admins with role-based access
- [ ] **Donor Management**: Complete donor registration and tracking module
- [ ] **Search Filters**: Add advanced filters for blood search (by location, availability, etc.)
- [ ] **Notification System**: SMS/Email notifications for relatives when blood is found
- [ ] **Blood Expiry Tracking**: Track blood bag expiry dates and send alerts
- [ ] **Dynamic Hospital Graph**: Allow admins to add/update hospital distance matrix

### UI/UX Improvements
- [ ] **Admin Dashboard UI**: Add visual charts and statistics (pie charts, bar graphs)
- [ ] **Mobile Responsive Design**: Optimize for mobile devices
- [ ] **Dark Mode**: Add dark theme option
- [ ] **Real-time Updates**: Use WebSockets for live inventory updates

### Technical Enhancements
- [ ] **Database Migration**: Support for MongoDB or PostgreSQL
- [ ] **RESTful API**: Create REST endpoints for mobile app integration
- [ ] **Microservices Architecture**: Split into independent services
- [ ] **Docker Support**: Containerize the application for easy deployment
- [ ] **Web App Deployment**: Deploy as a cloud-hosted web application (AWS, Heroku, etc.)

### Security Improvements
- [ ] Input sanitization and SQL injection prevention
- [ ] HTTPS implementation
- [ ] Password hashing for user authentication
- [ ] Session management and CSRF protection

---

## 👥 Contributors

We welcome contributions from the community! Here are the contributors to this project:

| Name | Role | GitHub |
|------|------|--------|
| MrCoyote2075 | Project Creator | [@MrCoyote2075](https://github.com/MrCoyote2075) |

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available for educational purposes.

---

## 📞 Contact

For questions, support, or feedback, please:
- Open an issue in the [GitHub repository](https://github.com/MrCoyote2075/Blood-Management/issues)
- Contact the maintainer through GitHub

---

## ⚠️ Disclaimer

**Note**: This is an educational project demonstrating the integration of graph algorithms with a healthcare management system. For production use, the following should be implemented:
- Proper security measures and input validation
- Error handling and logging
- Database connection pooling
- User authentication and authorization
- HIPAA compliance considerations for healthcare data

---

<p align="center">
  Made with ❤️ for saving lives through efficient blood management
</p>
