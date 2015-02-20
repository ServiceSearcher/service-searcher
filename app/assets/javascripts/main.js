$(function(){
  $('td').on('click', 'span.text-expand', expandText);
  $('#newCategory').hide();
  $('#service_category').on('change', toggleInput);
  $(".alert").delay(4000).slideUp(200, hideAlert);
}); 

function hideAlert() {
  $(this).alert('close');
}

function expandText() {
  var text = $(this).text()
  $(this).text(text === '...' ? '( - )' : '...')
         .prev()
         .toggleClass('hidden');
}

// New category toggle
function toggleInput() {
  var newField = $('<input type="text" id="newCategory" class="form-control" name="service[category]" placeholder="enter new category...">')
  if ($(this).val() === 'New Category...') {
    $(this).removeProp('name');
    $('#service_category').after(newField);
  } else {
    $(this).attr('name', 'service[category]');
    $('#newCategory').remove()
  }
}















// function renderChildRows( api, rowIdx ) {

//   var data = api.cells( rowIdx, ':hidden' ).eq(0).map( function ( cell ) {
//     var header = $( api.column( cell.column ).header() );
//     return '<tr role=\'row\'>'+
//              '<td>'+
//                header.text()+':'+
//              '</td> '+
//              '<td>'+
//              // write method to display expanded text...
//                api.cell( cell ).data()+
//              '</td>'+
//            '</tr>';
//   } ).toArray().join('');

//   return data ?
//   $('<table/>').append( data ) :
//   false;
// }