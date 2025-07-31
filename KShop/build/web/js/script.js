
// Sample product data
const products = [
  {
    id: 1,
    name: "Men's Casual Shirt",
    price: 49.99,
    image: "https://via.placeholder.com/300x400?text=Men+Casual+Shirt",
    category: "men-shirts",
    description: "Comfortable casual shirt for men, perfect for everyday wear."
  },
  {
    id: 2,
    name: "Men's Formal Shirt",
    price: 59.99,
    image: "https://via.placeholder.com/300x400?text=Men+Formal+Shirt",
    category: "men-shirts",
    description: "Elegant formal shirt for men, ideal for business meetings and special occasions."
  },
  {
    id: 3,
    name: "Men's Jeans",
    price: 79.99,
    image: "https://via.placeholder.com/300x400?text=Men+Jeans",
    category: "men-pants",
    description: "Stylish and durable jeans for men, providing comfort and style."
  },
  {
    id: 4,
    name: "Men's Chinos",
    price: 69.99,
    image: "https://via.placeholder.com/300x400?text=Men+Chinos",
    category: "men-pants",
    description: "Classic chinos for men, versatile for both casual and semi-formal occasions."
  },
  {
    id: 7,
    name: "Women's Summer Dress",
    price: 69.99,
    image: "https://via.placeholder.com/300x400?text=Women+Dress",
    category: "women-dresses",
    description: "Lightweight and stylish summer dress for women, perfect for warm days."
  },
  {
    id: 8,
    name: "Women's Evening Gown",
    price: 149.99,
    image: "https://via.placeholder.com/300x400?text=Women+Gown",
    category: "women-dresses",
    description: "Elegant evening gown for women, ideal for special occasions and formal events."
  },
  {
    id: 9,
    name: "Women's Blouse",
    price: 39.99,
    image: "https://via.placeholder.com/300x400?text=Women+Blouse",
    category: "women-tops",
    description: "Fashionable blouse for women, versatile for both casual and formal settings."
  },
  {
    id: 10,
    name: "Women's T-Shirt",
    price: 24.99,
    image: "https://via.placeholder.com/300x400?text=Women+T-Shirt",
    category: "women-tops",
    description: "Comfortable and trendy t-shirt for women, essential for everyday wear."
  },
];

// Cart array to store added products
let cart = [];
// Order history array
let orders = [];
// User profile data
let userProfile = {
  fullName: "Le Trung Kien",
  email: "lazyvl@example.com",
  phone: "0355990013",
  birthDate: "2004-12-21",
  address: "123 Fashion Street, City, Country",
};

// DOM Ready
document.addEventListener('DOMContentLoaded', function() {
  // Load products
  loadProducts();
  
  // Setup event listeners
  setupEventListeners();
  
  // Display featured products
  displayFeaturedProducts();
});

// Load products to their respective categories
function loadProducts() {
  // Get all category containers
  const menShirts = document.querySelector('#men-shirts .products-grid');
  const menPants = document.querySelector('#men-pants .products-grid');
  const womenDresses = document.querySelector('#women-dresses .products-grid');
  const womenTops = document.querySelector('#women-tops .products-grid');
  
  // Filter products by category and render
  products.filter(product => product.category === 'men-shirts').forEach(product => {
    renderProductCard(product, menShirts);
  });
  
  products.filter(product => product.category === 'men-pants').forEach(product => {
    renderProductCard(product, menPants);
  });
  
  products.filter(product => product.category === 'women-dresses').forEach(product => {
    renderProductCard(product, womenDresses);
  });
  
  products.filter(product => product.category === 'women-tops').forEach(product => {
    renderProductCard(product, womenTops);
  });
}

// Render a product card
function renderProductCard(product, container) {
  const productCol = document.createElement('div');
  productCol.className = 'col-md-4 mb-4';
  
  productCol.innerHTML = `
    <div class="card product-card">
      <img src="${product.image}" class="card-img-top" alt="${product.name}">
      <div class="card-body d-flex flex-column">
        <h5 class="card-title">${product.name}</h5>
        <p class="card-text">${product.description}</p>
        <div class="mt-auto d-flex justify-content-between align-items-center">
          <span class="price">$${product.price.toFixed(2)}</span>
          <button class="btn btn-primary btn-sm add-to-cart" data-id="${product.id}">Add to Cart</button>
        </div>
      </div>
    </div>
  `;
  
  container.appendChild(productCol);
}


