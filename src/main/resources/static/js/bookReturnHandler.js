/**
 * 
 */
// history-del-btn
$(document).ready(function() {
	
    $('.history-del-btn').click(function() {

        var historyId = $(this).attr('history-id');
   
        
        $.ajax({
            url: window.location.origin + '/userBookHistory?historyId='+historyId,
            type: 'PATCH',
            contentType: 'application/json',
            success: function(response) {
                alert(response);
                location.reload()
            },
            error: function(xhr, status, error) {
                alert(xhr.responseText)
            }
        });
    });
});