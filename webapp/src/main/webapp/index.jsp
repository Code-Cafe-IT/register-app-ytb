<form action="action_page.php">
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautiful AWS Heading with Image</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
        }
        .aws-heading {
            font-size: 8rem;
            font-weight: bold;
            color: #252f3e; 
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            animation: gradient 3s ease infinite;
            background: linear-gradient(45deg, #f2f7f7, #252f3e, #f2f7f7);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            margin-bottom: 20px;
        }
        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        .aws-image {
            width: 300px; /* Adjust the width as needed */
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <h1 class="aws-heading">Cloud Provider AWS</h1>
    <img src="./aws.jpg" alt="AWS Image" class="aws-image">
</body>
</form>
