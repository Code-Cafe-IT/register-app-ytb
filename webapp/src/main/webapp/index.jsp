<form action="action_page.php">
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Beautiful AWS Heading with Background and Image</title>
      <style>
          body {
              display: flex;
              justify-content: center;
              align-items: center;
              height: 100vh;
              margin: 0;
              background-size: cover;
              font-family: 'Arial', sans-serif;
          }
          .overlay {
              position: absolute;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              background-color: rgba(0, 0, 0, 0.5);
              z-index: 1;
          }
          .content {
              position: relative;
              z-index: 2;
              text-align: center;
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
              width: 500px; 
              height: auto;
              border-radius: 10px;
              box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
          }
      </style>
  </head>
  <body>
      <div class="overlay"></div>
      <div class="content">
          <h1 class="aws-heading">CICD EKS CLUSTER</h1>
          <img src="./aws.jpg" alt="AWS Image" class="aws-image">
      </div>
  </body>
  </html>
  
</form>
