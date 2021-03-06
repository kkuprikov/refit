$(function()
{
    $(document).on('click', '.btn-add', function(e)
    {
      console.log('hello') 
      e.preventDefault();

      var controlForm = $('.controls form:first'),
          currentEntry = $(this).parents('.entry:first'),
          newEntry = $(currentEntry.clone()).insertAfter(currentEntry);

      newEntry.find('input').val('');
      controlForm.find('.entry:not(:last) .btn-add')
          .removeClass('btn-add').addClass('btn-remove')
          .removeClass('btn-success').addClass('btn-danger')
          .html('<i class="fa fa-minus"></i>');
    }).on('click', '.btn-remove', function(e) {
      $(this).parents('.entry:first').remove();

      e.preventDefault();
      return false;
    });
});