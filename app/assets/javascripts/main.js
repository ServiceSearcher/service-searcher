$(function(){
  $('.delete').on('click', deleteConfirm);
});


function deleteConfirm(e) {
  e.preventDefault;
  alert('Are you sure you want to delete this service?')
}