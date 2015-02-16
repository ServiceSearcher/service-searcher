$(function(){
  $('.delete').on('click', deleteConfirm);
  $('td').on('click', 'span.text-expand', expandText);
  $('#newCategory').hide();
  $('#service_category').on('change', toggleInput);
  $('.alert').on('change', hideAlert);
});

function deleteConfirm(e) {
  e.preventDefault;
  confirm('Are you sure you want to delete this service?')
}

function expandText() {
  var text = $(this).text()
  $(this).text(text === '...' ? '( - )' : '...')
         .prev()
         .toggleClass('hidden');
}

function renderChildRows( api, rowIdx ) {

  var data = api.cells( rowIdx, ':hidden' ).eq(0).map( function ( cell ) {
    var header = $( api.column( cell.column ).header() );
    // debugger
    return '<tr role=\'row\'>'+
             '<td>'+
               header.text()+':'+
             '</td> '+
             '<td>'+
             // write method to display expanded text...
               api.cell( cell ).data()+
             '</td>'+
           '</tr>';
  } ).toArray().join('');

  return data ?
  $('<table/>').append( data ) :
  false;
}

// New category toggle
function toggleInput() {
  var newField = $('<input type="text" id="newCategory" class="form-control" name="service[category]" placeholder="enter new category...">')
  if ($(this).val() === 'New Category...') {
    $(this).removeProp('name');
    $('#service_category').after(newField);
    // $('label[for="resource_category"]').after($newField)
  } else {
    $(this).attr('name', 'service[category]');
    $('#newCategory').remove()
  }
}

function hideAlert() {
  debugger
  setTimeout(function() { debugger; $(this).fadeOut().remove() }, 300);
}