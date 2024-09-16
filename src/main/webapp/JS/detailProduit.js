function changeImage(src, isVideo = false) {
    const mainImageContainer = document.querySelector('.main-image-zoom');
    
    if (isVideo) {
      // Si c'est une vidéo, remplace l'image par la vidéo
      mainImageContainer.innerHTML = `<video id="main-video" src="${src}" controls autoplay style="width: 100%; height: 100%;"></video>`;
    } else {
      // Sinon, remplace par l'image avec le zoom
      mainImageContainer.innerHTML = `<img id="main-image" src="${src}" alt="Image principale" style="width: 100%; height: 100%; object-fit: cover; cursor: zoom-in;">`;
      const mainImage = document.getElementById('main-image');
      mainImage.addEventListener('mousemove', zoomImage);
      mainImage.addEventListener('mouseleave', resetZoom);
    }
  }
  
  function zoomImage(event) {
    const mainImage = event.target;
    const rect = mainImage.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    const xPercent = (x / rect.width) * 100;
    const yPercent = (y / rect.height) * 100;
    
    mainImage.style.transformOrigin = `${xPercent}% ${yPercent}%`;
    mainImage.style.transform = "scale(2)";
  }
  
  function resetZoom(event) {
    const mainImage = event.target;
    mainImage.style.transform = "scale(1)";
    mainImage.style.transformOrigin = "center center";
  }
  
  function increaseQuantity() {
    const quantityElement = document.getElementById('quantity');
    let quantity = parseInt(quantityElement.textContent, 10);
    quantity++;
    quantityElement.textContent = quantity;
  }
  
  function decreaseQuantity() {
    const quantityElement = document.getElementById('quantity');
    let quantity = parseInt(quantityElement.textContent, 10);
    if (quantity > 1) {
      quantity--;
      quantityElement.textContent = quantity;
    }
  }
  

  
 
  
  