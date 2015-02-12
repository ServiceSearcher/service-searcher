$(function(){
  $('.delete').on('click', deleteConfirm);
  $('td').on('click', 'span.text-expand', expandText);
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