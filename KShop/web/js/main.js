// Main JavaScript file
document.addEventListener('DOMContentLoaded', function() {
  // Get form element
  const loginForm = document.getElementById('loginForm');
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
  loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Get form values
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    // Show loading state
    const originalButtonText = submitButton.innerHTML;
    submitButton.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Signing in...';
    submitButton.disabled = true;
    
    // Simulate authentication (setTimeout simulates a network request)
    setTimeout(function() {
      if (email && password) {
        showToast('success', 'Logged in successfully');
        // Here you would normally redirect to a dashboard or home page
        // window.location.href = "dashboard.html";
      } else {
        showToast('error', 'Please fill in all fields');
      }
      
      // Reset button state
      submitButton.innerHTML = originalButtonText;
      submitButton.disabled = false;
    }, 800);
  });
});

(function ($) {
    "use strict";
    
    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

    // Vendor carousel
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:2
            },
            576:{
                items:3
            },
            768:{
                items:4
            },
            992:{
                items:5
            },
            1200:{
                items:6
            }
        }
    });

    // Related carousel
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:2
            },
            768:{
                items:3
            },
            992:{
                items:4
            }
        }
    });

    // Product Quantity
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });
    
})(jQuery);