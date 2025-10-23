<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Add cache control headers
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Student Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated background particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .particle {
            position: absolute;
            display: block;
            pointer-events: none;
            opacity: 0.3;
        }

        .particle::before {
            content: '✦';
            position: absolute;
            width: 100%;
            height: 100%;
            background: transparent;
            font-size: 20px;
            color: white;
        }

        @keyframes float-up {
            to {
                transform: translateY(-100vh) rotate(360deg);
                opacity: 0;
            }
        }

        .container {
            max-width: 800px;
            width: 90%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            animation: fadeInUp 1s ease-out;
            transform-style: preserve-3d;
            perspective: 1000px;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px) rotateX(10deg);
            }
            to {
                opacity: 1;
                transform: translateY(0) rotateX(0);
            }
        }

        /* Animated background pattern */
        .bg-pattern {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(255, 255, 255, 0.1) 0%, transparent 20%),
                radial-gradient(circle at 80% 70%, rgba(255, 255, 255, 0.1) 0%, transparent 20%);
            z-index: -1;
            animation: pattern-move 20s linear infinite;
        }

        @keyframes pattern-move {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(50px, 50px);
            }
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 60px 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        /* Animated header elements */
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.05"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>') repeat;
            opacity: 0.3;
        }

        .floating-symbols {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .floating-symbol {
            position: absolute;
            font-size: 20px;
            opacity: 0.2;
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
            }
        }

        .logo {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 2;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 20px;
            position: relative;
            z-index: 2;
        }

        .main-content {
            padding: 60px 40px;
            text-align: center;
            position: relative;
        }

        .welcome-title {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 20px;
            animation: slideIn 1s ease-out 0.5s both;
            position: relative;
        }

        .welcome-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 3px;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .description {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 40px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .cta-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
            z-index: -1;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
        }

        .secondary-btn {
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
            padding: 13px 38px;
        }

        .secondary-btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-3px);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 60px;
            padding: 0 20px;
        }

        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
            border-top: 4px solid #667eea;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .feature-card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            animation: pulse 2s infinite;
            position: relative;
        }

        .feature-icon::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            animation: ripple 2s infinite;
        }

        @keyframes ripple {
            0% {
                transform: scale(1);
                opacity: 0.5;
            }
            100% {
                transform: scale(1.5);
                opacity: 0;
            }
        }

        .feature-title {
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .feature-desc {
            color: #666;
            font-size: 0.95rem;
        }

        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 0.9rem;
            position: relative;
            overflow: hidden;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="footer-pattern" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23footer-pattern)"/></svg>') repeat;
            opacity: 0.1;
        }

        .decorative-shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float-shape 20s infinite linear;
        }

        @keyframes float-shape {
            0% {
                transform: translate(0, 0) rotate(0deg);
            }
            100% {
                transform: translate(30px, -30px) rotate(360deg);
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 40px 20px;
            }

            .logo {
                font-size: 2.5rem;
            }

            .main-content {
                padding: 40px 20px;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .features {
                grid-template-columns: 1fr;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Animated background particles -->
    <div class="particles" id="particles"></div>

    <div class="container">
        <div class="bg-pattern"></div>
        
        <header class="header">
            <!-- Floating symbols in header -->
            <div class="floating-symbols">
                <span class="floating-symbol" style="left: 10%; animation-delay: 0s;">✦</span>
                <span class="floating-symbol" style="left: 20%; animation-delay: 2s;">✧</span>
                <span class="floating-symbol" style="left: 30%; animation-delay: 4s;">✦</span>
                <span class="floating-symbol" style="left: 40%; animation-delay: 6s;">✧</span>
                <span class="floating-symbol" style="left: 50%; animation-delay: 8s;">✦</span>
                <span class="floating-symbol" style="left: 60%; animation-delay: 10s;">✧</span>
                <span class="floating-symbol" style="left: 70%; animation-delay: 12s;">✦</span>
                <span class="floating-symbol" style="left: 80%; animation-delay: 14s;">✧</span>
                <span class="floating-symbol" style="left: 90%; animation-delay: 16s;">✦</span>
            </div>
            
            <div class="logo">📚 SMS</div>
            <p class="subtitle">Empowering Education Through Innovation</p>
        </header>

        <main class="main-content">
            <h1 class="welcome-title">Welcome to Student Management System</h1>
            <p class="description">
                Streamline your student data, track progress, and enhance administrative efficiency with our intuitive platform designed for educators and administrators.
            </p>

            <div class="cta-section">
                <a href="StudentServlet?action=list" class="btn">Manage Students</a>
                <a href="#" class="btn secondary-btn">Learn More</a>
            </div>

            <section class="features">
                <div class="feature-card">
                    <div class="feature-icon">👥</div>
                    <h3 class="feature-title">Student Profiles</h3>
                    <p class="feature-desc">Comprehensive profiles with grades, attendance, and personal info at your fingertips.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📊</div>
                    <h3 class="feature-title">Analytics Dashboard</h3>
                    <p class="feature-desc">Visual insights into performance trends and reports to drive informed decisions.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🔒</div>
                    <h3 class="feature-title">Secure Access</h3>
                    <p class="feature-desc">Role-based permissions ensure data privacy and controlled access for all users.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📝</div>
                    <h3 class="feature-title">Attendance Tracking</h3>
                    <p class="feature-desc">Automated attendance logging and real-time notifications to monitor student participation effortlessly.</p>
                </div>
            </section>
        </main>

        <footer class="footer">
            <!-- Decorative shapes in footer -->
            <div class="decorative-shape" style="width: 50px; height: 50px; top: 10px; left: 10%;"></div>
            <div class="decorative-shape" style="width: 30px; height: 30px; top: 20px; right: 15%;"></div>
            <div class="decorative-shape" style="width: 40px; height: 40px; bottom: 10px; left: 30%;"></div>
            
            <p>&copy; 2025 Student Management System. All rights reserved.</p>
        </footer>
    </div>

    <script>
        // Create animated particles
        document.addEventListener('DOMContentLoaded', function() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 50;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('span');
                particle.classList.add('particle');
                
                // Random position
                const posX = Math.random() * 100;
                const posY = Math.random() * 100;
                
                // Random size
                const size = Math.random() * 10 + 5;
                
                // Random animation duration
                const duration = Math.random() * 20 + 10;
                
                // Random delay
                const delay = Math.random() * 5;
                
                particle.style.left = `${posX}%`;
                particle.style.top = `${posY}%`;
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                particle.style.animationDuration = `${duration}s`;
                particle.style.animationDelay = `${delay}s`;
                particle.style.animation = `float-up ${duration}s linear infinite`;
                
                particlesContainer.appendChild(particle);
            }
        });
    </script>
</body>
</html>