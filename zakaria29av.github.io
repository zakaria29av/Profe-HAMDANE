<!DOCTYPE html>
<html lang="en" class="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>M. E. Hamdane — Portfolio</title>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&family=JetBrains+Mono:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --indigo: #6366f1;
    --cyan: #06b6d4;
    --bg: #08080f;
    --surface: rgba(15,15,25,0.7);
    --border: rgba(99,102,241,0.15);
    --text: #e2e8f0;
    --muted: #94a3b8;
    --card-bg: rgba(15,15,30,0.6);
  }

  html { scroll-behavior: smooth; }

  body {
    font-family: 'Outfit', sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
    overflow-x: hidden;
    position: relative;
  }

  /* Grid background */
  body::after {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(99,102,241,0.06) 1px, transparent 1px),
      linear-gradient(90deg, rgba(99,102,241,0.06) 1px, transparent 1px);
    background-size: 60px 60px;
    pointer-events: none;
    z-index: 0;
  }

  /* Noise */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    opacity: 0.02;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 0;
  }

  /* Scrollbar */
  ::-webkit-scrollbar { width: 6px; }
  ::-webkit-scrollbar-track { background: transparent; }
  ::-webkit-scrollbar-thumb { background: rgba(99,102,241,0.3); border-radius: 3px; }

  /* ── NAV ── */
  nav {
    position: fixed;
    top: 0; left: 0; right: 0;
    z-index: 50;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1rem 2.5rem;
    background: rgba(8,8,15,0.8);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid var(--border);
  }

  .nav-logo {
    font-family: 'JetBrains Mono', monospace;
    font-size: 1.1rem;
    font-weight: 500;
    background: linear-gradient(135deg, var(--indigo), var(--cyan));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-decoration: none;
  }

  .nav-links {
    display: flex;
    gap: 2rem;
    list-style: none;
  }

  .nav-links a {
    font-size: 0.85rem;
    color: var(--muted);
    text-decoration: none;
    transition: color 0.2s;
    position: relative;
  }

  .nav-links a::after {
    content: '';
    position: absolute;
    bottom: -2px; left: 50%;
    width: 0; height: 2px;
    background: linear-gradient(90deg, var(--indigo), var(--cyan));
    transition: width 0.3s, left 0.3s;
    border-radius: 1px;
  }

  .nav-links a:hover { color: var(--text); }
  .nav-links a:hover::after { width: 100%; left: 0; }

  .nav-cta {
    font-size: 0.8rem;
    font-family: 'JetBrains Mono', monospace;
    padding: 0.45rem 1.1rem;
    border: 1px solid var(--border);
    border-radius: 6px;
    color: var(--text) !important;
    text-decoration: none;
    transition: border-color 0.2s, background 0.2s !important;
  }

  .nav-cta:hover {
    border-color: var(--indigo) !important;
    background: rgba(99,102,241,0.1) !important;
  }

  .nav-cta::after { display: none !important; }

  /* ── WRAPPER ── */
  .wrapper {
    position: relative;
    z-index: 1;
  }

  /* ── HERO ── */
  .hero {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 8rem 2rem 5rem;
    position: relative;
    overflow: hidden;
  }

  .orb {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.25;
    animation: orbFloat 8s ease-in-out infinite alternate;
  }

  .orb-1 { width: 500px; height: 500px; background: var(--indigo); top: -10%; left: -10%; }
  .orb-2 { width: 400px; height: 400px; background: var(--cyan); bottom: 0; right: -10%; animation-delay: -4s; }

  @keyframes orbFloat {
    0%   { transform: translate(0,0) scale(1); }
    100% { transform: translate(30px,-20px) scale(1.1); }
  }

  .hero-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.72rem;
    color: var(--indigo);
    border: 1px solid rgba(99,102,241,0.3);
    border-radius: 99px;
    padding: 0.35rem 1rem;
    margin-bottom: 2rem;
    background: rgba(99,102,241,0.08);
    animation: fadeUp 0.7s ease both;
  }

  .hero-badge::before {
    content: '';
    width: 6px; height: 6px;
    background: var(--cyan);
    border-radius: 50%;
    animation: pulse 2s ease-in-out infinite;
  }

  @keyframes pulse {
    0%,100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.4; transform: scale(0.7); }
  }

  .hero h1 {
    font-size: clamp(3.5rem, 9vw, 7rem);
    font-weight: 700;
    line-height: 0.95;
    letter-spacing: -0.03em;
    margin-bottom: 1.5rem;
    animation: fadeUp 0.7s 0.1s ease both;
  }

  .grad-text {
    background: linear-gradient(135deg, var(--indigo), var(--cyan));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .hero-subtitle {
    font-size: 1.05rem;
    color: var(--muted);
    max-width: 52ch;
    margin: 0 auto 2.5rem;
    line-height: 1.7;
    animation: fadeUp 0.7s 0.2s ease both;
  }

  .hero-actions {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    justify-content: center;
    animation: fadeUp 0.7s 0.3s ease both;
  }

  .btn-primary {
    padding: 0.75rem 1.8rem;
    background: linear-gradient(135deg, var(--indigo), var(--cyan));
    color: #fff;
    border: none;
    border-radius: 8px;
    font-family: 'Outfit', sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    transition: opacity 0.2s, transform 0.2s;
    display: inline-flex; align-items: center; gap: 0.5rem;
  }

  .btn-primary:hover { opacity: 0.85; transform: translateY(-2px); }

  .btn-ghost {
    padding: 0.75rem 1.8rem;
    background: transparent;
    color: var(--text);
    border: 1px solid var(--border);
    border-radius: 8px;
    font-family: 'Outfit', sans-serif;
    font-size: 0.9rem;
    font-weight: 400;
    cursor: pointer;
    text-decoration: none;
    transition: border-color 0.2s, transform 0.2s;
    display: inline-flex; align-items: center; gap: 0.5rem;
  }

  .btn-ghost:hover { border-color: var(--indigo); transform: translateY(-2px); }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ── SECTIONS ── */
  section {
    padding: 6rem 2rem;
    max-width: 1100px;
    margin: 0 auto;
  }

  .section-label {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--indigo);
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
  }

  .section-label::before {
    content: attr(data-num);
    opacity: 0.5;
  }

  .section-label::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--border);
    max-width: 3rem;
  }

  .section-title {
    font-size: clamp(2rem, 4vw, 3rem);
    font-weight: 700;
    letter-spacing: -0.02em;
    line-height: 1.15;
    margin-bottom: 1rem;
    background: linear-gradient(135deg, var(--indigo), var(--cyan));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .section-desc {
    color: var(--muted);
    font-size: 1rem;
    max-width: 60ch;
    line-height: 1.7;
    margin-bottom: 3rem;
  }

  /* Glass card */
  .glass-card {
    background: var(--card-bg);
    backdrop-filter: blur(20px);
    border: 1px solid var(--border);
    border-radius: 16px;
    transition: transform 0.4s cubic-bezier(0.22,1,0.36,1), box-shadow 0.4s, border-color 0.3s;
  }

  .glass-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 0 50px rgba(99,102,241,0.15);
    border-color: rgba(99,102,241,0.35);
  }

  /* ── ABOUT ── */
  .about-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    align-items: start;
  }

  .about-text {
    color: var(--muted);
    line-height: 1.8;
    font-size: 1rem;
  }

  .about-text p + p { margin-top: 1rem; }

  .about-pills {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .about-pill {
    padding: 1.2rem 1.5rem;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    gap: 0.3rem;
  }

  .pill-label {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.65rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--indigo);
  }

  .pill-value {
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--text);
  }

  /* ── EXPERTISE ── */
  .expertise-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
  }

  .expertise-card {
    padding: 1.8rem;
    border-radius: 16px;
    display: flex;
    flex-direction: column;
    gap: 0.8rem;
  }

  .expertise-icon {
    width: 44px; height: 44px;
    border-radius: 10px;
    background: rgba(99,102,241,0.15);
    display: flex; align-items: center; justify-content: center;
    font-size: 1.2rem;
  }

  .expertise-title {
    font-size: 1rem;
    font-weight: 600;
    color: var(--text);
  }

  .expertise-desc {
    font-size: 0.85rem;
    color: var(--muted);
    line-height: 1.6;
  }

  /* ── CREDENTIALS ── */
  .cred-list {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }

  .cred-card {
    padding: 1.8rem 2rem;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 2rem;
  }

  .cred-left { display: flex; align-items: center; gap: 1.5rem; }

  .cred-badge {
    width: 56px; height: 56px;
    border-radius: 12px;
    background: linear-gradient(135deg, rgba(99,102,241,0.2), rgba(6,182,212,0.2));
    border: 1px solid rgba(99,102,241,0.2);
    display: flex; align-items: center; justify-content: center;
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.75rem;
    font-weight: 500;
    color: var(--indigo);
    flex-shrink: 0;
  }

  .cred-info { display: flex; flex-direction: column; gap: 0.25rem; }

  .cred-degree {
    font-size: 1rem;
    font-weight: 600;
    color: var(--text);
  }

  .cred-field {
    font-size: 0.85rem;
    color: var(--muted);
  }

  .cred-year {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.75rem;
    color: var(--indigo);
    background: rgba(99,102,241,0.1);
    border: 1px solid rgba(99,102,241,0.2);
    border-radius: 99px;
    padding: 0.25rem 0.75rem;
  }

  .cred-right { display: flex; align-items: center; gap: 1rem; }

  .btn-dl {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 0.1em;
    padding: 0.4rem 1rem;
    border: 1px solid var(--border);
    border-radius: 6px;
    color: var(--muted);
    text-decoration: none;
    transition: border-color 0.2s, color 0.2s;
    white-space: nowrap;
  }

  .btn-dl:hover { border-color: var(--indigo); color: var(--indigo); }

  /* ── AFFILIATIONS ── */
  .affil-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
  }

  .affil-card {
    padding: 2rem;
    border-radius: 16px;
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
  }

  .affil-type {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.65rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--cyan);
  }

  .affil-name {
    font-size: 1rem;
    font-weight: 600;
    color: var(--text);
    line-height: 1.4;
  }

  .affil-sub {
    font-size: 0.85rem;
    color: var(--muted);
  }

  /* ── CONTACT ── */
  .contact-box {
    padding: 3.5rem;
    border-radius: 20px;
    text-align: center;
    position: relative;
    overflow: hidden;
  }

  .contact-box::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(99,102,241,0.08), rgba(6,182,212,0.05));
    pointer-events: none;
  }

  .contact-box h3 {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--text);
    margin-bottom: 0.75rem;
    position: relative;
  }

  .contact-box p {
    color: var(--muted);
    margin-bottom: 2rem;
    position: relative;
  }

  .contact-links {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
    position: relative;
  }

  /* ── FOOTER ── */
  footer {
    border-top: 1px solid var(--border);
    padding: 2rem 2.5rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;
    z-index: 1;
  }

  .footer-copy {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.7rem;
    color: var(--muted);
    opacity: 0.6;
  }

  .footer-links {
    display: flex;
    gap: 1.5rem;
  }

  .footer-links a {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.7rem;
    color: var(--muted);
    text-decoration: none;
    opacity: 0.6;
    transition: opacity 0.2s, color 0.2s;
  }

  .footer-links a:hover { opacity: 1; color: var(--indigo); }

  /* ── FADE-UP ON SCROLL ── */
  .fade-up {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.7s cubic-bezier(0.22,1,0.36,1), transform 0.7s cubic-bezier(0.22,1,0.36,1);
  }

  .fade-up.visible { opacity: 1; transform: translateY(0); }

  /* ── RESPONSIVE ── */
  @media (max-width: 768px) {
    .about-grid { grid-template-columns: 1fr; }
    .expertise-grid { grid-template-columns: 1fr; }
    .affil-grid { grid-template-columns: 1fr; }
    nav { padding: 1rem 1.5rem; }
    .nav-links { display: none; }
    .cred-card { flex-direction: column; align-items: flex-start; }
    .contact-box { padding: 2rem 1.5rem; }
    footer { flex-direction: column; gap: 1rem; text-align: center; }
  }
