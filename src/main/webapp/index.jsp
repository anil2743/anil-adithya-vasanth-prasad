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

        /* Main Canvas Container */
        .canvas-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .ai-mind-canvas, .dream-sequence-canvas, .decision-tree-canvas, 
        .consciousness-wave-canvas, .evolution-canvas, .training-canvas,
        .mirror-canvas, .flow-field-canvas, .quantum-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
            background: rgba(10, 10, 10, 0.5);
            backdrop-filter: blur(10px);
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
            z-index: 10;
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

        /* AI Mind Visualization Controls */
        .viz-controls {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 100;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .viz-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .viz-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }

        .viz-btn.active {
            background: rgba(74, 0, 224, 0.5);
            border-color: var(--primary-color);
        }

        /* Services Section */
        .services {
            position: relative;
            z-index: 10;
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

        /* Contact Section */
        .contact {
            position: relative;
            z-index: 10;
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
            position: relative;
            z-index: 10;
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
            
            .services, .contact {
                padding: 50px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Custom Cursor -->
    <div class="custom-cursor" id="customCursor"></div>
    <div class="cursor-trail" id="cursorTrail"></div>

    <!-- Canvas Container for AI Visualizations -->
    <div class="canvas-container">
        <canvas class="ai-mind-canvas" id="aiMindCanvas"></canvas>
        <canvas class="dream-sequence-canvas" id="dreamSequenceCanvas"></canvas>
        <canvas class="decision-tree-canvas" id="decisionTreeCanvas"></canvas>
        <canvas class="consciousness-wave-canvas" id="consciousnessWaveCanvas"></canvas>
        <canvas class="evolution-canvas" id="evolutionCanvas"></canvas>
        <canvas class="training-canvas" id="trainingCanvas"></canvas>
        <canvas class="mirror-canvas" id="mirrorCanvas"></canvas>
        <canvas class="flow-field-canvas" id="flowFieldCanvas"></canvas>
        <canvas class="quantum-canvas" id="quantumCanvas"></canvas>
    </div>

    <!-- Visualization Controls -->
    <div class="viz-controls">
        <div class="viz-btn active" id="aiMindBtn" title="AI Mind Visualization">
            <i class="fas fa-brain"></i>
        </div>
        <div class="viz-btn" id="dreamSequenceBtn" title="AI Dream Sequence">
            <i class="fas fa-cloud"></i>
        </div>
        <div class="viz-btn" id="decisionTreeBtn" title="Decision Tree">
            <i class="fas fa-sitemap"></i>
        </div>
        <div class="viz-btn" id="consciousnessWaveBtn" title="Consciousness Wave">
            <i class="fas fa-water"></i>
        </div>
        <div class="viz-btn" id="evolutionBtn" title="Synthetic Evolution">
            <i class="fas fa-dna"></i>
        </div>
        <div class="viz-btn" id="trainingBtn" title="Model Training">
            <i class="fas fa-chart-line"></i>
        </div>
        <div class="viz-btn" id="mirrorBtn" title="Mirror Intelligence">
            <i class="fas fa-clone"></i>
        </div>
        <div class="viz-btn" id="flowFieldBtn" title="Predictive Flow Field">
            <i class="fas fa-wind"></i>
        </div>
        <div class="viz-btn" id="quantumBtn" title="Quantum Neural Matrix">
            <i class="fas fa-atom"></i>
        </div>
    </div>

    <!-- Navigation -->
    <nav id="navbar">
        <a href="#" class="logo">NeuralForge AI</a>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h1><span class="hero-text-reveal">Transform Your Business with AI</span></h1>
            <p>Unlock the power of machine learning and artificial intelligence to drive innovation and growth</p>
            <a href="#services" class="cta-button">
                Explore Our Solutions
                <div class="button-pulse"></div>
            </a>
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
        // Global variables
        let mouseX = 0, mouseY = 0;
        let activeVisualization = 'aiMind';
        let animationFrameId = null;
        let userInteractions = [];
        let evolutionStage = 1;
        let trainingProgress = 0;
        let lastInteractionTime = Date.now();
        
        // Initialize all canvases
        const aiMindCanvas = document.getElementById('aiMindCanvas');
        const dreamSequenceCanvas = document.getElementById('dreamSequenceCanvas');
        const decisionTreeCanvas = document.getElementById('decisionTreeCanvas');
        const consciousnessWaveCanvas = document.getElementById('consciousnessWaveCanvas');
        const evolutionCanvas = document.getElementById('evolutionCanvas');
        const trainingCanvas = document.getElementById('trainingCanvas');
        const mirrorCanvas = document.getElementById('mirrorCanvas');
        const flowFieldCanvas = document.getElementById('flowFieldCanvas');
        const quantumCanvas = document.getElementById('quantumCanvas');
        
        const aiMindCtx = aiMindCanvas.getContext('2d');
        const dreamSequenceCtx = dreamSequenceCanvas.getContext('2d');
        const decisionTreeCtx = decisionTreeCanvas.getContext('2d');
        const consciousnessWaveCtx = consciousnessWaveCanvas.getContext('2d');
        const evolutionCtx = evolutionCanvas.getContext('2d');
        const trainingCtx = trainingCanvas.getContext('2d');
        const mirrorCtx = mirrorCanvas.getContext('2d');
        const flowFieldCtx = flowFieldCanvas.getContext('2d');
        const quantumCtx = quantumCanvas.getContext('2d');
        
        // Set canvas sizes
        function resizeCanvases() {
            const canvases = [
                aiMindCanvas, dreamSequenceCanvas, decisionTreeCanvas,
                consciousnessWaveCanvas, evolutionCanvas, trainingCanvas,
                mirrorCanvas, flowFieldCanvas, quantumCanvas
            ];
            
            canvases.forEach(canvas => {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
            });
        }
        
        // Custom Cursor
        function initCustomCursor() {
            const cursor = document.getElementById('customCursor');
            const trail = document.getElementById('cursorTrail');
            
            document.addEventListener('mousemove', (e) => {
                mouseX = e.clientX;
                mouseY = e.clientY;
                
                cursor.style.left = mouseX - 10 + 'px';
                cursor.style.top = mouseY - 10 + 'px';
                
                setTimeout(() => {
                    trail.style.left = mouseX - 20 + 'px';
                    trail.style.top = mouseY - 20 + 'px';
                }, 100);
                
                // Track user interactions for AI Mind visualization
                const currentTime = Date.now();
                const timeDiff = currentTime - lastInteractionTime;
                lastInteractionTime = currentTime;
                
                userInteractions.push({
                    x: mouseX,
                    y: mouseY,
                    time: currentTime,
                    speed: timeDiff < 50 ? 'fast' : timeDiff < 200 ? 'medium' : 'slow'
                });
                
                // Keep only recent interactions
                if (userInteractions.length > 100) {
                    userInteractions.shift();
                }
            });
            
            // Scale effect on clickable elements
            const clickableElements = document.querySelectorAll('a, button, .service-card, .viz-btn');
            
            clickableElements.forEach(element => {
                element.addEventListener('mouseenter', () => {
                    cursor.style.transform = 'scale(2)';
                });
                
                element.addEventListener('mouseleave', () => {
                    cursor.style.transform = 'scale(1)';
                });
            });
        }
        
        // 1. AI Mind Visualization
        class AIMindVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.nodes = [];
                this.connections = [];
                this.thoughtNodes = [];
                this.init();
            }
            
            init() {
                // Create initial nodes
                for (let i = 0; i < 50; i++) {
                    this.nodes.push({
                        x: Math.random() * this.canvas.width,
                        y: Math.random() * this.canvas.height,
                        vx: (Math.random() - 0.5) * 0.5,
                        vy: (Math.random() - 0.5) * 0.5,
                        radius: Math.random() * 3 + 2,
                        color: `hsl(${200 + Math.random() * 60}, 70%, 50%)`,
                        activity: 0
                    });
                }
                
                // Create initial connections
                for (let i = 0; i < this.nodes.length; i++) {
                    for (let j = i + 1; j < this.nodes.length; j++) {
                        if (Math.random() > 0.9) {
                            this.connections.push({
                                from: i,
                                to: j,
                                strength: Math.random() * 0.5 + 0.1,
                                pulse: 0
                            });
                        }
                    }
                }
            }
            
            update() {
                // Update nodes
                this.nodes.forEach((node, i) => {
                    // Move nodes
                    node.x += node.vx;
                    node.y += node.vy;
                    
                    // Bounce off walls
                    if (node.x < 0 || node.x > this.canvas.width) node.vx *= -1;
                    if (node.y < 0 || node.y > this.canvas.height) node.vy *= -1;
                    
                    // Decay activity
                    node.activity *= 0.95;
                    
                    // React to mouse
                    const dx = mouseX - node.x;
                    const dy = mouseY - node.y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    
                    if (distance < 150) {
                        node.activity = Math.min(1, node.activity + 0.1);
                        const force = (150 - distance) / 150;
                        node.vx += (dx / distance) * force * 0.05;
                        node.vy += (dy / distance) * force * 0.05;
                    }
                    
                    // Limit velocity
                    const speed = Math.sqrt(node.vx * node.vx + node.vy * node.vy);
                    if (speed > 2) {
                        node.vx = (node.vx / speed) * 2;
                        node.vy = (node.vy / speed) * 2;
                    }
                });
                
                // Update connections
                this.connections.forEach(conn => {
                    conn.pulse *= 0.9;
                    
                    const fromNode = this.nodes[conn.from];
                    const toNode = this.nodes[conn.to];
                    
                    if (fromNode.activity > 0.5 || toNode.activity > 0.5) {
                        conn.pulse = Math.min(1, conn.pulse + 0.2);
                    }
                });
                
                // Add thought nodes from user interactions
                if (userInteractions.length > 0 && Math.random() > 0.95) {
                    const interaction = userInteractions[userInteractions.length - 1];
                    this.thoughtNodes.push({
                        x: interaction.x,
                        y: interaction.y,
                        radius: 5,
                        maxRadius: 20 + Math.random() * 30,
                        growth: 0.5,
                        opacity: 1,
                        color: interaction.speed === 'fast' ? '#ff6b6b' : 
                               interaction.speed === 'medium' ? '#4ecdc4' : '#45b7d1'
                    });
                }
                
                // Update thought nodes
                this.thoughtNodes = this.thoughtNodes.filter(node => {
                    node.radius += node.growth;
                    node.growth *= 0.95;
                    node.opacity *= 0.98;
                    return node.opacity > 0.01;
                });
                
                // Learn from user patterns
                if (userInteractions.length > 10) {
                    this.learnFromPatterns();
                }
            }
            
            learnFromPatterns() {
                // Analyze recent interactions to adjust visualization
                const recentInteractions = userInteractions.slice(-20);
                
                // Calculate average speed
                let fastCount = 0;
                recentInteractions.forEach(interaction => {
                    if (interaction.speed === 'fast') fastCount++;
                });
                
                // Adjust visualization based on user behavior
                if (fastCount > 10) {
                    // User is moving fast - make visualization more energetic
                    this.nodes.forEach(node => {
                        node.vx *= 1.05;
                        node.vy *= 1.05;
                    });
                } else if (fastCount < 5) {
                    // User is moving slow - make visualization calmer
                    this.nodes.forEach(node => {
                        node.vx *= 0.95;
                        node.vy *= 0.95;
                    });
                }
                
                // Adjust color based on interaction density
                const avgX = recentInteractions.reduce((sum, i) => sum + i.x, 0) / recentInteractions.length;
                const avgY = recentInteractions.reduce((sum, i) => sum + i.y, 0) / recentInteractions.length;
                
                this.nodes.forEach(node => {
                    const dx = avgX - node.x;
                    const dy = avgY - node.y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    
                    if (distance < 200) {
                        const hue = 200 + (200 - distance) / 2;
                        node.color = `hsl(${hue}, 70%, 50%)`;
                    }
                });
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw connections
                this.connections.forEach(conn => {
                    const fromNode = this.nodes[conn.from];
                    const toNode = this.nodes[conn.to];
                    
                    this.ctx.beginPath();
                    this.ctx.moveTo(fromNode.x, fromNode.y);
                    this.ctx.lineTo(toNode.x, toNode.y);
                    this.ctx.strokeStyle = `rgba(0, 212, 255, ${conn.strength * (0.3 + conn.pulse * 0.7)})`;
                    this.ctx.lineWidth = 1 + conn.pulse * 2;
                    this.ctx.stroke();
                });
                
                // Draw nodes
                this.nodes.forEach(node => {
                    this.ctx.beginPath();
                    this.ctx.arc(node.x, node.y, node.radius * (1 + node.activity * 0.5), 0, Math.PI * 2);
                    this.ctx.fillStyle = node.color;
                    this.ctx.fill();
                    
                    if (node.activity > 0.1) {
                        this.ctx.beginPath();
                        this.ctx.arc(node.x, node.y, node.radius * (1 + node.activity), 0, Math.PI * 2);
                        this.ctx.strokeStyle = node.color;
                        this.ctx.globalAlpha = node.activity * 0.5;
                        this.ctx.stroke();
                        this.ctx.globalAlpha = 1;
                    }
                });
                
                // Draw thought nodes
                this.thoughtNodes.forEach(node => {
                    this.ctx.beginPath();
                    this.ctx.arc(node.x, node.y, node.radius, 0, Math.PI * 2);
                    this.ctx.fillStyle = node.color;
                    this.ctx.globalAlpha = node.opacity * 0.3;
                    this.ctx.fill();
                    this.ctx.globalAlpha = 1;
                });
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 2. Dream Sequence Visualization
        class DreamSequenceVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.shapes = [];
                this.time = 0;
                this.dreamMode = 0;
                this.init();
            }
            
            init() {
                // Create initial shapes
                for (let i = 0; i < 10; i++) {
                    this.shapes.push({
                        x: Math.random() * this.canvas.width,
                        y: Math.random() * this.canvas.height,
                        radius: Math.random() * 100 + 50,
                        color: `hsl(${Math.random() * 360}, 70%, 50%)`,
                        morphSpeed: Math.random() * 0.01 + 0.005,
                        phase: Math.random() * Math.PI * 2,
                        vertices: Math.floor(Math.random() * 4) + 3
                    });
                }
            }
            
            update() {
                this.time += 0.01;
                
                // Change dream mode periodically
                if (Math.random() > 0.995) {
                    this.dreamMode = (this.dreamMode + 1) % 3;
                }
                
                // Update shapes
                this.shapes.forEach(shape => {
                    shape.phase += shape.morphSpeed;
                    
                    // React to mouse
                    const dx = mouseX - shape.x;
                    const dy = mouseY - shape.y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    
                    if (distance < 200) {
                        const force = (200 - distance) / 200;
                        shape.x += (dx / distance) * force * 2;
                        shape.y += (dy / distance) * force * 2;
                    }
                    
                    // Wrap around screen
                    if (shape.x < -shape.radius) shape.x = this.canvas.width + shape.radius;
                    if (shape.x > this.canvas.width + shape.radius) shape.x = -shape.radius;
                    if (shape.y < -shape.radius) shape.y = this.canvas.height + shape.radius;
                    if (shape.y > this.canvas.height + shape.radius) shape.y = -shape.radius;
                });
            }
            
            draw() {
                // Create dream-like background
                const gradient = this.ctx.createRadialGradient(
                    this.canvas.width / 2, this.canvas.height / 2, 0,
                    this.canvas.width / 2, this.canvas.height / 2, this.canvas.width / 2
                );
                
                if (this.dreamMode === 0) {
                    gradient.addColorStop(0, 'rgba(10, 10, 30, 0.9)');
                    gradient.addColorStop(1, 'rgba(30, 10, 50, 0.9)');
                } else if (this.dreamMode === 1) {
                    gradient.addColorStop(0, 'rgba(30, 10, 10, 0.9)');
                    gradient.addColorStop(1, 'rgba(50, 30, 10, 0.9)');
                } else {
                    gradient.addColorStop(0, 'rgba(10, 30, 10, 0.9)');
                    gradient.addColorStop(1, 'rgba(10, 50, 30, 0.9)');
                }
                
                this.ctx.fillStyle = gradient;
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw morphing shapes
                this.shapes.forEach(shape => {
                    this.ctx.save();
                    this.ctx.translate(shape.x, shape.y);
                    
                    // Create morphing shape
                    this.ctx.beginPath();
                    
                    for (let i = 0; i < shape.vertices; i++) {
                        const angle = (i / shape.vertices) * Math.PI * 2;
                        const morphFactor = Math.sin(shape.phase + i * 0.5) * 0.3 + 1;
                        const r = shape.radius * morphFactor;
                        const x = Math.cos(angle) * r;
                        const y = Math.sin(angle) * r;
                        
                        if (i === 0) {
                            this.ctx.moveTo(x, y);
                        } else {
                            this.ctx.lineTo(x, y);
                        }
                    }
                    
                    this.ctx.closePath();
                    
                    // Apply dream mode styling
                    if (this.dreamMode === 0) {
                        this.ctx.fillStyle = shape.color.replace('50%', '40%');
                        this.ctx.globalAlpha = 0.3;
                    } else if (this.dreamMode === 1) {
                        this.ctx.strokeStyle = shape.color.replace('50%', '60%');
                        this.ctx.lineWidth = 2;
                        this.ctx.globalAlpha = 0.5;
                    } else {
                        const gradient = this.ctx.createRadialGradient(0, 0, 0, 0, 0, shape.radius);
                        gradient.addColorStop(0, shape.color.replace('50%', '60%'));
                        gradient.addColorStop(1, 'transparent');
                        this.ctx.fillStyle = gradient;
                        this.ctx.globalAlpha = 0.4;
                    }
                    
                    if (this.dreamMode === 1) {
                        this.ctx.stroke();
                    } else {
                        this.ctx.fill();
                    }
                    
                    this.ctx.globalAlpha = 1;
                    this.ctx.restore();
                });
                
                // Add noise overlay for dream effect
                const imageData = this.ctx.getImageData(0, 0, this.canvas.width, this.canvas.height);
                const data = imageData.data;
                
                for (let i = 0; i < data.length; i += 4) {
                    const noise = Math.random() * 10 - 5;
                    data[i] += noise;
                    data[i + 1] += noise;
                    data[i + 2] += noise;
                }
                
                this.ctx.putImageData(imageData, 0, 0);
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 3. Decision Tree Visualization
        class DecisionTreeVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.tree = {
                    x: canvas.width / 2,
                    y: canvas.height - 100,
                    branches: []
                };
                this.scrollProgress = 0;
                this.init();
            }
            
            init() {
                // Create initial tree structure
                this.generateBranches(this.tree, 0, 5, 0, Math.PI);
            }
            
            generateBranches(node, depth, maxDepth, angleStart, angleEnd) {
                if (depth >= maxDepth) return;
                
                const numBranches = Math.floor(Math.random() * 2) + 2;
                const angleRange = angleEnd - angleStart;
                
                for (let i = 0; i < numBranches; i++) {
                    const angle = angleStart + (angleRange / (numBranches + 1)) * (i + 1);
                    const length = (maxDepth - depth) * 30 + Math.random() * 20;
                    
                    const endX = node.x + Math.cos(angle - Math.PI / 2) * length;
                    const endY = node.y + Math.sin(angle - Math.PI / 2) * length;
                    
                    const branch = {
                        startX: node.x,
                        startY: node.y,
                        endX: endX,
                        endY: endY,
                        depth: depth,
                        angle: angle,
                        length: length,
                        branches: [],
                        probability: Math.random(),
                        growing: true,
                        currentLength: 0,
                        pruning: false,
                        opacity: 1
                    };
                    
                    node.branches.push(branch);
                    
                    // Recursively generate sub-branches
                    this.generateBranches(
                        branch, 
                        depth + 1, 
                        maxDepth, 
                        angle - angleRange / 4, 
                        angle + angleRange / 4
                    );
                }
            }
            
            update() {
                // Update scroll progress
                this.scrollProgress = window.scrollY / (document.body.scrollHeight - window.innerHeight);
                
                // Update tree growth based on scroll
                this.updateBranchGrowth(this.tree);
                
                // Randomly prune and regrow branches
                if (Math.random() > 0.99) {
                    this.pruneRandomBranch(this.tree);
                }
                
                if (Math.random() > 0.98) {
                    this.regrowRandomBranch(this.tree);
                }
            }
            
            updateBranchGrowth(node) {
                if (node.branches) {
                    node.branches.forEach(branch => {
                        if (branch.growing) {
                            branch.currentLength = Math.min(
                                branch.length,
                                branch.currentLength + branch.length * 0.05
                            );
                            
                            if (branch.currentLength >= branch.length) {
                                branch.growing = false;
                            }
                        } else if (branch.pruning) {
                            branch.currentLength = Math.max(
                                0,
                                branch.currentLength - branch.length * 0.05
                            );
                            
                            if (branch.currentLength <= 0) {
                                branch.pruning = false;
                                branch.growing = true;
                            }
                        }
                        
                        // Update end position based on current length
                        const lengthRatio = branch.currentLength / branch.length;
                        branch.endX = branch.startX + Math.cos(branch.angle - Math.PI / 2) * branch.length * lengthRatio;
                        branch.endY = branch.startY + Math.sin(branch.angle - Math.PI / 2) * branch.length * lengthRatio;
                        
                        // Update child branches
                        if (branch.branches) {
                            branch.branches.forEach(childBranch => {
                                childBranch.startX = branch.endX;
                                childBranch.startY = branch.endY;
                            });
                            
                            this.updateBranchGrowth(branch);
                        }
                    });
                }
            }
            
            pruneRandomBranch(node) {
                if (node.branches && node.branches.length > 0) {
                    const randomBranch = node.branches[Math.floor(Math.random() * node.branches.length)];
                    
                    if (!randomBranch.pruning && !randomBranch.growing) {
                        randomBranch.pruning = true;
                    } else if (randomBranch.branches) {
                        this.pruneRandomBranch(randomBranch);
                    }
                }
            }
            
            regrowRandomBranch(node) {
                if (node.branches && node.branches.length > 0) {
                    const randomBranch = node.branches[Math.floor(Math.random() * node.branches.length)];
                    
                    if (randomBranch.pruning) {
                        randomBranch.pruning = false;
                        randomBranch.growing = true;
                    } else if (randomBranch.branches) {
                        this.regrowRandomBranch(randomBranch);
                    }
                }
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw tree
                this.drawBranches(this.tree);
            }
            
            drawBranches(node) {
                if (node.branches) {
                    node.branches.forEach(branch => {
                        // Draw branch
                        this.ctx.beginPath();
                        this.ctx.moveTo(branch.startX, branch.startY);
                        this.ctx.lineTo(branch.endX, branch.endY);
                        
                        // Color based on probability
                        const hue = 200 - branch.probability * 100;
                        this.ctx.strokeStyle = `hsla(${hue}, 70%, 50%, ${branch.opacity})`;
                        this.ctx.lineWidth = Math.max(1, 5 - branch.depth);
                        this.ctx.stroke();
                        
                        // Draw node at end of branch
                        if (branch.currentLength >= branch.length) {
                            this.ctx.beginPath();
                            this.ctx.arc(branch.endX, branch.endY, 3, 0, Math.PI * 2);
                            this.ctx.fillStyle = `hsla(${hue}, 70%, 60%, ${branch.opacity})`;
                            this.ctx.fill();
                            
                            // Show probability on hover
                            const dx = mouseX - branch.endX;
                            const dy = mouseY - branch.endY;
                            const distance = Math.sqrt(dx * dx + dy * dy);
                            
                            if (distance < 20) {
                                this.ctx.fillStyle = 'rgba(255, 255, 255, 0.8)';
                                this.ctx.font = '12px monospace';
                                this.ctx.fillText(
                                    `${Math.round(branch.probability * 100)}%`,
                                    branch.endX + 10,
                                    branch.endY - 10
                                );
                            }
                        }
                        
                        // Draw child branches
                        if (branch.branches) {
                            this.drawBranches(branch);
                        }
                    });
                }
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 4. Consciousness Wave Visualization
        class ConsciousnessWaveVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.sphere = {
                    x: canvas.width / 2,
                    y: canvas.height / 2,
                    radius: 150,
                    rotation: 0
                };
                this.waves = [];
                this.time = 0;
                this.intensity = 0.5;
                this.init();
            }
            
            init() {
                // Create initial waves
                for (let i = 0; i < 20; i++) {
                    this.waves.push({
                        angle: Math.random() * Math.PI * 2,
                        height: Math.random() * 30 + 10,
                        speed: Math.random() * 0.02 + 0.01,
                        amplitude: Math.random() * 20 + 10,
                        frequency: Math.random() * 0.1 + 0.05,
                        phase: Math.random() * Math.PI * 2
                    });
                }
            }
            
            update() {
                this.time += 0.01;
                this.sphere.rotation += 0.005;
                
                // Update intensity based on mouse movement
                const dx = mouseX - this.sphere.x;
                const dy = mouseY - this.sphere.y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < 300) {
                    this.intensity = Math.min(1, this.intensity + 0.05);
                } else {
                    this.intensity = Math.max(0.3, this.intensity - 0.01);
                }
                
                // Update waves
                this.waves.forEach(wave => {
                    wave.angle += wave.speed;
                    wave.phase += wave.frequency;
                    
                    // React to mouse
                    if (distance < 300) {
                        const mouseAngle = Math.atan2(dy, dx);
                        const angleDiff = mouseAngle - wave.angle;
                        wave.angle += angleDiff * 0.01;
                    }
                });
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw sphere
                this.ctx.save();
                this.ctx.translate(this.sphere.x, this.sphere.y);
                this.ctx.rotate(this.sphere.rotation);
                
                // Draw sphere outline
                this.ctx.beginPath();
                this.ctx.arc(0, 0, this.sphere.radius, 0, Math.PI * 2);
                this.ctx.strokeStyle = `rgba(0, 212, 255, ${0.3 * this.intensity})`;
                this.ctx.lineWidth = 2;
                this.ctx.stroke();
                
                // Draw waves
                this.waves.forEach(wave => {
                    const x = Math.cos(wave.angle) * this.sphere.radius;
                    const y = Math.sin(wave.angle) * this.sphere.radius;
                    
                    // Calculate wave height
                    const waveHeight = wave.height * Math.sin(wave.phase) * this.intensity;
                    
                    // Draw wave line
                    this.ctx.beginPath();
                    this.ctx.moveTo(x, y);
                    
                    // Create wave path
                    for (let i = 0; i < 20; i++) {
                        const t = i / 20;
                        const angle = wave.angle + (t - 0.5) * 0.2;
                        const radius = this.sphere.radius + waveHeight * Math.sin(t * Math.PI);
                        const px = Math.cos(angle) * radius;
                        const py = Math.sin(angle) * radius;
                        
                        this.ctx.lineTo(px, py);
                    }
                    
                    this.ctx.strokeStyle = `rgba(0, 212, 255, ${0.5 * this.intensity})`;
                    this.ctx.lineWidth = 1;
                    this.ctx.stroke();
                    
                    // Draw wave particles
                    for (let i = 0; i < 5; i++) {
                        const t = i / 5;
                        const angle = wave.angle + (t - 0.5) * 0.2;
                        const radius = this.sphere.radius + waveHeight * Math.sin(t * Math.PI);
                        const px = Math.cos(angle) * radius;
                        const py = Math.sin(angle) * radius;
                        
                        this.ctx.beginPath();
                        this.ctx.arc(px, py, 2, 0, Math.PI * 2);
                        this.ctx.fillStyle = `rgba(0, 212, 255, ${0.8 * this.intensity})`;
                        this.ctx.fill();
                    }
                });
                
                // Draw center core
                const gradient = this.ctx.createRadialGradient(0, 0, 0, 0, 0, 30);
                gradient.addColorStop(0, `rgba(255, 255, 255, ${0.8 * this.intensity})`);
                gradient.addColorStop(1, `rgba(0, 212, 255, ${0.3 * this.intensity})`);
                
                this.ctx.beginPath();
                this.ctx.arc(0, 0, 30, 0, Math.PI * 2);
                this.ctx.fillStyle = gradient;
                this.ctx.fill();
                
                this.ctx.restore();
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 5. Synthetic Evolution Visualization
        class SyntheticEvolutionVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.shapes = [];
                this.evolutionTimer = 0;
                this.evolutionSpeed = 0.001;
                this.colorPalette = 0;
                this.init();
            }
            
            init() {
                // Create initial shapes
                for (let i = 0; i < 20; i++) {
                    this.shapes.push(this.createShape());
                }
                
                // Load evolution stage from localStorage if available
                const savedStage = localStorage.getItem('evolutionStage');
                if (savedStage) {
                    evolutionStage = parseInt(savedStage);
                    this.evolutionTimer = evolutionStage * 1000;
                }
            }
            
            createShape() {
                const shapeType = Math.floor(Math.random() * 3);
                
                return {
                    type: shapeType,
                    x: Math.random() * this.canvas.width,
                    y: Math.random() * this.canvas.height,
                    size: Math.random() * 50 + 20,
                    rotation: Math.random() * Math.PI * 2,
                    rotationSpeed: (Math.random() - 0.5) * 0.02,
                    vx: (Math.random() - 0.5) * 0.5,
                    vy: (Math.random() - 0.5) * 0.5,
                    color: this.getColorFromPalette(),
                    mutationRate: Math.random() * 0.01 + 0.005,
                    age: 0
                };
            }
            
            getColorFromPalette() {
                const palettes = [
                    // Blue/Purple palette
                    ['#4a00e0', '#8e2de2', '#00d4ff', '#6a00ff', '#0099ff'],
                    // Red/Orange palette
                    ['#ff006e', '#fb5607', '#ffbe0b', '#ff4365', '#ff9a00'],
                    // Green/Cyan palette
                    ['#00f5ff', '#00ff88', '#00b4d8', '#00f592', '#00d9ff']
                ];
                
                const palette = palettes[this.colorPalette % palettes.length];
                return palette[Math.floor(Math.random() * palette.length)];
            }
            
            update() {
                this.evolutionTimer += this.evolutionSpeed;
                
                // Check for evolution stage change
                const newStage = Math.floor(this.evolutionTimer / 1000) + 1;
                if (newStage !== evolutionStage) {
                    evolutionStage = newStage;
                    localStorage.setItem('evolutionStage', evolutionStage);
                    this.evolve();
                }
                
                // Update shapes
                this.shapes.forEach(shape => {
                    // Move shapes
                    shape.x += shape.vx;
                    shape.y += shape.vy;
                    shape.rotation += shape.rotationSpeed;
                    shape.age += 0.01;
                    
                    // Bounce off walls
                    if (shape.x < 0 || shape.x > this.canvas.width) shape.vx *= -1;
                    if (shape.y < 0 || shape.y > this.canvas.height) shape.vy *= -1;
                    
                    // Mutate
                    if (Math.random() < shape.mutationRate) {
                        this.mutate(shape);
                    }
                    
                    // React to mouse
                    const dx = mouseX - shape.x;
                    const dy = mouseY - shape.y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    
                    if (distance < 150) {
                        const force = (150 - distance) / 150;
                        shape.vx += (dx / distance) * force * 0.05;
                        shape.vy += (dy / distance) * force * 0.05;
                    }
                });
                
                // Remove old shapes and add new ones
                this.shapes = this.shapes.filter(shape => shape.age < 100);
                
                while (this.shapes.length < 20) {
                    this.shapes.push(this.createShape());
                }
            }
            
            evolve() {
                // Change color palette
                this.colorPalette += 1;
                
                // Evolve shapes
                this.shapes.forEach(shape => {
                    // Increase mutation rate
                    shape.mutationRate = Math.min(0.05, shape.mutationRate * 1.5);
                    
                    // Change color
                    shape.color = this.getColorFromPalette();
                    
                    // Possible type change
                    if (Math.random() > 0.7) {
                        shape.type = (shape.type + 1) % 3;
                    }
                });
                
                // Add new shapes
                for (let i = 0; i < 5; i++) {
                    this.shapes.push(this.createShape());
                }
            }
            
            mutate(shape) {
                // Random mutation
                const mutationType = Math.floor(Math.random() * 5);
                
                switch (mutationType) {
                    case 0: // Size mutation
                        shape.size = Math.max(10, Math.min(100, shape.size + (Math.random() - 0.5) * 10));
                        break;
                    case 1: // Speed mutation
                        shape.vx = (Math.random() - 0.5) * 0.5;
                        shape.vy = (Math.random() - 0.5) * 0.5;
                        break;
                    case 2: // Rotation mutation
                        shape.rotationSpeed = (Math.random() - 0.5) * 0.02;
                        break;
                    case 3: // Color mutation
                        shape.color = this.getColorFromPalette();
                        break;
                    case 4: // Type mutation
                        shape.type = (shape.type + 1) % 3;
                        break;
                }
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw evolution stage
                this.ctx.fillStyle = 'rgba(255, 255, 255, 0.5)';
                this.ctx.font = '14px monospace';
                this.ctx.fillText(`Evolution Stage: ${evolutionStage}`, 20, 30);
                
                // Draw shapes
                this.shapes.forEach(shape => {
                    this.ctx.save();
                    this.ctx.translate(shape.x, shape.y);
                    this.ctx.rotate(shape.rotation);
                    
                    this.ctx.fillStyle = shape.color;
                    this.ctx.globalAlpha = Math.max(0.3, 1 - shape.age / 100);
                    
                    switch (shape.type) {
                        case 0: // Circle
                            this.ctx.beginPath();
                            this.ctx.arc(0, 0, shape.size, 0, Math.PI * 2);
                            this.ctx.fill();
                            break;
                        case 1: // Square
                            this.ctx.fillRect(-shape.size, -shape.size, shape.size * 2, shape.size * 2);
                            break;
                        case 2: // Triangle
                            this.ctx.beginPath();
                            this.ctx.moveTo(0, -shape.size);
                            this.ctx.lineTo(-shape.size, shape.size);
                            this.ctx.lineTo(shape.size, shape.size);
                            this.ctx.closePath();
                            this.ctx.fill();
                            break;
                    }
                    
                    this.ctx.globalAlpha = 1;
                    this.ctx.restore();
                });
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 6. Training Visualization
        class TrainingVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.loss = 2.0;
                this.accuracy = 0.1;
                this.epochs = 0;
                this.maxEpochs = 100;
                this.lossHistory = [];
                this.accuracyHistory = [];
                this.isTraining = false;
                this.init();
            }
            
            init() {
                // Initialize history
                for (let i = 0; i < this.maxEpochs; i++) {
                    this.lossHistory.push(null);
                    this.accuracyHistory.push(null);
                }
            }
            
            startTraining() {
                this.isTraining = true;
                this.epochs = 0;
                this.loss = 2.0;
                this.accuracy = 0.1;
                
                // Reset history
                for (let i = 0; i < this.maxEpochs; i++) {
                    this.lossHistory[i] = null;
                    this.accuracyHistory[i] = null;
                }
            }
            
            update() {
                if (this.isTraining && this.epochs < this.maxEpochs) {
                    // Simulate training
                    this.epochs += 1;
                    
                    // Simulate loss decrease with noise
                    this.loss = Math.max(0.01, this.loss * 0.95 + Math.random() * 0.05);
                    this.lossHistory[this.epochs - 1] = this.loss;
                    
                    // Simulate accuracy increase with noise
                    this.accuracy = Math.min(0.99, this.accuracy * 1.02 + Math.random() * 0.01);
                    this.accuracyHistory[this.epochs - 1] = this.accuracy;
                    
                    // Check if training is complete
                    if (this.epochs >= this.maxEpochs) {
                        this.isTraining = false;
                        
                        // Restart training after a delay
                        setTimeout(() => {
                            this.startTraining();
                        }, 3000);
                    }
                }
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw axes
                this.ctx.strokeStyle = 'rgba(255, 255, 255, 0.3)';
                this.ctx.lineWidth = 1;
                this.ctx.beginPath();
                this.ctx.moveTo(50, 30);
                this.ctx.lineTo(50, this.canvas.height - 50);
                this.ctx.lineTo(this.canvas.width - 30, this.canvas.height - 50);
                this.ctx.stroke();
                
                // Draw labels
                this.ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
                this.ctx.font = '12px monospace';
                this.ctx.fillText('Loss', 10, 30);
                this.ctx.fillText('Accuracy', 10, 50);
                this.ctx.fillText('Epochs', this.canvas.width - 70, this.canvas.height - 30);
                
                // Draw loss curve
                this.ctx.strokeStyle = 'rgba(255, 100, 100, 0.8)';
                this.ctx.lineWidth = 2;
                this.ctx.beginPath();
                
                for (let i = 0; i < this.lossHistory.length; i++) {
                    if (this.lossHistory[i] !== null) {
                        const x = 50 + (i / this.maxEpochs) * (this.canvas.width - 80);
                        const y = this.canvas.height - 50 - (this.lossHistory[i] / 2) * (this.canvas.height - 80);
                        
                        if (i === 0 || this.lossHistory[i - 1] === null) {
                            this.ctx.moveTo(x, y);
                        } else {
                            this.ctx.lineTo(x, y);
                        }
                    }
                }
                
                this.ctx.stroke();
                
                // Draw accuracy curve
                this.ctx.strokeStyle = 'rgba(100, 255, 100, 0.8)';
                this.ctx.beginPath();
                
                for (let i = 0; i < this.accuracyHistory.length; i++) {
                    if (this.accuracyHistory[i] !== null) {
                        const x = 50 + (i / this.maxEpochs) * (this.canvas.width - 80);
                        const y = this.canvas.height - 50 - this.accuracyHistory[i] * (this.canvas.height - 80);
                        
                        if (i === 0 || this.accuracyHistory[i - 1] === null) {
                            this.ctx.moveTo(x, y);
                        } else {
                            this.ctx.lineTo(x, y);
                        }
                    }
                }
                
                this.ctx.stroke();
                
                // Draw current values
                if (this.epochs > 0) {
                    this.ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
                    this.ctx.font = '12px monospace';
                    this.ctx.fillText(`Epoch: ${this.epochs}/${this.maxEpochs}`, this.canvas.width - 150, 30);
                    this.ctx.fillText(`Loss: ${this.loss.toFixed(4)}`, this.canvas.width - 150, 50);
                    this.ctx.fillText(`Accuracy: ${(this.accuracy * 100).toFixed(2)}%`, this.canvas.width - 150, 70);
                }
                
                // Draw training status
                if (this.isTraining) {
                    this.ctx.fillStyle = 'rgba(100, 255, 100, 0.8)';
                    this.ctx.fillText('Training...', this.canvas.width / 2 - 30, 30);
                } else {
                    this.ctx.fillStyle = 'rgba(255, 255, 100, 0.8)';
                    this.ctx.fillText('Training Complete', this.canvas.width / 2 - 50, 30);
                }
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 7. Mirror Intelligence Visualization
        class MirrorVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.mirrorTrails = [];
                this.maxTrailLength = 20;
                this.mirrorPoints = [];
                this.init();
            }
            
            init() {
                // Create mirror points
                for (let i = 0; i < 5; i++) {
                    this.mirrorPoints.push({
                        x: Math.random() * this.canvas.width,
                        y: Math.random() * this.canvas.height,
                        vx: 0,
                        vy: 0
                    });
                }
            }
            
            update() {
                // Add current mouse position to trail
                this.mirrorTrails.push({
                    x: mouseX,
                    y: mouseY,
                    time: Date.now()
                });
                
                // Limit trail length
                if (this.mirrorTrails.length > this.maxTrailLength) {
                    this.mirrorTrails.shift();
                }
                
                // Update mirror points
                this.mirrorPoints.forEach(point => {
                    // Calculate target position (mirrored mouse)
                    const targetX = this.canvas.width - mouseX;
                    const targetY = this.canvas.height - mouseY;
                    
                    // Apply spring physics
                    const dx = targetX - point.x;
                    const dy = targetY - point.y;
                    
                    point.vx += dx * 0.02;
                    point.vy += dy * 0.02;
                    
                    // Apply damping
                    point.vx *= 0.9;
                    point.vy *= 0.9;
                    
                    // Update position
                    point.x += point.vx;
                    point.y += point.vy;
                });
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw mirror trails
                this.ctx.strokeStyle = 'rgba(0, 212, 255, 0.5)';
                this.ctx.lineWidth = 2;
                
                this.mirrorTrails.forEach((point, index) => {
                    const opacity = index / this.mirrorTrails.length;
                    this.ctx.globalAlpha = opacity * 0.5;
                    
                    // Draw mirrored position
                    const mirrorX = this.canvas.width - point.x;
                    const mirrorY = this.canvas.height - point.y;
                    
                    this.ctx.beginPath();
                    this.ctx.arc(mirrorX, mirrorY, 5, 0, Math.PI * 2);
                    this.ctx.fillStyle = `rgba(0, 212, 255, ${opacity})`;
                    this.ctx.fill();
                    
                    // Connect to next point
                    if (index < this.mirrorTrails.length - 1) {
                        const nextPoint = this.mirrorTrails[index + 1];
                        const nextMirrorX = this.canvas.width - nextPoint.x;
                        const nextMirrorY = this.canvas.height - nextPoint.y;
                        
                        this.ctx.beginPath();
                        this.ctx.moveTo(mirrorX, mirrorY);
                        this.ctx.lineTo(nextMirrorX, nextMirrorY);
                        this.ctx.stroke();
                    }
                });
                
                this.ctx.globalAlpha = 1;
                
                // Draw mirror points
                this.mirrorPoints.forEach((point, index) => {
                    // Draw point
                    this.ctx.beginPath();
                    this.ctx.arc(point.x, point.y, 10, 0, Math.PI * 2);
                    this.ctx.fillStyle = `hsla(${200 + index * 20}, 70%, 50%, 0.7)`;
                    this.ctx.fill();
                    
                    // Draw prediction line
                    const predictionX = point.x + point.vx * 10;
                    const predictionY = point.y + point.vy * 10;
                    
                    this.ctx.beginPath();
                    this.ctx.moveTo(point.x, point.y);
                    this.ctx.lineTo(predictionX, predictionY);
                    this.ctx.strokeStyle = `hsla(${200 + index * 20}, 70%, 50%, 0.3)`;
                    this.ctx.lineWidth = 1;
                    this.ctx.stroke();
                });
                
                // Draw connection between mouse and mirror
                this.ctx.beginPath();
                this.ctx.moveTo(mouseX, mouseY);
                this.ctx.lineTo(this.canvas.width - mouseX, this.canvas.height - mouseY);
                this.ctx.strokeStyle = 'rgba(255, 255, 255, 0.1)';
                this.ctx.lineWidth = 1;
                this.ctx.setLineDash([5, 5]);
                this.ctx.stroke();
                this.ctx.setLineDash([]);
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 8. Flow Field Visualization
        class FlowFieldVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.particles = [];
                this.flowField = [];
                this.fieldResolution = 20;
                this.zOffset = 0;
                this.init();
            }
            
            init() {
                // Create flow field
                const cols = Math.ceil(this.canvas.width / this.fieldResolution);
                const rows = Math.ceil(this.canvas.height / this.fieldResolution);
                
                for (let y = 0; y < rows; y++) {
                    this.flowField[y] = [];
                    for (let x = 0; x < cols; x++) {
                        this.flowField[y][x] = 0;
                    }
                }
                
                // Create particles
                for (let i = 0; i < 500; i++) {
                    this.particles.push({
                        x: Math.random() * this.canvas.width,
                        y: Math.random() * this.canvas.height,
                        vx: 0,
                        vy: 0,
                        prevX: 0,
                        prevY: 0,
                        color: `hsl(${200 + Math.random() * 60}, 70%, 50%)`
                    });
                }
            }
            
            update() {
                // Update z offset for animation
                this.zOffset += 0.005;
                
                // Update flow field
                const cols = Math.ceil(this.canvas.width / this.fieldResolution);
                const rows = Math.ceil(this.canvas.height / this.fieldResolution);
                
                for (let y = 0; y < rows; y++) {
                    for (let x = 0; x < cols; x++) {
                        // Calculate angle using Perlin noise simulation
                        const angle = this.noise(x * 0.1, y * 0.1, this.zOffset) * Math.PI * 2;
                        
                        // Influence by mouse position
                        const dx = mouseX - x * this.fieldResolution;
                        const dy = mouseY - y * this.fieldResolution;
                        const distance = Math.sqrt(dx * dx + dy * dy);
                        
                        if (distance < 200) {
                            const mouseAngle = Math.atan2(dy, dx);
                            const influence = (200 - distance) / 200;
                            this.flowField[y][x] = angle * (1 - influence) + mouseAngle * influence;
                        } else {
                            this.flowField[y][x] = angle;
                        }
                    }
                }
                
                // Update particles
                this.particles.forEach(particle => {
                    // Store previous position
                    particle.prevX = particle.x;
                    particle.prevY = particle.y;
                    
                    // Get flow field at particle position
                    const x = Math.floor(particle.x / this.fieldResolution);
                    const y = Math.floor(particle.y / this.fieldResolution);
                    
                    if (x >= 0 && x < cols && y >= 0 && y < rows) {
                        const angle = this.flowField[y][x];
                        
                        // Apply force
                        const force = 0.5;
                        particle.vx += Math.cos(angle) * force;
                        particle.vy += Math.sin(angle) * force;
                    }
                    
                    // Apply damping
                    particle.vx *= 0.95;
                    particle.vy *= 0.95;
                    
                    // Update position
                    particle.x += particle.vx;
                    particle.y += particle.vy;
                    
                    // Wrap around screen
                    if (particle.x < 0) particle.x = this.canvas.width;
                    if (particle.x > this.canvas.width) particle.x = 0;
                    if (particle.y < 0) particle.y = this.canvas.height;
                    if (particle.y > this.canvas.height) particle.y = 0;
                });
            }
            
            // Simple noise function
            noise(x, y, z) {
                // Simplified Perlin noise simulation
                const X = Math.floor(x) & 255;
                const Y = Math.floor(y) & 255;
                const Z = Math.floor(z) & 255;
                
                return Math.sin(X * 12.9898 + Y * 78.233 + Z * 43.5453) * 43758.5453 % 1;
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.05)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                // Draw flow field (optional, for debugging)
                // const cols = Math.ceil(this.canvas.width / this.fieldResolution);
                // const rows = Math.ceil(this.canvas.height / this.fieldResolution);
                
                // for (let y = 0; y < rows; y++) {
                //     for (let x = 0; x < cols; x++) {
                //         const angle = this.flowField[y][x];
                //         const px = x * this.fieldResolution;
                //         const py = y * this.fieldResolution;
                        
                //         this.ctx.save();
                //         this.ctx.translate(px, py);
                //         this.ctx.rotate(angle);
                        
                //         this.ctx.beginPath();
                //         this.ctx.moveTo(0, 0);
                //         this.ctx.lineTo(this.fieldResolution * 0.8, 0);
                //         this.ctx.strokeStyle = 'rgba(255, 255, 255, 0.1)';
                //         this.ctx.stroke();
                        
                //         this.ctx.restore();
                //     }
                // }
                
                // Draw particles
                this.particles.forEach(particle => {
                    // Draw particle trail
                    this.ctx.beginPath();
                    this.ctx.moveTo(particle.prevX, particle.prevY);
                    this.ctx.lineTo(particle.x, particle.y);
                    this.ctx.strokeStyle = particle.color;
                    this.ctx.lineWidth = 1;
                    this.ctx.stroke();
                    
                    // Draw particle
                    this.ctx.beginPath();
                    this.ctx.arc(particle.x, particle.y, 2, 0, Math.PI * 2);
                    this.ctx.fillStyle = particle.color;
                    this.ctx.fill();
                });
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // 9. Quantum Neural Matrix Visualization
        class QuantumVisualization {
            constructor(ctx, canvas) {
                this.ctx = ctx;
                this.canvas = canvas;
                this.grid = [];
                this.gridSize = 20;
                this.cubeSize = 15;
                this.rotationX = 0;
                this.rotationY = 0;
                this.rotationZ = 0;
                this.init();
            }
            
            init() {
                // Create 3D grid
                const gridWidth = Math.ceil(this.canvas.width / this.gridSize);
                const gridHeight = Math.ceil(this.canvas.height / this.gridSize);
                const gridDepth = 10;
                
                for (let z = 0; z < gridDepth; z++) {
                    this.grid[z] = [];
                    for (let y = 0; y < gridHeight; y++) {
                        this.grid[z][y] = [];
                        for (let x = 0; x < gridWidth; x++) {
                            this.grid[z][y][x] = {
                                active: Math.random() > 0.8,
                                opacity: Math.random(),
                                color: `hsl(${200 + Math.random() * 60}, 70%, 50%)`,
                                phase: Math.random() * Math.PI * 2,
                                frequency: Math.random() * 0.1 + 0.05
                            };
                        }
                    }
                }
            }
            
            update() {
                // Update rotation
                this.rotationX += 0.005;
                this.rotationY += 0.007;
                this.rotationZ += 0.003;
                
                // Update grid
                const gridWidth = Math.ceil(this.canvas.width / this.gridSize);
                const gridHeight = Math.ceil(this.canvas.height / this.gridSize);
                const gridDepth = this.grid.length;
                
                for (let z = 0; z < gridDepth; z++) {
                    for (let y = 0; y < gridHeight; y++) {
                        for (let x = 0; x < gridWidth; x++) {
                            const cube = this.grid[z][y][x];
                            
                            // Update phase
                            cube.phase += cube.frequency;
                            
                            // Randomly toggle state (quantum superposition)
                            if (Math.random() > 0.98) {
                                cube.active = !cube.active;
                            }
                            
                            // Update opacity
                            if (cube.active) {
                                cube.opacity = Math.min(1, cube.opacity + 0.1);
                            } else {
                                cube.opacity = Math.max(0, cube.opacity - 0.1);
                            }
                            
                            // React to mouse
                            const dx = mouseX - x * this.gridSize;
                            const dy = mouseY - y * this.gridSize;
                            const distance = Math.sqrt(dx * dx + dy * dy);
                            
                            if (distance < 100) {
                                const influence = (100 - distance) / 100;
                                cube.active = Math.random() < influence;
                            }
                        }
                    }
                }
            }
            
            project3D(x, y, z) {
                // Apply rotation
                let newX = x;
                let newY = y;
                let newZ = z;
                
                // Rotate around X axis
                const cosX = Math.cos(this.rotationX);
                const sinX = Math.sin(this.rotationX);
                const tempY = newY * cosX - newZ * sinX;
                newZ = newY * sinX + newZ * cosX;
                newY = tempY;
                
                // Rotate around Y axis
                const cosY = Math.cos(this.rotationY);
                const sinY = Math.sin(this.rotationY);
                const tempX = newX * cosY + newZ * sinY;
                newZ = -newX * sinY + newZ * cosY;
                newX = tempX;
                
                // Rotate around Z axis
                const cosZ = Math.cos(this.rotationZ);
                const sinZ = Math.sin(this.rotationZ);
                const tempX2 = newX * cosZ - newY * sinZ;
                newY = newX * sinZ + newY * cosZ;
                newX = tempX2;
                
                // Project to 2D
                const scale = 1 / (1 + newZ * 0.01);
                const projectedX = newX * scale + this.canvas.width / 2;
                const projectedY = newY * scale + this.canvas.height / 2;
                
                return { x: projectedX, y: projectedY, scale: scale };
            }
            
            draw() {
                this.ctx.fillStyle = 'rgba(10, 10, 10, 0.1)';
                this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
                
                const gridWidth = Math.ceil(this.canvas.width / this.gridSize);
                const gridHeight = Math.ceil(this.canvas.height / this.gridSize);
                const gridDepth = this.grid.length;
                
                // Calculate center offset
                const offsetX = -gridWidth * this.gridSize / 2;
                const offsetY = -gridHeight * this.gridSize / 2;
                const offsetZ = -gridDepth * this.gridSize / 2;
                
                // Draw grid
                for (let z = 0; z < gridDepth; z++) {
                    for (let y = 0; y < gridHeight; y++) {
                        for (let x = 0; x < gridWidth; x++) {
                            const cube = this.grid[z][y][x];
                            
                            if (cube.opacity > 0.01) {
                                // Calculate 3D position
                                const x3D = x * this.gridSize + offsetX;
                                const y3D = y * this.gridSize + offsetY;
                                const z3D = z * this.gridSize + offsetZ;
                                
                                // Project to 2D
                                const projected = this.project3D(x3D, y3D, z3D);
                                
                                // Draw cube
                                const size = this.cubeSize * projected.scale;
                                
                                this.ctx.fillStyle = cube.color;
                                this.ctx.globalAlpha = cube.opacity * 0.8;
                                
                                this.ctx.fillRect(
                                    projected.x - size / 2,
                                    projected.y - size / 2,
                                    size,
                                    size
                                );
                                
                                // Draw glow effect
                                if (cube.active) {
                                    const gradient = this.ctx.createRadialGradient(
                                        projected.x, projected.y, 0,
                                        projected.x, projected.y, size
                                    );
                                    gradient.addColorStop(0, cube.color);
                                    gradient.addColorStop(1, 'transparent');
                                    
                                    this.ctx.fillStyle = gradient;
                                    this.ctx.globalAlpha = cube.opacity * 0.3;
                                    
                                    this.ctx.fillRect(
                                        projected.x - size,
                                        projected.y - size,
                                        size * 2,
                                        size * 2
                                    );
                                }
                                
                                this.ctx.globalAlpha = 1;
                            }
                        }
                    }
                }
            }
            
            animate() {
                this.update();
                this.draw();
            }
        }
        
        // Initialize visualizations
        const aiMindViz = new AIMindVisualization(aiMindCtx, aiMindCanvas);
        const dreamSequenceViz = new DreamSequenceVisualization(dreamSequenceCtx, dreamSequenceCanvas);
        const decisionTreeViz = new DecisionTreeVisualization(decisionTreeCtx, decisionTreeCanvas);
        const consciousnessWaveViz = new ConsciousnessWaveVisualization(consciousnessWaveCtx, consciousnessWaveCanvas);
        const evolutionViz = new SyntheticEvolutionVisualization(evolutionCtx, evolutionCanvas);
        const trainingViz = new TrainingVisualization(trainingCtx, trainingCanvas);
        const mirrorViz = new MirrorVisualization(mirrorCtx, mirrorCanvas);
        const flowFieldViz = new FlowFieldVisualization(flowFieldCtx, flowFieldCanvas);
        const quantumViz = new QuantumVisualization(quantumCtx, quantumCanvas);
        
        // Visualization controls
        const vizButtons = {
            aiMind: document.getElementById('aiMindBtn'),
            dreamSequence: document.getElementById('dreamSequenceBtn'),
            decisionTree: document.getElementById('decisionTreeBtn'),
            consciousnessWave: document.getElementById('consciousnessWaveBtn'),
            evolution: document.getElementById('evolutionBtn'),
            training: document.getElementById('trainingBtn'),
            mirror: document.getElementById('mirrorBtn'),
            flowField: document.getElementById('flowFieldBtn'),
            quantum: document.getElementById('quantumBtn')
        };
        
        // Set up visualization controls
        Object.keys(vizButtons).forEach(vizName => {
            vizButtons[vizName].addEventListener('click', () => {
                // Update active button
                Object.values(vizButtons).forEach(btn => btn.classList.remove('active'));
                vizButtons[vizName].classList.add('active');
                
                // Update active visualization
                activeVisualization = vizName;
                
                // Start training if training visualization is selected
                if (vizName === 'training') {
                    trainingViz.startTraining();
                }
            });
        });
        
        // Animation loop
        function animate() {
            // Run active visualization
            switch (activeVisualization) {
                case 'aiMind':
                    aiMindViz.animate();
                    break;
                case 'dreamSequence':
                    dreamSequenceViz.animate();
                    break;
                case 'decisionTree':
                    decisionTreeViz.animate();
                    break;
                case 'consciousnessWave':
                    consciousnessWaveViz.animate();
                    break;
                case 'evolution':
                    evolutionViz.animate();
                    break;
                case 'training':
                    trainingViz.animate();
                    break;
                case 'mirror':
                    mirrorViz.animate();
                    break;
                case 'flowField':
                    flowFieldViz.animate();
                    break;
                case 'quantum':
                    quantumViz.animate();
                    break;
            }
            
            animationFrameId = requestAnimationFrame(animate);
        }
        
        // Training Visualization for Services Section
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
        
        // Navbar scroll effect
        function initNavbarScroll() {
            const navbar = document.getElementById('navbar');
            
            window.addEventListener('scroll', () => {
                if (window.scrollY > 50) {
                    navbar.style.background = 'rgba(10, 10, 10, 0.9)';
                } else {
                    navbar.style.background = 'rgba(10, 10, 10, 0.5)';
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
            resizeCanvases();
            initCustomCursor();
            initTrainingVisualization();
            initNavbarScroll();
            initSmoothScrolling();
            initFormHandling();
            
            // Start animation loop
            animate();
            
            // Start training visualization
            trainingViz.startTraining();
        });
        
        // Handle window resize
        window.addEventListener('resize', () => {
            resizeCanvases();
        });
    </script>
</body>
</html>