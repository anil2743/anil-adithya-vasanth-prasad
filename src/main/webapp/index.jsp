<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeuralForge AI - Advanced AI/ML Solutions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #4a00e0;
            --secondary-color: #8e2de2;
            --accent-color: #00d4ff;
            --dark-bg: #0a0a0a;
            --light-text: #ffffff;
            --dark-text: #333333;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--dark-bg);
            color: var(--light-text);
            overflow-x: hidden;
            cursor: none;
        }

        /* Custom Cursor */
        .custom-cursor {
            position: fixed;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: rgba(0, 212, 255, 0.5);
            pointer-events: none;
            z-index: 9999;
            transition: transform 0.1s ease;
            mix-blend-mode: difference;
        }

        .cursor-trail {
            position: fixed;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 1px solid rgba(0, 212, 255, 0.3);
            pointer-events: none;
            z-index: 9998;
            transition: transform 0.3s ease;
        }

        /* Animated Background */
        .bg-animation {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
            background: linear-gradient(45deg, #0a0a0a, #1a1a2e);
            overflow: hidden;
        }

        .particle {
            position: absolute;
            width: 3px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 50%;
            opacity: 0.5;
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(100vh) translateX(0);
                opacity: 0;
            }
            10% {
                opacity: 0.5;
            }
            90% {
                opacity: 0.5;
            }
            100% {
                transform: translateY(-100vh) translateX(100px);
                opacity: 0;
            }
        }

        /* Data Stream Effect */
        .data-stream {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            opacity: 0.1;
            overflow: hidden;
        }

        .stream-column {
            position: absolute;
            top: -100%;
            width: 20px;
            height: 100%;
            font-family: monospace;
            font-size: 14px;
            color: var(--accent-color);
            animation: stream 10s linear infinite;
        }

        @keyframes stream {
            0% {
                transform: translateY(-100%);
            }
            100% {
                transform: translateY(100%);
            }
        }

        /* Navigation */
        nav {
            position: fixed;
            width: 100%;
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        nav.scrolled {
            background-color: rgba(10, 10, 10, 0.9);
            backdrop-filter: blur(10px);
            padding: 15px 50px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 30px;
        }

        .nav-links a {
            color: var(--light-text);
            text-decoration: none;
            font-size: 16px;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            text-align: center;
            z-index: 2;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 4rem;
            margin-bottom: 20px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color), var(--accent-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            animation: gradient 3s ease infinite;
            background-size: 200% 200%;
            overflow: hidden;
        }

        .hero-text-reveal {
            display: inline-block;
            position: relative;
        }

        .hero-text-reveal::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--dark-bg);
            animation: revealText 2s forwards;
            animation-delay: 0.5s;
        }

        @keyframes revealText {
            0% {
                transform: translateX(-100%);
            }
            100% {
                transform: translateX(100%);
            }
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

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 30px;
            opacity: 0.8;
        }

        .cta-button {
            display: inline-block;
            padding: 15px 30px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .cta-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
            z-index: -1;
            transition: all 0.3s ease;
            opacity: 0;
        }

        .cta-button:hover::before {
            opacity: 1;
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(142, 45, 226, 0.3);
        }

        .button-pulse {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            height: 100%;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.2);
            opacity: 0;
            z-index: -1;
        }

        .cta-button:hover .button-pulse {
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% {
                transform: translate(-50%, -50%) scale(1);
                opacity: 0.7;
            }
            100% {
                transform: translate(-50%, -50%) scale(1.5);
                opacity: 0;
            }
        }

        /* Interactive Neural Network */
        .neural-network {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            opacity: 0.3;
        }

        .node {
            position: absolute;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: var(--accent-color);
            box-shadow: 0 0 10px var(--accent-color);
        }

        .connection {
            position: absolute;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
            transform-origin: left center;
            animation: pulseGlow 3s infinite alternate;
        }

        @keyframes pulseGlow {
            0% {
                opacity: 0.3;
                box-shadow: 0 0 5px var(--accent-color);
            }
            100% {
                opacity: 0.8;
                box-shadow: 0 0 15px var(--accent-color);
            }
        }

        /* Prediction Path Animation */
        .prediction-path {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1;
            pointer-events: none;
        }

        .input-dot {
            position: absolute;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: var(--primary-color);
            box-shadow: 0 0 15px var(--primary-color);
            left: 10%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .output-dot {
            position: absolute;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: var(--accent-color);
            box-shadow: 0 0 15px var(--accent-color);
            right: 10%;
            top: 50%;
            transform: translate(50%, -50%);
        }

        .path-line {
            position: absolute;
            height: 2px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            top: 50%;
            left: 10%;
            width: 0;
            transform: translateY(-50%);
            animation: drawPath 3s forwards;
            animation-delay: 1s;
        }

        @keyframes drawPath {
            0% {
                width: 0;
            }
            100% {
                width: 80%;
            }
        }

        /* Training Visualization */
        .training-viz {
            position: relative;
            width: 100%;
            height: 200px;
            margin: 50px 0;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        .viz-title {
            position: absolute;
            top: 10px;
            left: 20px;
            font-size: 14px;
            opacity: 0.7;
        }

        .graph {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .loss-curve {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        /* Voice Recognition Waves */
        .voice-waves {
            position: absolute;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .wave-bar {
            width: 4px;
            height: 20px;
            background: var(--accent-color);
            border-radius: 2px;
            animation: wave 1.5s infinite ease-in-out;
        }

        .wave-bar:nth-child(2) {
            animation-delay: 0.1s;
        }

        .wave-bar:nth-child(3) {
            animation-delay: 0.2s;
        }

        .wave-bar:nth-child(4) {
            animation-delay: 0.3s;
        }

        .wave-bar:nth-child(5) {
            animation-delay: 0.4s;
        }

        @keyframes wave {
            0%, 100% {
                height: 20px;
            }
            50% {
                height: 40px;
            }
        }

        /* Code Reveal Animation */
        .code-container {
            position: relative;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            padding: 20px;
            margin: 30px 0;
            font-family: monospace;
            font-size: 14px;
            overflow: hidden;
        }

        .code-title {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 12px;
            opacity: 0.5;
        }

        .code-line {
            margin: 5px 0;
            opacity: 0;
            animation: fadeInCode 0.5s forwards;
        }

        @keyframes fadeInCode {
            to {
                opacity: 1;
            }
        }

        .code-keyword {
            color: #c792ea;
        }

        .code-string {
            color: #c3e88d;
        }

        .code-function {
            color: #82aaff;
        }

        .code-comment {
            color: #546e7a;
            font-style: italic;
        }

        /* Services Section */
        .services {
            padding: 100px 50px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        }

        .service-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(74, 0, 224, 0.1), rgba(0, 212, 255, 0.1));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .service-card:hover::before {
            opacity: 1;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(74, 0, 224, 0.2);
        }

        .service-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .service-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        .service-description {
            opacity: 0.8;
            line-height: 1.6;
        }

        /* Features Section */
        .features {
            padding: 100px 50px;
            background: rgba(255, 255, 255, 0.02);
        }

        .feature-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .feature-item {
            text-align: center;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            transform: scale(1.05);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            box-shadow: 0 10px 20px rgba(74, 0, 224, 0.2);
            transition: all 0.3s ease;
        }

        .feature-item:hover .feature-icon {
            box-shadow: 0 15px 30px rgba(74, 0, 224, 0.4);
            transform: rotate(5deg);
        }

        .feature-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        /* Contact Section */
        .contact {
            padding: 100px 50px;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .contact-form {
            margin-top: 50px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 15px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            color: white;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 10px rgba(0, 212, 255, 0.2);
        }

        .submit-btn {
            padding: 15px 30px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: 50px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            position: relative;
            overflow: hidden;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(142, 45, 226, 0.3);
        }

        /* Footer */
        footer {
            padding: 30px 50px;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .social-links {
            margin-top: 20px;
        }

        .social-links a {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            margin: 0 10px;
            color: white;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            transform: translateY(-3px);
        }

        /* Section Transitions */
        .section-transition {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--dark-bg);
            z-index: 10000;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.5s ease;
        }

        .section-transition.active {
            opacity: 1;
            pointer-events: all;
        }

        .transition-content {
            text-align: center;
        }

        .transition-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero p {
                font-size: 1.2rem;
            }
            
            nav {
                padding: 15px 20px;
            }
            
            .nav-links {
                display: none;
            }
            
            .services, .features, .contact {
                padding: 50px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Custom Cursor -->
    <div class="custom-cursor" id="customCursor"></div>
    <div class="cursor-trail" id="cursorTrail"></div>

    <!-- Animated Background -->
    <div class="bg-animation" id="bgAnimation"></div>

    <!-- Data Stream Effect -->
    <div class="data-stream" id="dataStream"></div>

    <!-- Section Transition -->
    <div class="section-transition" id="sectionTransition">
        <div class="transition-content">
            <div class="transition-icon"><i class="fas fa-brain"></i></div>
            <h2>Processing Data...</h2>
        </div>
    </div>

    <!-- Navigation -->
    <nav id="navbar">
        <a href="#" class="logo">NeuralForge AI</a>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#features">Features</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="neural-network" id="neuralNetwork"></div>
        <div class="prediction-path" id="predictionPath">
            <div class="input-dot"></div>
            <div class="path-line"></div>
            <div class="output-dot"></div>
        </div>
        <div class="hero-content">
            <h1><span class="hero-text-reveal">Transform Your Business with AI</span></h1>
            <p>Unlock the power of machine learning and artificial intelligence to drive innovation and growth</p>
            <a href="#services" class="cta-button">
                Explore Our Solutions
                <div class="button-pulse"></div>
            </a>
        </div>
        <div class="voice-waves">
            <div class="wave-bar"></div>
            <div class="wave-bar"></div>
            <div class="wave-bar"></div>
            <div class="wave-bar"></div>
            <div class="wave-bar"></div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services" id="services">
        <h2 class="section-title">Our AI/ML Services</h2>
        
        <!-- Training Visualization -->
        <div class="training-viz">
            <div class="viz-title">Model Training Progress</div>
            <div class="graph">
                <canvas id="lossCurve" width="100%" height="100%"></canvas>
            </div>
        </div>
        
        <!-- Code Reveal Animation -->
        <div class="code-container">
            <div class="code-title">model.py</div>
            <div id="codeReveal"></div>
        </div>
        
        <div class="service-cards">
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-brain"></i></div>
                <h3 class="service-title">Deep Learning Solutions</h3>
                <p class="service-description">Custom neural networks designed to solve complex business problems with unprecedented accuracy and efficiency.</p>
            </div>
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-chart-line"></i></div>
                <h3 class="service-title">Predictive Analytics</h3>
                <p class="service-description">Leverage historical data to forecast trends, identify opportunities, and make data-driven decisions with confidence.</p>
            </div>
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-robot"></i></div>
                <h3 class="service-title">Automation Systems</h3>
                <p class="service-description">Streamline operations with intelligent automation that learns and adapts to your business processes.</p>
            </div>
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-language"></i></div>
                <h3 class="service-title">Natural Language Processing</h3>
                <p class="service-description">Extract insights from text data, enable human-computer interaction, and automate language-based tasks.</p>
            </div>
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-eye"></i></div>
                <h3 class="service-title">Computer Vision</h3>
                <p class="service-description">Transform visual data into actionable insights with advanced image recognition and analysis systems.</p>
            </div>
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-cogs"></i></div>
                <h3 class="service-title">AI Integration</h3>
                <p class="service-description">Seamlessly incorporate AI capabilities into your existing systems and workflows for maximum impact.</p>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <h2 class="section-title">Why Choose NeuralForge AI</h2>
        <div class="feature-container">
            <div class="feature-item">
                <div class="feature-icon"><i class="fas fa-rocket"></i></div>
                <h3 class="feature-title">Rapid Implementation</h3>
                <p>From concept to deployment in weeks, not months</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                <h3 class="feature-title">Enterprise Security</h3>
                <p>Bank-level encryption and data protection</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fas fa-chart-bar"></i></div>
                <h3 class="feature-title">Measurable ROI</h3>
                <p>Track performance and demonstrate value</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fas fa-users"></i></div>
                <h3 class="feature-title">Expert Support</h3>
                <p>24/7 assistance from AI specialists</p>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <h2 class="section-title">Start Your AI Journey</h2>
        <p>Ready to transform your business with AI? Get in touch with our experts today.</p>
        <form class="contact-form" action="#" method="post">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="company">Company</label>
                <input type="text" id="company" name="company" class="form-control">
            </div>
            <div class="form-group">
                <label for="message">Tell us about your project</label>
                <textarea id="message" name="message" rows="5" class="form-control" required></textarea>
            </div>
            <button type="submit" class="submit-btn">Send Message</button>
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2023 NeuralForge AI. All rights reserved.</p>
        <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>
            <a href="#"><i class="fab fa-facebook"></i></a>
        </div>
    </footer>

    <script>
        // Custom Cursor
        function initCustomCursor() {
            const cursor = document.getElementById('customCursor');
            const trail = document.getElementById('cursorTrail');
            
            document.addEventListener('mousemove', (e) => {
                cursor.style.left = e.clientX - 10 + 'px';
                cursor.style.top = e.clientY - 10 + 'px';
                
                setTimeout(() => {
                    trail.style.left = e.clientX - 20 + 'px';
                    trail.style.top = e.clientY - 20 + 'px';
                }, 100);
            });
            
            // Change cursor color based on section
            const sections = document.querySelectorAll('section');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const sectionId = entry.target.id;
                        
                        if (sectionId === 'home') {
                            cursor.style.background = 'rgba(0, 212, 255, 0.5)';
                            trail.style.borderColor = 'rgba(0, 212, 255, 0.3)';
                        } else if (sectionId === 'services') {
                            cursor.style.background = 'rgba(142, 45, 226, 0.5)';
                            trail.style.borderColor = 'rgba(142, 45, 226, 0.3)';
                        } else if (sectionId === 'features') {
                            cursor.style.background = 'rgba(74, 0, 224, 0.5)';
                            trail.style.borderColor = 'rgba(74, 0, 224, 0.3)';
                        } else if (sectionId === 'contact') {
                            cursor.style.background = 'rgba(255, 105, 180, 0.5)';
                            trail.style.borderColor = 'rgba(255, 105, 180, 0.3)';
                        }
                    }
                });
            }, { threshold: 0.5 });
            
            sections.forEach(section => {
                observer.observe(section);
            });
            
            // Scale effect on clickable elements
            const clickableElements = document.querySelectorAll('a, button, .service-card, .feature-item');
            
            clickableElements.forEach(element => {
                element.addEventListener('mouseenter', () => {
                    cursor.style.transform = 'scale(2)';
                });
                
                element.addEventListener('mouseleave', () => {
                    cursor.style.transform = 'scale(1)';
                });
            });
        }

        // Create animated particles
        function createParticles() {
            const bgAnimation = document.getElementById('bgAnimation');
            const particleCount = 50;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 15 + 's';
                particle.style.animationDuration = (15 + Math.random() * 10) + 's';
                bgAnimation.appendChild(particle);
            }
        }

        // Create data stream effect
        function createDataStream() {
            const dataStream = document.getElementById('dataStream');
            const streamCount = 10;
            
            for (let i = 0; i < streamCount; i++) {
                const stream = document.createElement('div');
                stream.classList.add('stream-column');
                stream.style.left = (i * 10) + '%';
                stream.style.animationDelay = Math.random() * 10 + 's';
                stream.style.animationDuration = (10 + Math.random() * 5) + 's';
                
                // Generate binary data
                let binaryData = '';
                for (let j = 0; j < 100; j++) {
                    binaryData += Math.random() > 0.5 ? '1' : '0';
                    if (j % 10 === 9) binaryData += '<br>';
                }
                
                stream.innerHTML = binaryData;
                dataStream.appendChild(stream);
            }
            
            // Make streams react to mouse movement
            document.addEventListener('mousemove', (e) => {
                const mouseX = e.clientX / window.innerWidth;
                const mouseY = e.clientY / window.innerHeight;
                
                const streams = document.querySelectorAll('.stream-column');
                streams.forEach((stream, index) => {
                    const streamX = index / streamCount;
                    const distance = Math.abs(mouseX - streamX);
                    
                    if (distance < 0.2) {
                        const curve = (mouseY - 0.5) * 20;
                        stream.style.transform = `translateX(${curve}px)`;
                    } else {
                        stream.style.transform = 'translateX(0)';
                    }
                });
            });
        }

        // Create interactive neural network
        function createNeuralNetwork() {
            const neuralNetwork = document.getElementById('neuralNetwork');
            const nodeCount = 15;
            const nodes = [];
            
            // Create nodes
            for (let i = 0; i < nodeCount; i++) {
                const node = document.createElement('div');
                node.classList.add('node');
                
                const x = Math.random() * 100;
                const y = Math.random() * 100;
                
                node.style.left = x + '%';
                node.style.top = y + '%';
                
                neuralNetwork.appendChild(node);
                nodes.push({ element: node, x, y });
            }
            
            // Create connections
            for (let i = 0; i < nodeCount; i++) {
                for (let j = i + 1; j < nodeCount; j++) {
                    if (Math.random() > 0.7) {
                        const connection = document.createElement('div');
                        connection.classList.add('connection');
                        
                        const x1 = nodes[i].x;
                        const y1 = nodes[i].y;
                        const x2 = nodes[j].x;
                        const y2 = nodes[j].y;
                        
                        const length = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
                        const angle = Math.atan2(y2 - y1, x2 - x1) * 180 / Math.PI;
                        
                        connection.style.width = length + '%';
                        connection.style.left = x1 + '%';
                        connection.style.top = y1 + '%';
                        connection.style.transform = `rotate(${angle}deg)`;
                        
                        neuralNetwork.appendChild(connection);
                    }
                }
            }
            
            // Animate nodes on mouse move
            document.addEventListener('mousemove', (e) => {
                const mouseX = e.clientX / window.innerWidth;
                const mouseY = e.clientY / window.innerHeight;
                
                nodes.forEach(node => {
                    const distance = Math.sqrt(
                        Math.pow(mouseX - node.x / 100, 2) + 
                        Math.pow(mouseY - node.y / 100, 2)
                    );
                    
                    if (distance < 0.2) {
                        const moveX = (node.x / 100 - mouseX) * 10;
                        const moveY = (node.y / 100 - mouseY) * 10;
                        
                        node.element.style.transform = `translate(${moveX}px, ${moveY}px)`;
                        node.element.style.boxShadow = '0 0 20px var(--accent-color)';
                    } else {
                        node.element.style.transform = 'translate(0, 0)';
                        node.element.style.boxShadow = '0 0 10px var(--accent-color)';
                    }
                });
            });
        }

        // Training Visualization
        function initTrainingVisualization() {
            const canvas = document.getElementById('lossCurve');
            const ctx = canvas.getContext('2d');
            
            // Set canvas size
            canvas.width = canvas.offsetWidth;
            canvas.height = canvas.offsetHeight;
            
            // Generate initial data
            const epochs = 100;
            const lossData = [];
            let currentEpoch = 0;
            
            for (let i = 0; i < epochs; i++) {
                // Simulate decreasing loss with some noise
                const loss = 2 * Math.exp(-i / 20) + 0.1 * Math.random();
                lossData.push(loss);
            }
            
            // Draw function
            function drawLossCurve() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                
                // Draw axes
                ctx.strokeStyle = 'rgba(255, 255, 255, 0.3)';
                ctx.lineWidth = 1;
                ctx.beginPath();
                ctx.moveTo(40, 20);
                ctx.lineTo(40, canvas.height - 40);
                ctx.lineTo(canvas.width - 20, canvas.height - 40);
                ctx.stroke();
                
                // Draw labels
                ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
                ctx.font = '12px monospace';
                ctx.fillText('Loss', 10, 20);
                ctx.fillText('Epochs', canvas.width - 50, canvas.height - 20);
                
                // Draw curve
                ctx.strokeStyle = 'var(--accent-color)';
                ctx.lineWidth = 2;
                ctx.beginPath();
                
                const xStep = (canvas.width - 60) / epochs;
                const yScale = (canvas.height - 60) / 2;
                
                for (let i = 0; i <= currentEpoch && i < epochs; i++) {
                    const x = 40 + i * xStep;
                    const y = canvas.height - 40 - lossData[i] * yScale;
                    
                    if (i === 0) {
                        ctx.moveTo(x, y);
                    } else {
                        ctx.lineTo(x, y);
                    }
                }
                
                ctx.stroke();
                
                // Draw current point
                if (currentEpoch > 0 && currentEpoch <= epochs) {
                    const x = 40 + currentEpoch * xStep;
                    const y = canvas.height - 40 - lossData[currentEpoch - 1] * yScale;
                    
                    ctx.fillStyle = 'var(--accent-color)';
                    ctx.beginPath();
                    ctx.arc(x, y, 4, 0, Math.PI * 2);
                    ctx.fill();
                }
                
                // Draw current epoch value
                if (currentEpoch > 0 && currentEpoch <= epochs) {
                    ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
                    ctx.font = '12px monospace';
                    ctx.fillText(`Epoch: ${currentEpoch}/${epochs}`, canvas.width - 100, 20);
                    ctx.fillText(`Loss: ${lossData[currentEpoch - 1].toFixed(4)}`, canvas.width - 100, 40);
                }
            }
            
            // Animation loop
            function animate() {
                if (currentEpoch < epochs) {
                    currentEpoch += 1;
                    drawLossCurve();
                    setTimeout(animate, 50);
                } else {
                    // Reset and restart
                    setTimeout(() => {
                        currentEpoch = 0;
                        animate();
                    }, 2000);
                }
            }
            
            // Start animation when visible
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        animate();
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });
            
            observer.observe(canvas);
        }

        // Code Reveal Animation
        function initCodeReveal() {
            const codeContainer = document.getElementById('codeReveal');
            
            const codeLines = [
                '<span class="code-comment"># Define our neural network model</span>',
                '<span class="code-keyword">class</span> <span class="code-function">NeuralNetwork</span>(nn.Module):',
                '    <span class="code-keyword">def</span> <span class="code-function">__init__</span>(<span class="code-keyword">self</span>):',
                '        <span class="code-keyword">super</span>(NeuralNetwork, <span class="code-keyword">self</span>).__init__()',
                '        <span class="code-keyword">self</span>.layer1 = nn.Linear(784, 128)',
                '        <span class="code-keyword">self</span>.layer2 = nn.Linear(128, 64)',
                '        <span class="code-keyword">self</span>.layer3 = nn.Linear(64, 10)',
                '        <span class="code-keyword">self</span>.relu = nn.ReLU()',
                '',
                '    <span class="code-keyword">def</span> <span class="code-function">forward</span>(<span class="code-keyword">self</span>, x):',
                '        x = <span class="code-keyword">self</span>.relu(<span class="code-keyword">self</span>.layer1(x))',
                '        x = <span class="code-keyword">self</span>.relu(<span class="code-keyword">self</span>.layer2(x))',
                '        x = <span class="code-keyword">self</span>.layer3(x)',
                '        <span class="code-keyword">return</span> x',
                '',
                '<span class="code-comment"># Initialize and train the model</span>',
                'model = NeuralNetwork()',
                'optimizer = torch.optim.Adam(model.parameters(), lr=0.001)',
                'criterion = nn.CrossEntropyLoss()',
                '',
                '<span class="code-keyword">for</span> epoch <span class="code-keyword">in</span> range(100):',
                '    <span class="code-keyword">for</span> inputs, labels <span class="code-keyword">in</span> dataloader:',
                '        outputs = model(inputs)',
                '        loss = criterion(outputs, labels)',
                '        optimizer.zero_grad()',
                '        loss.backward()',
                '        optimizer.step()'
            ];
            
            // Add code lines with delay
            codeLines.forEach((line, index) => {
                const codeLine = document.createElement('div');
                codeLine.classList.add('code-line');
                codeLine.innerHTML = line;
                codeLine.style.animationDelay = `${index * 0.1}s`;
                codeContainer.appendChild(codeLine);
            });
        }

        // Section Transitions
        function initSectionTransitions() {
            const sections = document.querySelectorAll('section');
            const sectionTransition = document.getElementById('sectionTransition');
            let lastSection = null;
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting && entry.target.id !== lastSection) {
                        lastSection = entry.target.id;
                        
                        // Show transition
                        sectionTransition.classList.add('active');
                        
                        // Hide transition after a short delay
                        setTimeout(() => {
                            sectionTransition.classList.remove('active');
                        }, 800);
                    }
                });
            }, { threshold: 0.1 });
            
            sections.forEach(section => {
                observer.observe(section);
            });
        }

        // Navbar scroll effect facing
        function initNavbarScroll() {
            const navbar = document.getElementById('navbar');
            
            window.addEventListener('scroll', () => {
                if (window.scrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
                }
            });
        }

        // Smooth scrolling for anchor links
        function initSmoothScrolling() {
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 70,
                            behavior: 'smooth'
                        });
                    }
                });
            });
        }

        // Form submission handling
        function initFormHandling() {
            const form = document.querySelector('.contact-form');
            
            form.addEventListener('submit', (e) => {
                e.preventDefault();
                
                // Create a success message
                const successMessage = document.createElement('div');
                successMessage.style.padding = '20px';
                successMessage.style.marginTop = '20px';
                successMessage.style.background = 'rgba(0, 212, 255, 0.2)';
                successMessage.style.borderRadius = '5px';
                successMessage.style.border = '1px solid rgba(0, 212, 255, 0.5)';
                successMessage.textContent = 'Thank you for your message! Our team will get back to you soon.';
                
                form.appendChild(successMessage);
                form.reset();
                
                // Remove the message after 5 seconds
                setTimeout(() => {
                    successMessage.remove();
                }, 5000);
            });
        }

        // Initialize all functions when DOM is loaded
        document.addEventListener('DOMContentLoaded', () => {
            initCustomCursor();
            createParticles();
            createDataStream();
            createNeuralNetwork();
            initTrainingVisualization();
            initCodeReveal();
            initSectionTransitions();
            initNavbarScroll();
            initSmoothScrolling();
            initFormHandling();
        });
    </script>
</body>
</html>
