<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Student</title>
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
      display: flex;
      flex-direction: column;
      animation: backgroundShift 15s ease infinite;
    }

    @keyframes backgroundShift {
      0%, 100% { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
      50% { background: linear-gradient(135deg, #764ba2 0%, #f093fb 100%); }
    }

    /* Navbar */
    .navbar {
      background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
      padding: 1rem 2rem;
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
      font-size: 1.4rem;
      font-weight: 700;
      letter-spacing: 0.5px;
    }

    .navbar-brand i {
      animation: spin 2s linear infinite;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    /* Container */
    .container {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem 1rem;
      animation: fadeIn 0.8s ease-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    /* Main Card */
    .card {
      border: none;
      border-radius: 30px;
      box-shadow: 0 30px 80px rgba(0, 0, 0, 0.2);
      max-width: 550px;
      width: 100%;
      padding: 3rem;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      animation: scaleIn 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      border-top: 5px solid transparent;
      border-image: linear-gradient(90deg, #667eea, #764ba2) 1;
      position: relative;
      overflow: hidden;
    }

    @keyframes scaleIn {
      from {
        opacity: 0;
        transform: scale(0.9);
      }
      to {
        opacity: 1;
        transform: scale(1);
      }
    }

    .card::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -50%;
      width: 300px;
      height: 300px;
      background: radial-gradient(circle, rgba(102, 126, 234, 0.1) 0%, transparent 70%);
      border-radius: 50%;
      animation: float 6s ease-in-out infinite;
      z-index: 0;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-30px); }
    }

    .card > * {
      position: relative;
      z-index: 1;
    }

    /* Headers */
    .page-header {
      color: #667eea;
      font-weight: 800;
      font-size: 1.8rem;
      margin-bottom: 0.5rem;
      animation: fadeInLeft 0.8s ease-out;
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

    .page-subtitle {
      color: #999;
      font-size: 0.9rem;
      margin-bottom: 2rem;
      animation: fadeInLeft 0.8s ease-out 0.1s backwards;
    }

    /* Form Group */
    .form-group {
      margin-bottom: 1.8rem;
      animation: fadeInUp 0.6s ease-out forwards;
      opacity: 0;
    }

    .form-group:nth-child(1) { animation-delay: 0.2s; }
    .form-group:nth-child(2) { animation-delay: 0.25s; }
    .form-group:nth-child(3) { animation-delay: 0.3s; }
    .form-group:nth-child(4) { animation-delay: 0.35s; }
    .form-group:nth-child(5) { animation-delay: 0.4s; }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Form Label */
    .form-label {
      font-weight: 700;
      color: #2c3e50;
      margin-bottom: 0.7rem;
      display: block;
      font-size: 0.95rem;
      transition: all 0.3s ease;
    }

    /* Input Container */
    .input-container {
      position: relative;
      display: flex;
      align-items: center;
    }

    .input-icon {
      position: absolute;
      left: 16px;
      color: #667eea;
      font-size: 1rem;
      transition: all 0.3s ease;
      z-index: 2;
    }

    /* Form Control */
    .form-control,
    .form-select {
      border: 2px solid #e8e8e8;
      border-radius: 14px;
      padding: 12px 16px 12px 45px;
      font-size: 0.95rem;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      background: #f8f9fa;
      color: #2c3e50;
      font-weight: 500;
    }

    .form-control::placeholder {
      color: #bbb;
      font-weight: 400;
    }

    .form-control:focus,
    .form-select:focus {
      border-color: #667eea;
      background: white;
      box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15);
      outline: none;
      transform: translateY(-2px);
    }

    .form-control:hover:not(:focus),
    .form-select:hover:not(:focus) {
      border-color: #ccc;
    }

    /* Input Focus Effect */
    .form-control.focused,
    .form-select.focused {
      border-color: #667eea;
    }

    .input-container:hover .input-icon {
      color: #667eea;
      transform: scale(1.1);
    }

    /* Row Gap */
    .row {
      margin-bottom: 0 !important;
    }

    .col-md-6 {
      padding-right: 1rem;
      padding-left: 0;
    }

    .col-md-6:last-child {
      padding-right: 0;
      padding-left: 1rem;
    }

    /* Button Group */
    .button-group {
      display: flex;
      gap: 1rem;
      margin-top: 2.5rem;
      animation: fadeInUp 0.6s ease-out 0.45s backwards;
    }

    /* Update Button */
    .btn-update {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 12px;
      padding: 13px 24px;
      font-weight: 700;
      font-size: 1rem;
      flex-grow: 1;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
      position: relative;
      overflow: hidden;
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    .btn-update::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.2);
      transition: left 0.4s ease;
      z-index: 0;
    }

    .btn-update:hover::before {
      left: 100%;
    }

    .btn-update:hover {
      transform: translateY(-4px);
      box-shadow: 0 15px 45px rgba(102, 126, 234, 0.4);
    }

    .btn-update:active {
      transform: translateY(-2px);
    }

    .btn-update span {
      position: relative;
      z-index: 1;
    }

    /* Cancel Button */
    .btn-cancel {
      border-radius: 12px;
      padding: 13px 24px;
      border: 2px solid #e0e0e0;
      color: #667eea;
      background: transparent;
      font-weight: 700;
      font-size: 1rem;
      flex-grow: 1;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      position: relative;
      overflow: hidden;
    }

    .btn-cancel::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      z-index: -1;
      transform: scaleX(0);
      transform-origin: left;
      transition: transform 0.4s ease;
    }

    .btn-cancel:hover {
      color: white;
      border-color: transparent;
      transform: translateY(-4px);
    }

    .btn-cancel:hover::before {
      transform: scaleX(1);
    }

    .btn-cancel span {
      position: relative;
      z-index: 1;
    }

    /* Loading State */
    .loading-spinner {
      display: none;
      position: absolute;
      right: 15px;
      width: 20px;
      height: 20px;
    }

    .loading-spinner.show {
      display: inline-block;
      animation: spin 1s linear infinite;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    /* Alert Messages */
    .alert-custom {
      border-radius: 12px;
      padding: 1rem;
      margin-bottom: 1.5rem;
      border: none;
      animation: slideInDown 0.4s ease-out;
      opacity: 0;
    }

    .alert-custom.show {
      opacity: 1;
    }

    @keyframes slideInDown {
      from {
        opacity: 0;
        transform: translateY(-20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .alert-success {
      background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
      color: #155724;
      box-shadow: 0 10px 30px rgba(132, 250, 176, 0.3);
    }

    .alert-danger {
      background: linear-gradient(135deg, #fa8072 0%, #ff6b6b 100%);
      color: white;
      box-shadow: 0 10px 30px rgba(255, 107, 107, 0.3);
    }

    /* Tooltip Animation */
    .form-text {
      font-size: 0.8rem;
      color: #999;
      margin-top: 0.4rem;
      animation: fadeIn 0.5s ease-out;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .card {
        padding: 2rem;
      }

      .page-header {
        font-size: 1.5rem;
      }

      .button-group {
        flex-direction: column;
      }

      .col-md-6 {
        padding: 0 !important;
      }

      .col-md-6:last-child {
        padding: 0 !important;
      }
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

    /* Ripple Effect */
    .ripple {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.5);
      transform: scale(0);
      animation: ripple 0.6s ease-out;
      pointer-events: none;
    }

    @keyframes ripple {
      to {
        transform: scale(4);
        opacity: 0;
      }
    }
  </style>
</head>
<body>

<nav class="navbar navbar-dark px-4 py-3">
  <span class="navbar-brand fw-bold">
    <i class="fas fa-graduation-cap me-2"></i>Student Management System
  </span>
</nav>

<div class="container py-5">
  <div class="card">
    <h4 class="page-header mb-1">
      <i class="fas fa-user-edit me-2"></i>Edit Student
    </h4>
    <p class="page-subtitle">Update student information</p>

    <!-- Alert Messages -->
    <div id="successAlert" class="alert alert-custom alert-success" role="alert">
      <i class="fas fa-check-circle me-2"></i>
      <span id="successMessage"></span>
    </div>
    <div id="errorAlert" class="alert alert-custom alert-danger" role="alert">
      <i class="fas fa-exclamation-circle me-2"></i>
      <span id="errorMessage"></span>
    </div>

    <form action="${pageContext.request.contextPath}/students" method="post" id="editForm" novalidate>
      <input type="hidden" name="action" value="update">
      <input type="hidden" name="id" value="${student.id}">

      <div class="row g-3">
        <!-- First Name -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="firstName">
              <i class="fas fa-user me-1"></i>First Name
            </label>
            <div class="input-container">
              <i class="fas fa-user input-icon"></i>
              <input type="text" id="firstName" name="firstName" class="form-control"
                     value="${student.firstName}" placeholder="Enter first name" required>
              <div class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </div>
            </div>
            <small class="form-text">Minimum 2 characters required</small>
          </div>
        </div>

        <!-- Last Name -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="lastName">
              <i class="fas fa-user me-1"></i>Last Name
            </label>
            <div class="input-container">
              <i class="fas fa-user input-icon"></i>
              <input type="text" id="lastName" name="lastName" class="form-control"
                     value="${student.lastName}" placeholder="Enter last name" required>
              <div class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </div>
            </div>
            <small class="form-text">Minimum 2 characters required</small>
          </div>
        </div>

        <!-- Email -->
        <div class="col-12">
          <div class="form-group">
            <label class="form-label" for="email">
              <i class="fas fa-envelope me-1"></i>Email Address
            </label>
            <div class="input-container">
              <i class="fas fa-envelope input-icon"></i>
              <input type="email" id="email" name="email" class="form-control"
                     value="${student.email}" placeholder="Enter email address" required>
              <div class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </div>
            </div>
            <small class="form-text">Valid email format required (e.g., student@example.com)</small>
          </div>
        </div>

        <!-- Phone -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="phone">
              <i class="fas fa-phone me-1"></i>Phone Number
            </label>
            <div class="input-container">
              <i class="fas fa-phone input-icon"></i>
              <input type="tel" id="phone" name="phone" class="form-control"
                     value="${student.phone}" placeholder="Enter phone number">
              <div class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </div>
            </div>
            <small class="form-text">10 digits required</small>
          </div>
        </div>

        <!-- Course -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="course">
              <i class="fas fa-book me-1"></i>Course
            </label>
            <div class="input-container">
              <i class="fas fa-book input-icon"></i>
              <select id="course" name="course" class="form-select" required>
                <option value="">-- Select Course --</option>
                <option value="BCA" ${student.course == 'BCA'    ? 'selected' : ''}>BCA</option>
                <option value="MCA" ${student.course == 'MCA'    ? 'selected' : ''}>MCA</option>
                <option value="B.Tech" ${student.course == 'B.Tech' ? 'selected' : ''}>B.Tech</option>
                <option value="M.Tech" ${student.course == 'M.Tech' ? 'selected' : ''}>M.Tech</option>
                <option value="BSc CS" ${student.course == 'BSc CS' ? 'selected' : ''}>BSc CS</option>
                <option value="MBA" ${student.course == 'MBA'    ? 'selected' : ''}>MBA</option>
              </select>
              <div class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </div>
            </div>
            <small class="form-text">Select your course of study</small>
          </div>
        </div>

        <!-- Buttons -->
        <div class="col-12">
          <div class="button-group">
            <button type="submit" class="btn btn-update">
              <span>
                <i class="fas fa-check me-1"></i>Update Student
              </span>
              <span class="loading-spinner">
                <i class="fas fa-circle-notch"></i>
              </span>
            </button>
            <a href="${pageContext.request.contextPath}/students"
               class="btn btn-cancel">
              <span>
                <i class="fas fa-times me-1"></i>Cancel
              </span>
            </a>
          </div>
        </div>
      </div>
    </form>
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

  // Form Elements
  const editForm = document.getElementById('editForm');
  const inputs = document.querySelectorAll('.form-control, .form-select');
  const successAlert = document.getElementById('successAlert');
  const errorAlert = document.getElementById('errorAlert');

  // Input Focus Effects
  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.classList.add('focused');
      this.parentElement.style.transform = 'scale(1.02)';
    });

    input.addEventListener('blur', function() {
      if (!this.value) {
        this.classList.remove('focused');
      }
      this.parentElement.style.transform = 'scale(1)';
    });

    // Validation on input
    input.addEventListener('input', function() {
      validateField(this);
    });
  });

  // Form Validation
  function validateField(field) {
    const value = field.value.trim();
    const fieldName = field.name;

    if (fieldName === 'firstName' || fieldName === 'lastName') {
      if (value.length < 2) {
        field.style.borderColor = '#ff6b6b';
      } else {
        field.style.borderColor = '#84fab0';
      }
    }

    if (fieldName === 'email') {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(value)) {
        field.style.borderColor = '#ff6b6b';
      } else {
        field.style.borderColor = '#84fab0';
      }
    }

    if (fieldName === 'phone') {
      if (value && value.length !== 10) {
        field.style.borderColor = '#ff6b6b';
      } else if (value) {
        field.style.borderColor = '#84fab0';
      }
    }

    if (fieldName === 'course') {
      if (!value) {
        field.style.borderColor = '#ff6b6b';
      } else {
        field.style.borderColor = '#84fab0';
      }
    }
  }

  // Form Submission
  editForm.addEventListener('submit', function(e) {
    e.preventDefault();

    let isValid = true;

    // Validate all fields
    inputs.forEach(input => {
      if (!input.value.trim()) {
        isValid = false;
        input.style.borderColor = '#ff6b6b';
      } else {
        validateField(input);
      }
    });

    if (!isValid) {
      showError('Please fill in all required fields correctly');
      return;
    }

    // Show loading state
    const updateBtn = editForm.querySelector('.btn-update');
    const spinner = updateBtn.querySelector('.loading-spinner');
    spinner.classList.add('show');
    updateBtn.disabled = true;

    // Simulate API call
    setTimeout(() => {
      spinner.classList.remove('show');
      updateBtn.disabled = false;

      // Show success message
      showSuccess('Student updated successfully! Redirecting...');

      // Redirect after 2 seconds
      setTimeout(() => {
        editForm.submit();
      }, 1500);
    }, 1500);
  });

  // Show Success Message
  function showSuccess(message) {
    errorAlert.classList.remove('show');
    document.getElementById('successMessage').textContent = message;
    successAlert.classList.add('show');
    successAlert.style.animation = 'slideInDown 0.4s ease-out';
  }

  // Show Error Message
  function showError(message) {
    successAlert.classList.remove('show');
    document.getElementById('errorMessage').textContent = message;
    errorAlert.classList.add('show');
    errorAlert.style.animation = 'slideInDown 0.4s ease-out';
  }

  // Ripple Effect on Button Click
  document.querySelectorAll('.btn').forEach(button => {
    button.addEventListener('click', function(e) {
      const ripple = document.createElement('span');
      const rect = this.getBoundingClientRect();
      const size = Math.max(rect.width, rect.height);
      const x = e.clientX - rect.left - size / 2;
      const y = e.clientY - rect.top - size / 2;

      ripple.style.width = ripple.style.height = size + 'px';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
      ripple.classList.add('ripple');

      this.appendChild(ripple);
    });
  });

  // Prevent page reload and show validation
  document.addEventListener('DOMContentLoaded', function() {
    inputs.forEach(input => {
      if (input.value) {
        validateField(input);
        input.classList.add('focused');
      }
    });
  });
</script>
</body>
</html>