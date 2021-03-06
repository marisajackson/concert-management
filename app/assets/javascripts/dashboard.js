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
    $('#expenses-container').on('click', '#cancel-expense-form', removeExpenseForm);
    $('#incomes-container').on('click', '#cancel-income-form', removeIncomeForm);
    $('#dashboard').on('click', 'div.assign', showAssignForm);
    $('#dashboard').on('click', '#cancel-assign-employee-form', hideAssignForm);
    $('#venue-container').on('click', '#cancel-venue-edit-form', removeVenueEditForm);
    $('#concert-container').on('click', '#cancel-concert-edit-form', removeConcertEditForm);
  }

  function removeConcertEditForm(e){
    e.preventDefault();
    $('#edit-concert-form').remove();
    $('#concert-stats').show();
  }

  function removeVenueEditForm(e){
    e.preventDefault();
    $('#edit-venue-form').remove();
    $('#venue-stats').show();
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

  function removeExpenseForm(e){
    e.preventDefault();
    $('#add-expense-form').hide();
  }

  function removeIncomeForm(e){
    e.preventDefault();
    $('#add-income-form').hide();
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