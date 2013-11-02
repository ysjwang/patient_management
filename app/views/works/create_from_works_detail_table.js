
// $('#flash-area').html("<%= j(render partial: 'shared/flash_messages') %>");
//alert("HELLO");
//$("#table-new-work-form")[0].reset(); // clears the form
$("#works-detail-table").html("<%= escape_javascript( render(:partial => "works/works_detail_table", :locals => {works: @works, new_work: @new_work}) ) %>").fadeIn('slow');
