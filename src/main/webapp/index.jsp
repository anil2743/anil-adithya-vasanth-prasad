<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeuralFlow - AI & ML Solutions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #667eea;
            --secondary: #764ba2;
            --accent: #f093fb;
            --dark: #1a202c;
            --light: #f7fafc;
            --text: #2d3748;
            --gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-alt: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: var(--text);
            overflow-x: hidden;
            background: var(--light);
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            opacity: 0.03;
        }

        .floating-shapes {
            position: fixed;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .shape {
            position: absolute;
            opacity: 0.1;
            animation: float 20s infinite ease-in-out;
        }

        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            left: 10%;
            background: var(--gradient);
            border-radius: 50%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            right: 20%;
            background: var(--gradient-alt);
            clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
            animation-delay: 3s;
        }

        .shape:nth-child(3) {
            width: 100px;
            height: 100px;
            left: 50%;
            background: var(--gradient);
            transform: rotate(45deg);
            animation-delay: 5s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            33% {
                transform: translateY(-100px) rotate(120deg);
            }
            66% {
                transform: translateY(100px) rotate(240deg);
            }
        }

        /* Navigation */
        nav {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 1rem 0;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        nav.scrolled {
            padding: 0.5rem 0;
            background: rgba(255, 255, 255, 0.98);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text);
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        /* Hero Section */
        .hero {
            margin-top: 80px;
            padding: 4rem 2rem;
            min-height: 90vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            line-height: 1.2;
            margin-bottom: 1.5rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: slideInLeft 1s ease;
        }

        .hero-content .subtitle {
            font-size: 1.25rem;
            color: var(--text);
            margin-bottom: 2rem;
            animation: slideInLeft 1s ease 0.2s both;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            animation: slideInLeft 1s ease 0.4s both;
        }

        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: var(--gradient);
            color: white;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: white;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-secondary:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
        }

        .hero-visual {
            position: relative;
            animation: slideInRight 1s ease;
        }

        .neural-network {
            width: 100%;
            height: 500px;
            position: relative;
        }

        .node {
            position: absolute;
            width: 20px;
            height: 20px;
            background: var(--gradient);
            border-radius: 50%;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.2);
                opacity: 0.7;
            }
        }

        .connection {
            position: absolute;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary), transparent);
            transform-origin: left center;
            animation: flow 3s infinite linear;
        }

        @keyframes flow {
            0% {
                opacity: 0.3;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0.3;
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Features Section */
        .features {
            padding: 5rem 2rem;
            background: white;
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .section-header h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .features-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            background: var(--gradient);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.25rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        .feature-card p {
            color: var(--text);
            line-height: 1.6;
        }

        /* Blog Section */
        .blog {
            padding: 5rem 2rem;
            background: var(--light);
        }

        .blog-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
        }

        .blog-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .blog-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .blog-image {
            width: 100%;
            height: 200px;
            background: var(--gradient);
            position: relative;
            overflow: hidden;
        }

        .blog-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .blog-content {
            padding: 1.5rem;
        }

        .blog-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
            color: #718096;
        }

        .blog-meta span {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .blog-content h3 {
            font-size: 1.25rem;
            margin-bottom: 0.75rem;
            color: var(--dark);
        }

        .blog-content p {
            color: var(--text);
            line-height: 1.6;
            margin-bottom: 1rem;
        }

        .read-more {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: gap 0.3s ease;
        }

        .read-more:hover {
            gap: 1rem;
        }

        /* Stats Section */
        .stats {
            padding: 5rem 2rem;
            background: var(--gradient);
            color: white;
        }

        .stats-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 3rem;
            text-align: center;
        }

        .stat-item {
            animation: fadeInUp 1s ease;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 1.125rem;
            opacity: 0.9;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* CTA Section */
        .cta {
            padding: 5rem 2rem;
            background: white;
            text-align: center;
        }

        .cta-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .cta h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .cta p {
            font-size: 1.25rem;
            color: var(--text);
            margin-bottom: 2rem;
        }

        /* Footer */
        footer {
            background: var(--dark);
            color: white;
            padding: 3rem 2rem 1rem;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            margin-bottom: 1rem;
            color: var(--accent);
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        .footer-section a {
            color: #cbd5e0;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: var(--accent);
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: var(--gradient);
            transform: translateY(-3px);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #cbd5e0;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero-container {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .hero-content h1 {
                font-size: 2.5rem;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-visual {
                display: none;
            }

            .features-grid,
            .blog-grid {
                grid-template-columns: 1fr;
            }

            .stats-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        /* Loading Animation */
        .loading-text {
            display: inline-block;
            position: relative;
        }

        .loading-text::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient);
            animation: loading 2s infinite;
        }

        @keyframes loading {
            0% {
                width: 0;
                left: 0;
            }
            50% {
                width: 100%;
                left: 0;
            }
            100% {
                width: 0;
                left: 100%;
            }
        }

        /* Notification Toast */
        .toast {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            gap: 1rem;
            transform: translateX(400px);
            transition: transform 0.3s ease;
            z-index: 2000;
        }

        .toast.show {
            transform: translateX(0);
        }

        .toast-icon {
            width: 30px;
            height: 30px;
            background: var(--gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="animated-bg"></div>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Navigation -->
    <nav id="navbar">
        <div class="nav-container">
            <div class="logo">
                <i class="fas fa-brain"></i>
                NeuralFlow
            </div>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#blog">Blog</a></li>
                <li><a href="#stats">Stats</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-container">
            <div class="hero-content">
                <h1>Transform Your Business with AI</h1>
                <p class="subtitle">Harness the power of machine learning and artificial intelligence to revolutionize your operations, enhance customer experiences, and drive unprecedented growth.</p>
                <div class="hero-buttons">
                    <a href="#features" class="btn btn-primary">Explore Solutions</a>
                    <a href="#blog" class="btn btn-secondary">Read Our Blog</a>
                </div>
            </div>
            <div class="hero-visual">
                <div class="neural-network" id="neuralNetwork"></div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <div class="section-header">
            <h2>Cutting-Edge AI Solutions</h2>
            <p>Empowering businesses with intelligent automation and data-driven insights</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-robot"></i>
                </div>
                <h3>Intelligent Automation</h3>
                <p>Streamline your workflows with AI-powered automation that learns and adapts to your business needs, reducing manual effort by up to 80%.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Predictive Analytics</h3>
                <p>Leverage advanced machine learning algorithms to forecast trends, identify opportunities, and make data-driven decisions with confidence.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3>AI Security</h3>
                <p>Protect your digital assets with intelligent threat detection and prevention systems that evolve alongside emerging cyber threats.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <h3>Natural Language Processing</h3>
                <p>Transform customer interactions with advanced NLP capabilities that understand context, sentiment, and intent in real-time.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-eye"></i>
                </div>
                <h3>Computer Vision</h3>
                <h3>Unlock insights from visual data with state-of-the-art computer vision technology for image recognition and analysis.</h3>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-cogs"></i>
                </div>
                <h3>Custom AI Models</h3>
                <p>Build tailored AI solutions specifically designed for your unique business challenges and industry requirements.</p>
            </div>
        </div>
    </section>

    <!-- Blog Section -->
    <section class="blog" id="blog">
        <div class="section-header">
            <h2>Latest AI Insights</h2>
            <p>Stay updated with the latest trends and breakthroughs in artificial intelligence</p>
        </div>
        <div class="blog-grid">
            <article class="blog-card" onclick="showToast('Opening article...')">
                <div class="blog-image">
                    <img src="https://picsum.photos/seed/ai1/400/200.jpg" alt="AI Blog">
                </div>
                <div class="blog-content">
                    <div class="blog-meta">
                        <span><i class="far fa-calendar"></i> Nov 15, 2024</span>
                        <span><i class="far fa-clock"></i> 5 min read</span>
                    </div>
                    <h3>The Future of Generative AI in Business</h3>
                    <p>Explore how generative AI is revolutionizing content creation, product design, and customer engagement across industries.</p>
                    <a href="#" class="read-more">Read More <i class="fas fa-arrow-right"></i></a>
                </div>
            </article>
            <article class="blog-card" onclick="showToast('Opening article...')">
                <div class="blog-image">
                    <img src="https://picsum.photos/seed/ml2/400/200.jpg" alt="ML Blog">
                </div>
                <div class="blog-content">
                    <div class="blog-meta">
                        <span><i class="far fa-calendar"></i> Nov 12, 2024</span>
                        <span><i class="far fa-clock"></i> 7 min read</span>
                    </div>
                    <h3>Machine Learning in Healthcare: Real-World Applications</h3>
                    <p>Discover how ML algorithms are transforming patient care, drug discovery, and medical diagnostics with unprecedented accuracy.</p>
                    <a href="#" class="read-more">Read More <i class="fas fa-arrow-right"></i></a>
                </div>
            </article>
            <article class="blog-card" onclick="showToast('Opening article...')">
                <div class="blog-image">
                    <img src="https://picsum.photos/seed/ai3/400/200.jpg" alt="AI Ethics">
                </div>
                <div class="blog-content">
                    <div class="blog-meta">
                        <span><i class="far fa-calendar"></i> Nov 10, 2024</span>
                        <span><i class="far fa-clock"></i> 6 min read</span>
                    </div>
                    <h3>Ethical AI: Building Trustworthy Systems</h3>
                    <p>Learn about the importance of ethical considerations in AI development and how to build responsible, transparent AI systems.</p>
                    <a href="#" class="read-more">Read More <i class="fas fa-arrow-right"></i></a>
                </div>
            </article>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats" id="stats">
        <div class="stats-container">
            <div class="stat-item">
                <div class="stat-number" data-target="500">0</div>
                <div class="stat-label">AI Solutions Deployed</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" data-target="98">0</div>
                <div class="stat-label">Client Satisfaction %</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" data-target="50">0</div>
                <div class="stat-label">AI Experts</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" data-target="24">0</div>
                <div class="stat-label">Global Awards</div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta" id="contact">
        <div class="cta-container">
            <h2>Ready to Transform Your Business?</h2>
            <p>Join hundreds of companies leveraging AI to drive innovation and growth</p>
            <button class="btn btn-primary" onclick="showToast('Thank you for your interest! We\'ll contact you soon.')">
                Get Started Today
            </button>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h3>NeuralFlow</h3>
                <p>Pioneering the future of artificial intelligence and machine learning solutions for businesses worldwide.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#blog">Blog</a></li>
                    <li><a href="#stats">Statistics</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Services</h3>
                <ul>
                    <li><a href="#">AI Consulting</a></li>
                    <li><a href="#">ML Development</a></li>
                    <li><a href="#">Data Analytics</a></li>
                    <li><a href="#">AI Training</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Info</h3>
                <ul>
                    <li><i class="fas fa-envelope"></i> info@neuralflow.ai</li>
                    <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
                    <li><i class="fas fa-map-marker-alt"></i> San Francisco, CA</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 NeuralFlow. All rights reserved. | Privacy Policy | Terms of Service</p>
        </div>
    </footer>

    <!-- Toast Notification -->
    <div class="toast" id="toast">
        <div class="toast-icon">
            <i class="fas fa-check"></i>
        </div>
        <div class="toast-message" id="toastMessage">Success!</div>
    </div>

    <script>
        // Neural Network Animation
        function createNeuralNetwork() {
            const container = document.getElementById('neuralNetwork');
            const layers = [3, 5, 4, 3];
            const nodes = [];
            const connections = [];

            // Create nodes
            layers.forEach((nodeCount, layerIndex) => {
                for (let i = 0; i < nodeCount; i++) {
                    const node = document.createElement('div');
                    node.className = 'node';
                    const x = (layerIndex * 25) + 10;
                    const y = ((i + 1) * (100 / (nodeCount + 1)));
                    node.style.left = x + '%';
                    node.style.top = y + '%';
                    node.style.animationDelay = (Math.random() * 2) + 's';
                    container.appendChild(node);
                    nodes.push({ element: node, x, y, layer: layerIndex });
                }
            });

            // Create connections
            for (let i = 0; i < nodes.length; i++) {
                for (let j = i + 1; j < nodes.length; j++) {
                    if (nodes[j].layer === nodes[i].layer + 1) {
                        const connection = document.createElement('div');
                        connection.className = 'connection';
                        
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
                        connection.style.animationDelay = (Math.random() * 3) + 's';
                        
                        container.appendChild(connection);
                    }
                }
            }
        }

        // Initialize neural network
        createNeuralNetwork();

        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Navbar scroll effect
        window.addEventListener('scroll', () => {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Animated counter for stats
        function animateCounters() {
            const counters = document.querySelectorAll('.stat-number');
            const speed = 200;

            counters.forEach(counter => {
                const animate = () => {
                    const target = +counter.getAttribute('data-target');
                    const count = +counter.innerText;
                    const increment = target / speed;

                    if (count < target) {
                        counter.innerText = Math.ceil(count + increment);
                        setTimeout(animate, 10);
                    } else {
                        counter.innerText = target;
                    }
                };
                animate();
            });
        }

 feature/login
        // Intersection Observer for animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -100px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    if (entry.target.classList.contains('stats')) {
                        animateCounters();
                        observer.unobserve(entry.target);
                    }
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';

        // Navbar scroll effect facing
        function initNavbarScroll() {
            const navbar = document.getElementById('navbar');
            
            window.addEventListener('scroll', () => {
                if (window.scrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
 staging
                }
            });
        }, observerOptions);

        // Observe elements
        document.querySelectorAll('.feature-card, .blog-card').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'all 0.6s ease';
            observer.observe(el);
        });

        document.querySelector('.stats').style.opacity = '0';
        observer.observe(document.querySelector('.stats'));

        // Toast notification function
        function showToast(message) {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toastMessage');
            toastMessage.textContent = message;
            toast.classList.add('show');
            
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Add parallax effect to hero section
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const hero = document.querySelector('.hero');
            hero.style.transform = `translateY(${scrolled * 0.5}px)`;
        });

        // Dynamic typing effect for hero title
        const heroTitle = document.querySelector('.hero-content h1');
        const originalText = heroTitle.textContent;
        let charIndex = 0;

        function typeWriter() {
            if (charIndex < originalText.length) {
                heroTitle.textContent = originalText.substring(0, charIndex + 1);
                charIndex++;
                setTimeout(typeWriter, 50);
            }
        }

        // Start typing effect when page loads
        window.addEventListener('load', () => {
            heroTitle.textContent = '';
            typeWriter();
        });

        // Add hover effect to feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Blog card interaction
        document.querySelectorAll('.blog-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.querySelector('.blog-image img').style.transform = 'scale(1.1)';
                this.querySelector('.blog-image img').style.transition = 'transform 0.3s ease';
            });
            
            card.addEventListener('mouseleave', function() {
                this.querySelector('.blog-image img').style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>
