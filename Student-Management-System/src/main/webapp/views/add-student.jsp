<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student</title>
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
      position: relative;
      overflow-x: hidden;
    }

    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
      background-size: 50px 50px;
      animation: moveBackground 20s linear infinite;
      z-index: -1;
      pointer-events: none;
    }

    @keyframes moveBackground {
      0% { transform: translate(0, 0); }
      100% { transform: translate(50px, 50px); }
    }

    /* Navbar */
    .navbar {
      background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
      box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
      padding: 1.2rem 2rem;
      animation: slideDown 0.6s ease-out;
      position: relative;
      z-index: 100;
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
      font-weight: 800;
      letter-spacing: 1px;
      background: linear-gradient(135deg, #667eea, #764ba2);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .navbar-brand i {
      animation: spin 3s linear infinite;
      margin-right: 0.5rem;
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
      box-shadow: 0 40px 100px rgba(0, 0, 0, 0.25);
      max-width: 580px;
      width: 100%;
      padding: 3.5rem;
      background: rgba(255, 255, 255, 0.96);
      backdrop-filter: blur(20px);
      animation: popIn 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      border-top: 6px solid transparent;
      border-image: linear-gradient(90deg, #667eea, #764ba2, #f093fb) 1;
      position: relative;
      overflow: hidden;
    }

    .card::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -50%;
      width: 300px;
      height: 300px;
      background: radial-gradient(circle, rgba(102, 126, 234, 0.15) 0%, transparent 70%);
      border-radius: 50%;
      animation: floatBubble 8s ease-in-out infinite;
      z-index: 0;
    }

    .card::after {
      content: '';
      position: absolute;
      bottom: -100px;
      left: -100px;
      width: 250px;
      height: 250px;
      background: radial-gradient(circle, rgba(240, 147, 251, 0.1) 0%, transparent 70%);
      border-radius: 50%;
      animation: floatBubble 10s ease-in-out infinite reverse;
      z-index: 0;
    }

    @keyframes floatBubble {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-40px); }
    }

    @keyframes popIn {
      from {
        opacity: 0;
        transform: scale(0.8);
      }
      to {
        opacity: 1;
        transform: scale(1);
      }
    }

    .card > * {
      position: relative;
      z-index: 1;
    }

    /* Headers */
    .page-header {
      color: #667eea;
      font-weight: 900;
      font-size: 2rem;
      margin-bottom: 0.3rem;
      animation: fadeInLeft 0.8s ease-out;
    }

    @keyframes fadeInLeft {
      from {
        opacity: 0;
        transform: translateX(-40px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .page-subtitle {
      color: #999;
      font-size: 0.95rem;
      margin-bottom: 2.5rem;
      animation: fadeInLeft 0.8s ease-out 0.1s backwards;
      font-weight: 500;
    }

    /* Form Group */
    .form-group {
      margin-bottom: 2rem;
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
        transform: translateY(30px);
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
      margin-bottom: 0.8rem;
      display: flex;
      align-items: center;
      font-size: 0.98rem;
      letter-spacing: 0.3px;
      transition: all 0.3s ease;
    }

    .form-label i {
      margin-right: 0.6rem;
      color: #667eea;
      font-size: 1rem;
    }

    /* Input Container */
    .input-container {
      position: relative;
      display: flex;
      align-items: center;
      transition: all 0.3s ease;
    }

    .input-icon {
      position: absolute;
      left: 16px;
      color: #b0bec5;
      font-size: 1.1rem;
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      z-index: 2;
      pointer-events: none;
    }

    /* Form Control */
    .form-control,
    .form-select {
      border: 2.5px solid #e8e8e8;
      border-radius: 15px;
      padding: 13px 18px 13px 50px;
      font-size: 0.98rem;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      background: linear-gradient(135deg, #f8f9fa, #ffffff);
      color: #2c3e50;
      font-weight: 500;
      position: relative;
      z-index: 1;
    }

    .form-control::placeholder {
      color: #ccc;
      font-weight: 400;
    }

    .form-control:hover,
    .form-select:hover {
      border-color: #d0d0d0;
      box-shadow: 0 8px 20px rgba(102, 126, 234, 0.12);
    }

    .form-control:focus,
    .form-select:focus {
      border-color: #667eea;
      background: white;
      box-shadow: 0 0 0 5px rgba(102, 126, 234, 0.15);
      outline: none;
      transform: translateY(-3px);
    }

    .form-control.is-valid {
      border-color: #84fab0;
      background: linear-gradient(135deg, #f0fdf4, #ffffff);
    }

    .form-control.is-invalid {
      border-color: #ff6b6b;
      background: linear-gradient(135deg, #fff5f5, #ffffff);
    }

    /* Icon Animation on Focus */
    .form-control:focus ~ .input-icon,
    .form-select:focus ~ .input-icon {
      color: #667eea;
      transform: scale(1.2) rotate(10deg);
    }

    .input-container:hover .input-icon {
      color: #667eea;
      transform: scale(1.1);
    }

    /* Form Select */
    .form-select {
      padding-right: 45px;
      cursor: pointer;
      appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='%23667eea' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 15px center;
      background-size: 16px;
      padding-right: 40px;
    }

    /* Row Gap */
    .row {
      margin-bottom: 0 !important;
    }

    .col-md-6 {
      padding-right: 1rem;
      padding-left: 0;
    }

    .col-md-6:nth-child(even) {
      padding-right: 0;
      padding-left: 1rem;
    }

    /* Helper Text */
    .form-text {
      font-size: 0.8rem;
      color: #999;
      margin-top: 0.5rem;
      display: block;
      animation: fadeIn 0.5s ease-out;
    }

    .form-text.error {
      color: #ff6b6b;
      font-weight: 600;
    }

    .form-text.success {
      color: #84fab0;
      font-weight: 600;
    }

    /* Button Group */
    .button-group {
      display: flex;
      gap: 1.2rem;
      margin-top: 3rem;
      animation: fadeInUp 0.6s ease-out 0.5s backwards;
    }

    /* Submit Button */
    .btn-submit {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 14px;
      padding: 14px 28px;
      font-weight: 800;
      font-size: 1rem;
      flex-grow: 1;
      cursor: pointer;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      box-shadow: 0 15px 40px rgba(102, 126, 234, 0.35);
      position: relative;
      overflow: hidden;
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.7rem;
      letter-spacing: 0.5px;
    }

    .btn-submit::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
      transition: left 0.5s ease;
      z-index: 0;
    }

    .btn-submit:hover::before {
      left: 100%;
    }

    .btn-submit:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 50px rgba(102, 126, 234, 0.45);
    }

    .btn-submit:active {
      transform: translateY(-2px);
    }

    .btn-submit span {
      position: relative;
      z-index: 1;
    }

    .btn-submit i {
      font-size: 1.1rem;
    }

    /* Cancel Button */
    .btn-cancel {
      border-radius: 14px;
      padding: 14px 28px;
      border: 2.5px solid #e0e0e0;
      color: #667eea;
      background: transparent;
      font-weight: 800;
      font-size: 1rem;
      flex-grow: 1;
      cursor: pointer;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.7rem;
      position: relative;
      overflow: hidden;
      letter-spacing: 0.5px;
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
      transform: translateY(-5px);
      box-shadow: 0 15px 40px rgba(102, 126, 234, 0.3);
    }

    .btn-cancel:hover::before {
      transform: scaleX(1);
    }

    .btn-cancel i {
      font-size: 1.1rem;
    }

    /* Loading State */
    .loading-spinner {
      display: none;
      width: 18px;
      height: 18px;
      margin-left: 0.5rem;
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
      border-radius: 14px;
      padding: 1.2rem;
      margin-bottom: 1.5rem;
      border: none;
      animation: slideInDown 0.4s ease-out;
      opacity: 0;
      display: none;
    }

    .alert-custom.show {
      opacity: 1;
      display: block;
    }

    @keyframes slideInDown {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .alert-success {
      background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
      color: #155724;
      box-shadow: 0 10px 35px rgba(132, 250, 176, 0.3);
      font-weight: 600;
    }

    .alert-danger {
      background: linear-gradient(135deg, #fa8072 0%, #ff6b6b 100%);
      color: white;
      box-shadow: 0 10px 35px rgba(255, 107, 107, 0.3);
      font-weight: 600;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .card {
        padding: 2rem;
      }

      .page-header {
        font-size: 1.6rem;
      }

      .page-subtitle {
        margin-bottom: 1.5rem;
      }

      .button-group {
        flex-direction: column;
        gap: 1rem;
        margin-top: 2rem;
      }

      .col-md-6 {
        padding: 0 !important;
      }

      .form-group {
        margin-bottom: 1.5rem;
      }

      .btn-submit,
      .btn-cancel {
        padding: 12px 20px;
        font-size: 0.95rem;
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

    /* Success Checkmark */
    .success-icon {
      display: none;
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #84fab0;
      font-size: 1.2rem;
      animation: scaleIn 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    @keyframes scaleIn {
      from {
        transform: translateY(-50%) scale(0);
      }
      to {
        transform: translateY(-50%) scale(1);
      }
    }
  </style>
</head>
<body>

<nav class="navbar navbar-dark px-4 py-3">
  <span class="navbar-brand fw-bold">
    <i class="fas fa-graduation-cap"></i>Student Management System
  </span>
</nav>

<div class="container py-5">
  <div class="card">
    <h4 class="page-header mb-1">
      <i class="fas fa-user-plus me-2"></i>Add New Student
    </h4>
    <p class="page-subtitle">Fill the form to register a new student</p>

    <!-- Alert Messages -->
    <div id="successAlert" class="alert alert-custom alert-success" role="alert">
      <i class="fas fa-check-circle me-2"></i>
      <span id="successMessage"></span>
    </div>
    <div id="errorAlert" class="alert alert-custom alert-danger" role="alert">
      <i class="fas fa-exclamation-circle me-2"></i>
      <span id="errorMessage"></span>
    </div>

    <form action="${pageContext.request.contextPath}/students" method="post" id="addForm" novalidate>
      <input type="hidden" name="action" value="add">

      <div class="row g-0">
        <!-- First Name -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="firstName">
              <i class="fas fa-user"></i>First Name
            </label>
            <div class="input-container">
              <input type="text" id="firstName" name="firstName" class="form-control"
                     placeholder="John" required>
              <i class="fas fa-user input-icon"></i>
              <i class="fas fa-check-circle success-icon"></i>
            </div>
            <small class="form-text">2-50 characters required</small>
          </div>
        </div>

        <!-- Last Name -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="lastName">
              <i class="fas fa-user"></i>Last Name
            </label>
            <div class="input-container">
              <input type="text" id="lastName" name="lastName" class="form-control"
                     placeholder="Doe" required>
              <i class="fas fa-user input-icon"></i>
              <i class="fas fa-check-circle success-icon"></i>
            </div>
            <small class="form-text">2-50 characters required</small>
          </div>
        </div>

        <!-- Email -->
        <div class="col-12">
          <div class="form-group">
            <label class="form-label" for="email">
              <i class="fas fa-envelope"></i>Email Address
            </label>
            <div class="input-container">
              <input type="email" id="email" name="email" class="form-control"
                     placeholder="john.doe@example.com" required>
              <i class="fas fa-envelope input-icon"></i>
              <i class="fas fa-check-circle success-icon"></i>
            </div>
            <small class="form-text">Valid email format required</small>
          </div>
        </div>

        <!-- Phone -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="phone">
              <i class="fas fa-phone"></i>Phone Number
            </label>
            <div class="input-container">
              <input type="tel" id="phone" name="phone" class="form-control"
                     placeholder="9876543210">
              <i class="fas fa-phone input-icon"></i>
              <i class="fas fa-check-circle success-icon"></i>
            </div>
            <small class="form-text">10-digit number</small>
          </div>
        </div>

        <!-- Course -->
        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="course">
              <i class="fas fa-book"></i>Course
            </label>
            <div class="input-container">
              <select id="course" name="course" class="form-select" required>
                <option value="">-- Select Course --</option>
                <option value="BCA">BCA</option>
                <option value="MCA">MCA</option>
                <option value="B.Tech">B.Tech</option>
                <option value="M.Tech">M.Tech</option>
                <option value="BSc CS">BSc CS</option>
                <option value="MBA">MBA</option>
              </select>
              <i class="fas fa-book input-icon"></i>
              <i class="fas fa-check-circle success-icon"></i>
            </div>
            <small class="form-text">Select your course of study</small>
          </div>
        </div>

        <!-- Buttons -->
        <div class="col-12">
          <div class="button-group">
            <button type="submit" class="btn btn-submit">
              <span>
                <i class="fas fa-save"></i>Save Student
              </span>
              <span class="loading-spinner">
                <i class="fas fa-spinner"></i>
              </span>
            </button>
            <a href="${pageContext.request.contextPath}/students"
               class="btn btn-cancel">
              <span>
                <i class="fas fa-times"></i>Cancel
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
  const addForm = document.getElementById('addForm');
  const inputs = document.querySelectorAll('.form-control, .form-select');
  const successAlert = document.getElementById('successAlert');
  const errorAlert = document.getElementById('errorAlert');

  // Validation Rules
  const validationRules = {
    firstName: {
      regex: /^[a-zA-Z\s]{2,50}$/,
      message: 'First name must be 2-50 characters (letters only)'
    },
    lastName: {
      regex: /^[a-zA-Z\s]{2,50}$/,
      message: 'Last name must be 2-50 characters (letters only)'
    },
    email: {
      regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
      message: 'Please enter a valid email address'
    },
    phone: {
      regex: /^[0-9]{10}$/,
      message: 'Phone number must be exactly 10 digits'
    },
    course: {
      regex: /.+/,
      message: 'Please select a course'
    }
  };

  // Input Focus Effects
  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.classList.add('focused');
    });

    input.addEventListener('blur', function() {
      validateField(this);
    });

    input.addEventListener('input', function() {
      validateFieldRealTime(this);
    });
  });

  // Real-time Validation
  function validateFieldRealTime(field) {
    const fieldName = field.name;
    const rule = validationRules[fieldName];
    
    if (!rule) return;

    const isValid = rule.regex.test(field.value);
    const container = field.closest('.input-container');
    const successIcon = container.querySelector('.success-icon');

    if (isValid && field.value) {
      field.classList.remove('is-invalid');
      field.classList.add('is-valid');
      successIcon.style.display = 'block';
    } else {
      field.classList.remove('is-valid', 'is-invalid');
      successIcon.style.display = 'none';
      if (field.value) {
        field.classList.add('is-invalid');
      }
    }
  }

  // Field Validation
  function validateField(field) {
    const fieldName = field.name;
    const rule = validationRules[fieldName];
    
    if (!rule) return true;

    return rule.regex.test(field.value);
  }

  // Form Submission
  addForm.addEventListener('submit', function(e) {
    e.preventDefault();

    let isValid = true;
    const errors = [];

    // Validate all fields
    inputs.forEach(input => {
      if (!input.value.trim()) {
        isValid = false;
        input.classList.add('is-invalid');
        const fieldLabel = input.closest('.form-group').querySelector('.form-label').textContent.trim();
        errors.push(`${fieldLabel} is required`);
      } else if (!validateField(input)) {
        isValid = false;
        input.classList.add('is-invalid');
        const rule = validationRules[input.name];
        if (rule) {
          errors.push(rule.message);
        }
      }
    });

    if (!isValid) {
      showError(errors.join(', '));
      return;
    }

    // Show loading state
    const submitBtn = addForm.querySelector('.btn-submit');
    const spinner = submitBtn.querySelector('.loading-spinner');
    spinner.classList.add('show');
    submitBtn.disabled = true;

    // Simulate API call
    setTimeout(() => {
      spinner.classList.remove('show');
      submitBtn.disabled = false;

      // Show success message
      showSuccess('Student added successfully! Redirecting...');

      // Redirect after 2 seconds
      setTimeout(() => {
        addForm.submit();
      }, 1800);
    }, 1500);
  });

  // Show Success Message
  function showSuccess(message) {
    errorAlert.classList.remove('show');
    document.getElementById('successMessage').textContent = message;
    successAlert.classList.add('show');
  }

  // Show Error Message
  function showError(message) {
    successAlert.classList.remove('show');
    document.getElementById('errorMessage').textContent = message;
    errorAlert.classList.add('show');
  }

  // Initialize on page load
  document.addEventListener('DOMContentLoaded', function() {
    // Add subtle animation to form fields
    inputs.forEach((input, index) => {
      input.style.animationDelay = `${0.2 + (index * 0.05)}s`;
    });
  });

  // Prevent accidental navigation
  window.addEventListener('beforeunload', function(e) {
    const formData = new FormData(addForm);
    const hasData = Array.from(formData.values()).some(val => val);
    if (hasData) {
      e.preventDefault();
      e.returnValue = '';
    }
  });
</script>
</body>
</html>