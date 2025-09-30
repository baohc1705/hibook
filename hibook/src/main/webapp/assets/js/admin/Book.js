function toggleDropdown(button) {
   const dropdown = button.nextElementSibling; // lấy phần tử ngay sau button
   dropdown.classList.toggle("hidden");
 }