// Setup all event listeners
function setupEventListeners() {
  // "Add to Cart" buttons
  document.querySelectorAll('.add-to-cart').forEach(button => {
    button.addEventListener('click', function() {
      const productId = parseInt(this.getAttribute('data-id'));
      addToCart(productId);
    });
  });
  
  // Clear cart button
  document.querySelector('.clear-cart-btn').addEventListener('click', clearCart);
  
  // Checkout button
  document.querySelector('.checkout-btn').addEventListener('click', checkout);
  
  // View Orders button (in checkout modal)
  document.getElementById('viewOrdersBtn').addEventListener('click', function() {
    // Close checkout modal and open orders modal
    const checkoutModal = bootstrap.Modal.getInstance(document.getElementById('checkoutModal'));
    checkoutModal.hide();
    
    // Show orders modal
    const ordersModal = new bootstrap.Modal(document.getElementById('ordersModal'));
    ordersModal.show();
  });
  
  // My Profile button
  document.getElementById('myProfileBtn').addEventListener('click', function(e) {
    e.preventDefault();
    showProfileModal();
  });
  
  // My Orders button
  document.getElementById('myOrdersBtn').addEventListener('click', function(e) {
    e.preventDefault();
    showOrdersModal();
  });
  
  // Update Profile button
  document.getElementById('updateProfileBtn').addEventListener('click', updateProfile);
  
  // Logout button
  document.getElementById('logoutBtn').addEventListener('click', function(e) {
    // Redirect is handled by the link href="login.html"
    showToast('Logout', 'Successfully logged out of your account');
  });
}

// Add product to cart
function addToCart(productId) {
  // Find the product
  const product = products.find(p => p.id === productId);
  if (!product) return;
  
  // Check if product is already in cart
  const existingItem = cart.find(item => item.id === productId);
  
  if (existingItem) {
    // Increase quantity
    existingItem.quantity += 1;
  } else {
    // Add new item to cart
    cart.push({
      id: product.id,
      name: product.name,
      price: product.price,
      image: product.image,
      quantity: 1
    });
  }
  
  // Update cart display
  updateCartDisplay();
  
  // Show notification
  showToast('Added to Cart', `${product.name} has been added to your cart`);
}

// Update cart display
function updateCartDisplay() {
  const cartItemsContainer = document.querySelector('.cart-items');
  const emptyCartMessage = document.querySelector('.empty-cart-message');
  const cartTotal = document.querySelector('.cart-total');
  const cartCount = document.querySelector('.cart-count');
  const totalPrice = document.querySelector('.total-price');
  const checkoutBtn = document.querySelector('.checkout-btn');
  const clearCartBtn = document.querySelector('.clear-cart-btn');
  
  // Update cart count
  cartCount.textContent = cart.reduce((total, item) => total + item.quantity, 0);
  
  if (cart.length === 0) {
    // Cart is empty
    emptyCartMessage.classList.remove('d-none');
    cartTotal.classList.add('d-none');
    checkoutBtn.disabled = true;
    clearCartBtn.disabled = true;
    cartItemsContainer.innerHTML = '<p class="text-center empty-cart-message">Your cart is empty</p>';
  } else {
    // Cart has items
    emptyCartMessage.classList.add('d-none');
    cartTotal.classList.remove('d-none');
    checkoutBtn.disabled = false;
    clearCartBtn.disabled = false;
    
    // Calculate total price
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    totalPrice.textContent = `$${total.toFixed(2)}`;
    
    // Generate cart items HTML
    let cartHTML = '';
    cart.forEach(item => {
      cartHTML += `
        <div class="cart-item">
          <img src="${item.image}" alt="${item.name}" class="cart-item-image">
          <div class="cart-item-details">
            <p class="cart-item-name">${item.name}</p>
            <p class="cart-item-price">$${item.price.toFixed(2)} x ${item.quantity}</p>
          </div>
          <button class="cart-item-remove" data-id="${item.id}">×</button>
        </div>
      `;
    });
    
    cartItemsContainer.innerHTML = cartHTML;
    
    // Add event listeners to remove buttons
    document.querySelectorAll('.cart-item-remove').forEach(button => {
      button.addEventListener('click', function() {
        const productId = parseInt(this.getAttribute('data-id'));
        removeFromCart(productId);
      });
    });
  }
}

// Remove item from cart
function removeFromCart(productId) {
  cart = cart.filter(item => item.id !== productId);
  updateCartDisplay();
  showToast('Removed from Cart', 'Item has been removed from your cart');
}

// Clear cart
function clearCart() {
  cart = [];
  updateCartDisplay();
  showToast('Cart Cleared', 'All items have been removed from your cart');
}

