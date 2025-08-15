const sidebar = document.querySelector(".sidebar");
const toggleSidebar = document.querySelector(".toggler-sidebar");

toggleSidebar.addEventListener("click", () => {
  sidebar.classList.toggle("collapsed");
  toggleSidebar.classList.toggle('rotate');

  closeAllSubMenus();
});

toggleSubmenu = (button) => {
  // if (!button.nextElementSibling.classList.contains('show')) {
  //   closeAllSubMenus();
  // }

  button.nextElementSibling.classList.toggle('show');
  button.classList.toggle('rotate');

  if(sidebar.classList.contains('collapsed')){
    sidebar.classList.toggle('collapsed')
    toggleSidebar.classList.toggle('rotate')
  }
}

function closeAllSubMenus(){
  Array.from(sidebar.getElementsByClassName('show')).forEach(ul => {
    ul.classList.remove('show')
    ul.previousElementSibling.classList.remove('rotate')
  })
}

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

const toggleButtonMessage = document.getElementById('toggle-btn-message');
const chatBox = document.querySelector(".chatbox");
const closeButtonChatbox = document.getElementById('btn_close-chatbox');

toggleButtonMessage.addEventListener('click', () => {
  chatBox.classList.toggle('show');
  if (chatBox.classList.contains('show')) {
    closeButtonChatbox.addEventListener('click', () =>{
      chatBox.classList.remove('show');
    });
  }
});