
// Registration JavaScript file
document.addEventListener('DOMContentLoaded', function() {
  // Get form element
  const registerForm = document.getElementById('registerForm');
  const submitButton = document.getElementById('submitButton');
  const toast = document.getElementById('toast');
  const toastInstance = new bootstrap.Toast(toast);
  const toastTitle = document.getElementById('toastTitle');
  const toastMessage = document.getElementById('toastMessage');

  // Show toast notification
  function showToast(type, message) {
    if (type === 'success') {
      toast.classList.remove('bg-danger', 'text-white');
      toast.classList.add('bg-success', 'text-white');
      toastTitle.textContent = 'Success';
    } else {
      toast.classList.remove('bg-success', 'text-white');
      toast.classList.add('bg-danger', 'text-white');
      toastTitle.textContent = 'Error';
    }
    
    toastMessage.textContent = message;
    toastInstance.show();
  }

  // Form submission handler
  registerForm.addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Get form values
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    // Show loading state
    const originalButtonText = submitButton.innerHTML;
    submitButton.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Creating account...';
    submitButton.disabled = true;
    
    // Simulate registration (setTimeout simulates a network request)
    setTimeout(function() {
      if (name && email && password) {
        showToast('success', 'Account created successfully');
        // Here you would normally redirect to a login page or dashboard
        setTimeout(() => {
          window.location.href = "index.html";
        }, 1500);
      } else {
        showToast('error', 'Please fill in all fields');
      }
      
      // Reset button state
      submitButton.innerHTML = originalButtonText;
      submitButton.disabled = false;
    }, 800);
  });
});
