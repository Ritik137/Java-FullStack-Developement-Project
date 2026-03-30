<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      font-family: 'Poppins', 'Segoe UI', sans-serif;
      overflow-x: hidden;
    }

    /* Navbar Animations */
    .navbar {
      background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
      padding: 1rem 2rem;
      position: sticky;
      top: 0;
      z-index: 1000;
      animation: slideDown 0.6s ease-out;
    }

    @keyframes slideDown {
      from {
        transform: translateY(-100%);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .navbar-brand {
      font-size: 1.5rem;
      font-weight: 700;
      letter-spacing: 0.5px;
      animation: fadeInLeft 0.8s ease-out;
    }

    .navbar-brand i {
      animation: spin 2s linear infinite;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    @keyframes fadeInLeft {
      from {
        opacity: 0;
        transform: translateX(-30px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    /* Container */
    .container-fluid {
      padding: 2rem 1.5rem;
    }

    /* Stat Cards with Animations */
    .stat-card {
      border-radius: 20px;
      color: white;
      padding: 2rem;
      position: relative;
      overflow: hidden;
      cursor: pointer;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
      animation: slideUp 0.6s ease-out;
    }

    @keyframes slideUp {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .stat-card:hover {
      transform: translateY(-15px);
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
    }

    .stat-card::before {
      content: '';
      position: absolute;
      top: 0;
      right: -50px;
      width: 200px;
      height: 200px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      transition: all 0.6s ease;
    }

    .stat-card:hover::before {
      right: -30px;
      width: 250px;
      height: 250px;
    }

    .stat-card.blue {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      animation-delay: 0.1s;
    }

    .stat-card.green {
      background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      animation-delay: 0.2s;
    }

    .stat-card.purple {
      background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      animation-delay: 0.3s;
    }

    .stat-number {
      font-size: 2.5rem;
      font-weight: 800;
      animation: countUp 1.5s ease-out forwards;
      opacity: 0;
    }

    @keyframes countUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .stat-icon {
      font-size: 3rem;
      opacity: 0.7;
      animation: float 3s ease-in-out infinite;
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-20px);
      }
    }

    /* Main Card */
    .card {
      border: none;
      border-radius: 25px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      padding: 2.5rem;
      animation: fadeInUp 0.8s ease-out;
      border-top: 5px solid transparent;
      border-image: linear-gradient(90deg, #667eea, #764ba2) 1;
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Header Section */
    .card h5 {
      font-weight: 800;
      color: #2c3e50;
      animation: fadeInLeft 0.8s ease-out 0.2s backwards;
    }

    .card h5 i {
      color: #667eea;
      animation: slideInLeft 0.8s ease-out 0.3s backwards;
    }

    @keyframes slideInLeft {
      from {
        transform: translateX(-30px);
        opacity: 0;
      }
      to {
        transform: translateX(0);
        opacity: 1;
      }
    }

    /* Search Box */
    .search-box {
      border: 2px solid #e0e0e0;
      border-radius: 15px;
      padding: 0.75rem 1.25rem;
      width: 280px;
      font-size: 0.95rem;
      transition: all 0.3s ease;
      background: #f8f9fa;
      animation: slideInRight 0.8s ease-out 0.2s backwards;
    }

    @keyframes slideInRight {
      from {
        transform: translateX(30px);
        opacity: 0;
      }
      to {
        transform: translateX(0);
        opacity: 1;
      }
    }

    .search-box:focus {
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
      outline: none;
      background: white;
      transform: scale(1.05);
    }

    .search-box::placeholder {
      color: #b0bec5;
    }

    /* Add Button */
    .btn-add {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 12px;
      padding: 0.75rem 1.75rem;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
      animation: slideInRight 0.8s ease-out 0.3s backwards;
      position: relative;
      overflow: hidden;
    }

    .btn-add::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.2);
      transition: left 0.3s ease;
      z-index: -1;
    }

    .btn-add:hover::before {
      left: 100%;
    }

    .btn-add:hover {
      transform: translateY(-3px);
      box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
      color: white;
    }

    .btn-add:active {
      transform: translateY(-1px);
    }

    /* Table Styling */
    .table {
      margin-bottom: 0;
    }

    .table thead {
      background: linear-gradient(90deg, #2c3e50, #3d5a6d);
      color: white;
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.85rem;
      letter-spacing: 0.5px;
    }

    .table thead th {
      border: none;
      padding: 1.2rem;
      position: relative;
    }

    .table tbody tr {
      border-top: 1px solid #f0f0f0;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      animation: fadeIn 0.6s ease-out forwards;
    }

    .table tbody tr:nth-child(1) { animation-delay: 0.1s; }
    .table tbody tr:nth-child(2) { animation-delay: 0.15s; }
    .table tbody tr:nth-child(3) { animation-delay: 0.2s; }
    .table tbody tr:nth-child(n+4) { animation-delay: 0.25s; }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateX(-20px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .table tbody tr:hover {
      background: linear-gradient(90deg, #f8f9fa, #e8eaf6);
      transform: scale(1.01);
      box-shadow: inset 0 0 10px rgba(102, 126, 234, 0.1);
    }

    .table td {
      padding: 1.2rem;
      vertical-align: middle;
      border: none;
    }

    /* Avatar */
    .avatar {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 0.9rem;
      box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
      animation: pulse 2s ease-in-out infinite;
    }

    @keyframes pulse {
      0%, 100% {
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
      }
      50% {
        box-shadow: 0 5px 25px rgba(102, 126, 234, 0.5);
      }
    }

    /* Badge */
    .badge-course {
      background: linear-gradient(135deg, #e8eaf6, #f3e5f5);
      color: #667eea;
      padding: 0.5rem 1rem;
      border-radius: 20px;
      font-size: 0.85rem;
      font-weight: 600;
      display: inline-block;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(102, 126, 234, 0.15);
    }

    .table tbody tr:hover .badge-course {
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
      transform: scale(1.05);
    }

    /* Action Buttons */
    .action-btn {
      width: 40px;
      height: 40px;
      border-radius: 10px;
      border: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      font-size: 0.9rem;
      margin: 0 0.25rem;
      position: relative;
      overflow: hidden;
    }

    .action-btn::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.3);
      transform: translate(-50%, -50%);
      transition: width 0.6s, height 0.6s;
    }

    .action-btn:active::before {
      width: 300px;
      height: 300px;
    }

    .btn-edit {
      background: #e3f2fd;
      color: #1976d2;
      box-shadow: 0 4px 15px rgba(25, 118, 210, 0.2);
    }

    .btn-edit:hover {
      background: #1976d2;
      color: white;
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(25, 118, 210, 0.35);
    }

    .btn-delete {
      background: #ffebee;
      color: #c62828;
      box-shadow: 0 4px 15px rgba(198, 40, 40, 0.2);
    }

    .btn-delete:hover {
      background: #c62828;
      color: white;
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(198, 40, 40, 0.35);
    }

    /* Empty State */
    .empty-state {
      text-align: center;
      padding: 3rem 1rem;
      animation: fadeInUp 0.6s ease-out;
    }

    .empty-state i {
      font-size: 4rem;
      color: #ccc;
      margin-bottom: 1rem;
      animation: bounce 2s ease-in-out infinite;
    }

    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-20px); }
    }

    .empty-state p {
      color: #999;
      font-size: 1.1rem;
      font-weight: 500;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .container-fluid { padding: 1rem 0.75rem; }
      .card { padding: 1.5rem; }
      .search-box { width: 100%; }
      .stat-card { padding: 1.5rem; }
      .stat-number { font-size: 2rem; }
      .table { font-size: 0.85rem; }
      .table td { padding: 0.75rem; }
      .action-btn { width: 35px; height: 35px; }
    }

    /* Loading Animation */
    .loading {
      display: inline-block;
      width: 8px;
      height: 8px;
      background: currentColor;
      border-radius: 50%;
      animation: loading 1.4s infinite;
      margin-right: 5px;
    }

    .loading:nth-child(2) { animation-delay: 0.2s; }
    .loading:nth-child(3) { animation-delay: 0.4s; }

    @keyframes loading {
      0%, 60%, 100% { opacity: 0.3; }
      30% { opacity: 1; }
    }

    /* Smooth Scrollbar */
    ::-webkit-scrollbar {
      width: 10px;
    }

    ::-webkit-scrollbar-track {
      background: #f1f1f1;
    }

    ::-webkit-scrollbar-thumb {
      background: linear-gradient(180deg, #667eea, #764ba2);
      border-radius: 5px;
    }

    ::-webkit-scrollbar-thumb:hover {
      background: linear-gradient(180deg, #764ba2, #667eea);
    }
  </style>
</head>
<body>

<nav class="navbar navbar-dark px-4 py-3">
  <span class="navbar-brand fw-bold fs-5">
    <i class="fas fa-graduation-cap me-2"></i>Student Management System
  </span>
  <span class="text-white-50 small">
    <i class="fas fa-circle text-success me-1" style="font-size:9px"></i>Online
  </span>
</nav>

<div class="container-fluid px-4 py-4">

  <!-- Statistics Cards -->
  <div class="row g-4 mb-5">
    <div class="col-lg-4 col-md-6" data-aos="fade-up">
      <div class="stat-card blue">
        <div class="d-flex justify-content-between align-items-start">
          <div>
            <div class="small opacity-75 mb-2">Total Students</div>
            <div class="stat-number">${students.size()}</div>
          </div>
          <i class="fas fa-users stat-icon"></i>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
      <div class="stat-card green">
        <div class="d-flex justify-content-between align-items-start">
          <div>
            <div class="small opacity-75 mb-2">Active Courses</div>
            <div class="stat-number">6</div>
          </div>
          <i class="fas fa-book stat-icon"></i>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
      <div class="stat-card purple">
        <div class="d-flex justify-content-between align-items-start">
          <div>
            <div class="small opacity-75 mb-2">System Status</div>
            <div class="stat-number" style="font-size: 1.8rem;">✅</div>
          </div>
          <i class="fas fa-server stat-icon"></i>
        </div>
      </div>
    </div>
  </div>

  <!-- Main Table Card -->
  <div class="card" data-aos="fade-up">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
      <h5 class="fw-bold mb-0">
        <i class="fas fa-list me-2"></i>All Students
      </h5>
      <div class="d-flex gap-2 align-items-center flex-wrap">
        <input type="text" id="searchBox" class="search-box form-control"
               placeholder="🔍 Search student by name, email...">
        <a href="${pageContext.request.contextPath}/students?action=new"
           class="btn btn-add">
          <i class="fas fa-plus me-1"></i> Add Student
        </a>
      </div>
    </div>

    <!-- Table -->
    <div class="table-responsive">
      <table class="table table-hover align-middle" id="studentTable">
        <thead>
          <tr>
            <th style="width: 5%;">#</th>
            <th style="width: 25%;">Student</th>
            <th style="width: 25%;">Email</th>
            <th style="width: 15%;">Phone</th>
            <th style="width: 15%;">Course</th>
            <th class="text-center" style="width: 15%;">Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="student" items="${students}" varStatus="s">
          <tr class="table-row-animate">
            <td>
              <span style="font-weight: 700; color: #667eea;">${s.count}</span>
            </td>
            <td>
              <div class="d-flex align-items-center gap-3">
                <div class="avatar">
                  ${student.firstName.charAt(0)}${student.lastName.charAt(0)}
                </div>
                <div>
                  <div class="fw-semibold" style="color: #2c3e50;">${student.firstName} ${student.lastName}</div>
                  <div class="text-muted small">ID: <span style="font-weight: 600; color: #667eea;">${student.id}</span></div>
                </div>
              </div>
            </td>
            <td>
              <span style="color: #555;">${student.email}</span>
            </td>
            <td>
              <span style="color: #555;">${student.phone}</span>
            </td>
            <td>
              <span class="badge-course">${student.course}</span>
            </td>
            <td class="text-center">
              <a href="${pageContext.request.contextPath}/students?action=edit&id=${student.id}"
                 class="action-btn btn-edit" title="Edit Student"
                 data-bs-toggle="tooltip">
                <i class="fas fa-pen"></i>
              </a>
              <a href="${pageContext.request.contextPath}/students?action=delete&id=${student.id}"
                 class="action-btn btn-delete"
                 onclick="return confirm('Are you sure you want to delete ${student.firstName}?')"
                 title="Delete Student"
                 data-bs-toggle="tooltip">
                <i class="fas fa-trash"></i>
              </a>
            </td>
          </tr>
          </c:forEach>
          <c:if test="${empty students}">
          <tr>
            <td colspan="6">
              <div class="empty-state">
                <i class="fas fa-inbox"></i>
                <p>No students found. <br><strong>Let's add one!</strong></p>
              </div>
            </td>
          </tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>

<script>
  // Initialize AOS
  AOS.init({
    duration: 800,
    easing: 'ease-in-out',
    once: true
  });

  // Search Functionality
  document.getElementById('searchBox').addEventListener('keyup', function () {
    const searchVal = this.value.toLowerCase();
    const rows = document.querySelectorAll('#studentTable tbody tr');
    
    rows.forEach(row => {
      const text = row.textContent.toLowerCase();
      if (row.classList.contains('empty-state')) return;
      
      if (text.includes(searchVal)) {
        row.style.display = '';
        row.style.animation = 'fadeIn 0.3s ease-out';
      } else {
        row.style.display = 'none';
      }
    });
  });

  // Counter Animation
  function animateCounter(element, target, duration = 1500) {
    let current = 0;
    const increment = target / (duration / 16);
    
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        element.textContent = target;
        clearInterval(timer);
      } else {
        element.textContent = Math.floor(current);
      }
    }, 16);
  }

  // Initialize counters when page loads
  document.querySelectorAll('.stat-number').forEach(element => {
    const target = parseInt(element.textContent);
    if (!isNaN(target)) {
      animateCounter(element, target);
    }
  });

  // Tooltip initialization
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  // Ripple effect on buttons
  document.querySelectorAll('.action-btn').forEach(btn => {
    btn.addEventListener('click', function(e) {
      const ripple = document.createElement('span');
      const rect = this.getBoundingClientRect();
      const size = Math.max(rect.width, rect.height);
      const x = e.clientX - rect.left - size / 2;
      const y = e.clientY - rect.top - size / 2;
      
      ripple.style.width = ripple.style.height = size + 'px';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
    });
  });
</script>
</body>
</html>