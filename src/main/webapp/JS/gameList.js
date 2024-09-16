function openModal() {
    document.getElementById("commentModal").style.display = "block";
    document.querySelector(".containerProducts").style.display = "none";
}

function closeModal() {
    document.getElementById("commentModal").style.display = "none";
    document.querySelector(".containerProducts").style.display = "block";
}

function submitComment() {
    const comment = document.getElementById("commentText").value;
    if (comment.trim() === "") {
        alert("Veuillez entrer un commentaire avant de soumettre.");
        return;
    }

    // Logique pour enregistrer le commentaire (par exemple, via une requête AJAX)
    console.log("Commentaire soumis:", comment);

    // Fermer le modal et réafficher la liste des produits
    closeModal();
}
