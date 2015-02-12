$(function(){
  $('.delete').on('click', deleteConfirm);
  $('.text-expand').on('click', expandText);
  console.log('-_-')
});


function deleteConfirm(e) {
  e.preventDefault;
  confirm('Are you sure you want to delete this service?')
}

function expandText(e) {
  $(this).addClass('hidden').next().removeClass('hidden')
}