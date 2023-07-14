document.querySelector("#customer-dl").style.display = "none";

var customerDlVisible = false; 

document.querySelector("a[href='']").addEventListener("click", function (event) {
    event.preventDefault();
    
    if (customerDlVisible) { 
        document.querySelector("#customer-dl").style.display = "none";
        customerDlVisible = false;
    } else {
        document.querySelector("#customer-dl").style.display = "block";
        customerDlVisible = true;
    }
});

