(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    $('#add-concert-form').hide();
    $('#concerts-container').on('click', '.cancel-concert-form', removeConcertForm);
    $('#add-venue-form').hide();
    $('#venues-container').on('click', '.cancel-venue-form', removeVenueForm);
    $('#add-employee-form').hide();
    $('#employees-container').on('click', '.cancel-employee-form', removeEmployeeForm);
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

})();