<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blood Bank Data Management</title>
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #4A00E0, #8E2DE2); /* Updated Purple Gradient */
    margin: 0;
    padding: 20px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
}


        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateX(-5px);
        }

        form {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-top: 40px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .blood-type {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .blood-type:hover {
            background: #e9ecef;
            transform: translateY(-2px);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #7b68ee;
            outline: none;
            box-shadow: 0 0 0 3px rgba(123, 104, 238, 0.2);
        }

        input[type="submit"] {
            background: linear-gradient(to right, #7b68ee, #ff4b6b);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(123, 104, 238, 0.3);
        }

        .status-message {
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            display: none;
        }
    </style>
</head>
<body>
    <a href="AdminPage.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i> Back to Admin
    </a>

    <form action="AddBloodData.jsp" method="post" id="bloodDataForm">
        <h1>Blood Bank Data Entry</h1>

        <div class="form-group">
            <label>Location Name:</label>
            <input type="text" name="locationname" placeholder="Enter location name" required>
        </div>

        <div class="form-grid">
            <div class="blood-type">
                <label>A+:</label>
                <input type="text" name="A+" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>A-:</label>
                <input type="text" name="A-" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>B+:</label>
                <input type="text" name="B+" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>B-:</label>
                <input type="text" name="B-" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>AB+:</label>
                <input type="text" name="AB+" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>AB-:</label>
                <input type="text" name="AB-" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>O+:</label>
                <input type="text" name="O+" placeholder="Units" required>
            </div>

            <div class="blood-type">
                <label>O-:</label>
                <input type="text" name="O-" placeholder="Units" required>
            </div>
        </div>

        <div class="form-group">
            <label>Blood Bank Name:</label>
            <input type="text" name="bloodbankname" placeholder="Enter blood bank name" required>
        </div>

        <div class="form-group">
            <label>Blood Bank ID:</label>
            <input type="text" name="bloodbankid" placeholder="Enter blood bank ID" required>
        </div>

        <input type="submit" value="Add Blood Data">
        <div class="status-message" id="statusMessage"></div>
    </form>

    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>
        document.getElementById('bloodDataForm').addEventListener('submit', function(e) {
            const inputs = this.querySelectorAll('input[type="text"]');
            let isValid = true;

            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.style.borderColor = '#ff4b6b';
                } else {
                    input.style.borderColor = '#e1e1e1';
                }
            });

            if (!isValid) {
                e.preventDefault();
                showMessage('Please fill in all fields', 'error');
            }
        });

        function showMessage(message, type) {
            const statusMessage = document.getElementById('statusMessage');
            statusMessage.textContent = message;
            statusMessage.className = 'status-message ' + type;
            statusMessage.style.display = 'block';
            
            setTimeout(() => {
                statusMessage.style.display = 'none';
            }, 3000);
        }

        // Number validation for blood units
        document.querySelectorAll('.blood-type input').forEach(input => {
            input.addEventListener('input', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        });
    </script>
</body>
</html>