// Checkout process
function checkout() {
  if (cart.length === 0) return;
  
  // Generate order number
  const orderNumber = 'ORD-' + Math.floor(Math.random() * 100000);
  
  // Calculate totals
  const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
  const tax = subtotal * 0.1; // 10% tax
  const total = subtotal + tax + 10; // Shipping cost is $10
  
  // Create new order
  const newOrder = {
    id: orderNumber,
    date: new Date(),
    items: [...cart],
    subtotal: subtotal,
    tax: tax,
    shipping: 10,
    total: total,
    status: 'Completed'
  };
  
  // Add to orders array
  orders.unshift(newOrder);
  
  // Update checkout modal with order details
  document.getElementById('orderNumber').textContent = orderNumber;
  document.getElementById('checkoutSubtotal').textContent = `$${subtotal.toFixed(2)}`;
  document.getElementById('checkoutTax').textContent = `$${tax.toFixed(2)}`;
  document.getElementById('checkoutTotal').textContent = `$${total.toFixed(2)}`;
  
  // Populate checkout items
  const checkoutItemsContainer = document.getElementById('checkoutItems');
  checkoutItemsContainer.innerHTML = '';
  
  cart.forEach(item => {
    const itemEl = document.createElement('div');
    itemEl.className = 'checkout-item';
    itemEl.innerHTML = `
      <img src="${item.image}" alt="${item.name}" class="checkout-item-image">
      <div class="flex-grow-1">
        <h6 class="mb-0">${item.name}</h6>
        <small class="text-muted">$${item.price.toFixed(2)} x ${item.quantity}</small>
      </div>
      <div class="text-end">
        <span class="fw-bold">$${(item.price * item.quantity).toFixed(2)}</span>
      </div>
    `;
    checkoutItemsContainer.appendChild(itemEl);
  });
  
  // Show checkout modal
  const checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));
  checkoutModal.show();
  
  // Clear cart after checkout
  cart = [];
  updateCartDisplay();
}

// Show profile modal
function showProfileModal() {
  // Populate form with user data
  document.getElementById('fullName').value = userProfile.fullName;
  document.getElementById('userEmail').value = userProfile.email;
  document.getElementById('phoneNumber').value = userProfile.phone;
  document.getElementById('birthDate').value = userProfile.birthDate;
  document.getElementById('address').value = userProfile.address;
  
  // Show modal
  const profileModal = new bootstrap.Modal(document.getElementById('profileModal'));
  profileModal.show();
}

// Show orders modal
function showOrdersModal() {
  const ordersListContainer = document.getElementById('ordersList');
  const noOrdersMessage = document.getElementById('noOrdersMessage');
  
  if (orders.length === 0) {
    // No orders
    noOrdersMessage.classList.remove('d-none');
    ordersListContainer.innerHTML = '';
  } else {
    // Has orders
    noOrdersMessage.classList.add('d-none');
    
    // Generate orders HTML
    let ordersHTML = '';
    orders.forEach(order => {
      // Format date
      const orderDate = new Date(order.date);
      const formattedDate = orderDate.toLocaleDateString() + ' ' + orderDate.toLocaleTimeString();
      
      ordersHTML += `
        <div class="order-item card mb-4">
          <div class="order-header card-header d-flex justify-content-between align-items-center">
            <div>
              <h6 class="mb-0">Order #${order.id}</h6>
              <small class="text-muted">${formattedDate}</small>
            </div>
            <div>
              <span class="badge bg-success">${order.status}</span>
            </div>
          </div>
          <div class="card-body p-0">
            <div class="order-products">
      `;
      
      // Add products in this order
      order.items.forEach(item => {
        ordersHTML += `
          <div class="order-product d-flex align-items-center">
            <img src="${item.image}" alt="${item.name}" class="me-3">
            <div class="flex-grow-1">
              <h6 class="mb-0">${item.name}</h6>
              <small class="text-muted">$${item.price.toFixed(2)} x ${item.quantity}</small>
            </div>
            <div class="text-end">
              <span class="fw-bold">$${(item.price * item.quantity).toFixed(2)}</span>
            </div>
          </div>
        `;
      });
      
      // Add order summary
      ordersHTML += `
            </div>
            <div class="card-footer d-flex justify-content-between align-items-center">
              <div>
                <span class="text-muted me-3">Items: ${order.items.reduce((sum, item) => sum + item.quantity, 0)}</span>
                <span class="text-muted">Subtotal: $${order.subtotal.toFixed(2)}</span>
              </div>
              <div>
                <span class="fw-bold">Total: $${order.total.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>
      `;
    });
    
    ordersListContainer.innerHTML = ordersHTML;
  }
  
  // Show modal
  const ordersModal = new bootstrap.Modal(document.getElementById('ordersModal'));
  ordersModal.show();
}

// Update profile
function updateProfile() {
  // Get values from form
  userProfile.fullName = document.getElementById('fullName').value;
  userProfile.email = document.getElementById('userEmail').value;
  userProfile.phone = document.getElementById('phoneNumber').value;
  userProfile.birthDate = document.getElementById('birthDate').value;
  userProfile.address = document.getElementById('address').value;
  
  // Update displayed user info in navbar
  const profileDropdown = document.querySelector('#profileDropdown + .dropdown-menu');
  profileDropdown.querySelector('h5').textContent = userProfile.fullName;
  profileDropdown.querySelector('p').textContent = userProfile.email;
  
  // Close modal
  const profileModal = bootstrap.Modal.getInstance(document.getElementById('profileModal'));
  profileModal.hide();
  
  // Show notification
  showToast('Profile Updated', 'Your profile has been updated successfully');
}

// Show toast notification
function showToast(title, message) {
  document.getElementById('toastTitle').textContent = title;
  document.getElementById('toastMessage').textContent = message;
  
  const toast = new bootstrap.Toast(document.getElementById('notificationToast'));
  toast.show();
}