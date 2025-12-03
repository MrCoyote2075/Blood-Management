<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #8e44ad, #3498db);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
		.gobackbtn{
			text-align:left;
		}
	.gobackbtn a {
    position: absolute;
    top: 10px;
    left: 10px;
    padding: 10px 20px;
    background: linear-gradient(135deg, #ff6a00, #ee0979); /* Orange-Pink Gradient */
    color: white;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    transition: 0.3s ease-in-out;
}

    .goback a:hover {
    background: linear-gradient(135deg, #ee0979, #ff6a00); /* Reverse Gradient */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}
		
        .header {
            color: white;
            text-align: center;
            padding: 2rem;
            width: 100%;
            background: rgba(0, 0, 0, 0.2);
            margin-bottom: 2rem;
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 20px;
            max-width: 800px;
        }

        .button-container a {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-decoration: none;
            font-size: 18px;
            text-align: center;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button-container a:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .stats-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 12px;
            margin-top: 2rem;
            color: white;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            text-align: center;
        }

        .stat-item {
            padding: 15px;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.05);
        }

        @media (max-width: 768px) {
            .button-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Blood Bank Administration</h1>
        <p>Manage blood availability and donor information</p>
    </div>
    <div class="gobackbtn"><a href="firstpage.html" >Go Back</a> </div>

    <div class="button-container">
        <a href="InsertBloodAvail.jsp">
            <div>
                <i class="fas fa-plus"></i>
                ADD Blood Availability
            </div>
        </a>
        <a href="ShowBloodDatas.jsp">
            <div>
                <i class="fas fa-table"></i>
                Show Blood Data
            </div>
        </a>
        <a href="InsertDatasJsp.jsp">
            <div>
                <i class="fas fa-database"></i>
                Insert New Record
            </div>
        </a>
        <a href="PrintVivtimData.jsp">
            <div>
                <i class="fas fa-users"></i>
                Show Patient Data
            </div>
        </a>
    </div>

  <!--    <div class="stats-container">
        <h2>Quick Statistics</h2>
        <div class="stats-grid">
            <div class="stat-item">
                <h3>Total Donors</h3>
                <p id="donorCount">Loading...</p>
            </div>
            <div class="stat-item">
                <h3>Available Units</h3>
                <p id="unitsCount">Loading...</p>
            </div>
        </div>
    </div>
    -->

    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>
        // Simulate loading statistics
        setTimeout(() => {
            document.getElementById('donorCount').textContent = '150+';
            document.getElementById('unitsCount').textContent = '300+';
        }, 1000);

        // Add smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>