</style>
</head>
<body>

<!-- NAV -->
<nav>
  <a href="#" class="nav-logo">MEH.</a>
  <ul class="nav-links">
    <li><a href="#about">About</a></li>
    <li><a href="#expertise">Expertise</a></li>
    <li><a href="#credentials">Credentials</a></li>
    <li><a href="#affiliations">Affiliations</a></li>
  </ul>
  <a href="#contact" class="nav-cta">Contact →</a>
</nav>

<div class="wrapper">

  <!-- HERO -->
  <div class="hero">
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>

    <div class="hero-badge">Portfolio / 2024</div>

    <h1>
      M. E.<br>
      <span class="grad-text">HAMDANE</span>
    </h1>

    <p class="hero-subtitle">
      Computer Science Researcher &amp; Software Engineering Specialist.<br>
      Building reliable systems, advancing software intelligence, and shaping the future of computing education.
    </p>

    <div class="hero-actions">
      <a href="#expertise" class="btn-primary">Explore Work ↓</a>
      <a href="#" class="btn-ghost">Download CV</a>
      <a href="#contact" class="btn-ghost">Contact →</a>
    </div>
  </div>

  <!-- ABOUT -->
  <section id="about" class="fade-up">
    <div class="section-label" data-num="01 —">About</div>
    <h2 class="section-title">Crafting the Future<br>of Software Systems</h2>

    <div class="about-grid">
      <div class="about-text">
        <p>As an Associate Professor at the Teachers' Training School of Constantine and a researcher within the GLAI team at LIRE Laboratory, Abdelhamid Mehri University, I operate at the intersection of rigorous computer science theory and practical systems engineering.</p>
        <p>My research portfolio spans software engineering, real-time and embedded systems verification, model checking, and the innovative application of technology in education through e-learning and m-learning platforms.</p>
        <p>I'm driven by the pursuit of building systems that are not just functional, but provably reliable.</p>
      </div>

      <div class="about-pills">
        <div class="glass-card about-pill">
          <span class="pill-label">Focus</span>
          <span class="pill-value">Software Verification &amp; Validation</span>
        </div>
        <div class="glass-card about-pill">
          <span class="pill-label">Impact</span>
          <span class="pill-value">Computing Education Innovation</span>
        </div>
        <div class="glass-card about-pill">
          <span class="pill-label">Approach</span>
          <span class="pill-value">Formal Methods &amp; Systems Thinking</span>
        </div>
      </div>
    </div>
  </section>

  <!-- EXPERTISE -->
  <section id="expertise" class="fade-up">
    <div class="section-label" data-num="02 —">Expertise</div>
    <h2 class="section-title">Research Domains</h2>
    <p class="section-desc">Core areas at the intersection of theory and engineering.</p>

    <div class="expertise-grid">
      <div class="glass-card expertise-card">
        <div class="expertise-icon">⚙️</div>
        <div class="expertise-title">Software Engineering</div>
        <p class="expertise-desc">Designing robust architectures and methodologies for reliable, scalable software systems.</p>
      </div>
      <div class="glass-card expertise-card">
        <div class="expertise-icon">⏱️</div>
        <div class="expertise-title">Real-Time Systems</div>
        <p class="expertise-desc">Engineering time-critical systems with guaranteed response and deterministic behavior.</p>
      </div>
      <div class="glass-card expertise-card">
        <div class="expertise-icon">🔬</div>
        <div class="expertise-title">Embedded Systems</div>
        <p class="expertise-desc">Formal verification techniques for safety-critical embedded architectures.</p>
      </div>
      <div class="glass-card expertise-card">
        <div class="expertise-icon">✅</div>
        <div class="expertise-title">Model Checking</div>
        <p class="expertise-desc">Automated verification of finite-state systems to ensure correctness by design.</p>
      </div>
      <div class="glass-card expertise-card">
        <div class="expertise-icon">📡</div>
        <div class="expertise-title">Digital Learning</div>
        <p class="expertise-desc">Pioneering e-learning and m-learning platforms for next-gen education delivery.</p>
      </div>
      <div class="glass-card expertise-card">
        <div class="expertise-icon">🎓</div>
        <div class="expertise-title">Education Technology</div>
        <p class="expertise-desc">Integrating ICT into education to transform teaching and learning outcomes.</p>
      </div>
    </div>
  </section>

  <!-- CREDENTIALS -->
  <section id="credentials" class="fade-up">
    <div class="section-label" data-num="03 —">Credentials</div>
    <h2 class="section-title">Academic Foundation</h2>
    <p class="section-desc">Degrees earned across software engineering, AI, and databases.</p>

    <div class="cred-list">
      <div class="glass-card cred-card">
        <div class="cred-left">
          <div class="cred-badge">PhD</div>
          <div class="cred-info">
            <span class="cred-degree">Doctor of Philosophy</span>
            <span class="cred-field">Software Engineering</span>
          </div>
        </div>
        <div class="cred-right">
          <span class="cred-year">2018</span>
          <a href="#" class="btn-dl">Download</a>
        </div>
      </div>

      <div class="glass-card cred-card">
        <div class="cred-left">
          <div class="cred-badge">MSc</div>
          <div class="cred-info">
            <span class="cred-degree">Master of Science</span>
            <span class="cred-field">Databases &amp; AI</span>
          </div>
        </div>
        <div class="cred-right">
          <span class="cred-year">2008</span>
          <a href="#" class="btn-dl">Download</a>
        </div>
      </div>

      <div class="glass-card cred-card">
        <div class="cred-left">
          <div class="cred-badge">Eng</div>
          <div class="cred-info">
            <span class="cred-degree">Engineering Degree</span>
            <span class="cred-field">Artificial Intelligence</span>
          </div>
        </div>
        <div class="cred-right">
          <span class="cred-year">2005</span>
          <a href="#" class="btn-dl">Download</a>
        </div>
      </div>
    </div>
  </section>

  <!-- AFFILIATIONS -->
  <section id="affiliations" class="fade-up">
    <div class="section-label" data-num="04 —">Affiliations</div>
    <h2 class="section-title">Institutional Network</h2>
    <p class="section-desc">Academic and research bodies where the work takes place.</p>

    <div class="affil-grid">
      <div class="glass-card affil-card">
        <span class="affil-type">Teaching</span>
        <div class="affil-name">Teachers' Training School of Constantine</div>
        <div class="affil-sub">Associate Professor — Computer Science</div>
      </div>
      <div class="glass-card affil-card">
        <span class="affil-type">Research</span>
        <div class="affil-name">LIRE Laboratory — GLAI Team</div>
        <div class="affil-sub">Abdelhamid Mehri University, Constantine</div>
      </div>
      <div class="glass-card affil-card">
        <span class="affil-type">Lab</span>
        <div class="affil-name">Software &amp; AI Research Group</div>
        <div class="affil-sub">Formal methods, verification, embedded systems</div>
      </div>
      <div class="glass-card affil-card">
        <span class="affil-type">Academic</span>
        <div class="affil-name">Abdelhamid Mehri University</div>
        <div class="affil-sub">Constantine 2 — Algeria</div>
      </div>
    </div>
  </section>

  <!-- CONTACT -->
  <section id="contact" class="fade-up">
    <div class="section-label" data-num="05 —">Contact</div>
    <div class="glass-card contact-box">
      <h3>Let's Connect</h3>
      <p>Open to academic collaborations, research partnerships, and speaking engagements.</p>
      <div class="contact-links">
        <a href="mailto:me.hamdane@example.com" class="btn-primary">Send Email →</a>
        <a href="#" class="btn-ghost">ResearchGate</a>
        <a href="#" class="btn-ghost">Google Scholar</a>
        <a href="#" class="btn-ghost">LinkedIn</a>
      </div>
    </div>
  </section>

</div><!-- /wrapper -->

<!-- FOOTER -->
<footer>
  <span class="footer-copy">© 2024 M. E. Hamdane. All rights reserved.</span>
  <div class="footer-links">
    <a href="#about">About</a>
    <a href="#expertise">Expertise</a>
    <a href="#credentials">Credentials</a>
    <a href="#contact">Contact</a>
  </div>
</footer>

<script>
  // Fade-up on scroll
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.12 });

  document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));
</script>
</body>
</html>
