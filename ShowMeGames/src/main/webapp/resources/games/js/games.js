const filter_dropdown = $('.filter_toggle');

var i;

for (i = 0; i < filter_dropdown.length; i++) {
    
    filter_dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display != "none") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}

const sort_dropdown = $('.sort_list_btn');
function myFunction() {
    sort_dropdown.classList.toggle("show");
  }
  
  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('.sort_list_btn')) {
      var dropdowns = $('sort_list');
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }