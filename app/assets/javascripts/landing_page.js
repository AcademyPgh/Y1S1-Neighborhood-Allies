/* Set the width of the side navigation to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "200px";
}
/* Set the width of the side navigation to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

<!--this function disables continue button on terms and conditions page until agree check box is checked"-->
$('#readAndAgree').change( function ()
{
  if (this.checked)
  {
    $('#agreeContinue').prop("disabled",false);
  }
  else
  {
    $('#agreeContinue').prop("disabled",true);
  }
});


function showTerms()
{
  $("#termsModal").modal("show")
  $("#loginModal").modal("hide")
}

function showNewUser()
{
  $("#newUserModal").modal("show")
  $("#termsModal").modal("hide")
}

function showConfirmation()
{
  $("#confirmationModal").modal("show")
  $("#newUserModal").modal("hide")
}

function backToLogin()
{
  $("#loginModal").modal("show")
  $("#confirmationModal").modal("hide")
}

function showRecovery()
{
  $("#recoveryModal").modal("show")
  $("#loginModal").modal("hide")
}

function showRecoveryConfirmation()
{
  $("#recoveryConfirmModal").modal("show")
  $("#recoveryModal").modal("hide")
}

function backToLoginFromRecov()
{
  $("#loginModal").modal("show")
  $("#recoveryConfirmModal").modal("hide")
}
$('#fpop').hide();
function popupfinancial (){
  console.log("test");
  //console.log($('#button1').checked);
  if ($('#button1').is(':checked'))
  {
    $('#fpop').show();
  }
  else
  {
    $('#fpop').hide();
  }
}

$('#kpop').hide();
function popupkind (){
  console.log("test");
  //console.log($('#button1').checked);
  if ($('#button2').is(':checked'))
  {
    $('#kpop').show();
  }
  else
  {
    $('#kpop').hide();
  }
}

$('#npop').hide();
function popupnetwork (){
  console.log("test");
  //console.log($('#button1').checked);
  if ($('#button3').is(':checked'))
  {
    $('#npop').show();
  }
  else
  {
    $('#npop').hide();
  }
}

$('#apop').hide();
function popupall (){
  console.log("test");
  //console.log($('#button1').checked);
  if ($('#button4').is(':checked'))
  {
    $('#apop').show();
  }
  else
  {
    $('#apop').hide();
  }
}
