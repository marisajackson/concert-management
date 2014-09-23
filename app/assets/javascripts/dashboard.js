(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    $('#add-concert-form').hide();
    $('#concerts-container').on('click', '#cancel-concert-form', removeConcertForm);
    $('#add-venue-form').hide();
    $('#venues-container').on('click', '#cancel-venue-form', removeVenueForm);
    $('#add-employee-form').hide();
    $('#employees-container').on('click', '#cancel-employee-form', removeEmployeeForm);
    $('#expenses').on('click', '#cancel-expense-category-form', removeExpenseCategoryForm);
    $('#expenses-container').on('click', '#cancel-expense-form', removeExpenseForm);
    $('#left-column').on('click', 'div.assign', showAssignForm);
    $('#left-column').on('click', '#cancel-assign-employee-form', hideAssignForm)
  }

  function removeConcertForm(){
    $('#add-concert-form').hide();
    $('#concerts-list').show();
  }

  function removeVenueForm(){
    $('#add-venue-form').hide();
    $('#venues-list').show();
  }

  function removeEmployeeForm(){
    $('#add-employee-form').hide();
    $('#invites-list').show();
  }

  function removeExpenseCategoryForm(){
    $('#add-expense-category-form').hide();
  }

  function removeExpenseForm(){
    $('#add-expense-form').hide();
  }

  function showAssignForm(){
    var id = $(this).attr('form-id');
    if ($(this).parents('#upcoming-concerts-list').length == 0){
      $('#concerts-list #' + id).css("display", "inline-block");
    } else {
      $('#' + id).css("display", "inline-block");
    }
  }

  function hideAssignForm(e){
    e.preventDefault();
    $(this).parents('.assign-employee-form').hide()
  }

})();