/**
 * 
 */
 
$(document).ready(function() 
{ 
	if ($("#alertSuccess").text().trim() == "") 
	 { 
	 	$("#alertSuccess").hide(); 
	 } 
	 $("#alertError").hide(); 
}); 


// SAVE ============================================
	$(document).on("click", "#btnSave", function(event) 
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
 
// Form validation-------------------
var status = validateItemForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
 
 
 
// If valid------------------------
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
	 url : "EmployeesAPI", 
	 type : type, 
	 data : $("#formItem").serialize(), 
	 dataType : "text", 
	 
 complete : function(response, status) 
 { 
 	onItemSaveComplete(response.responseText, status); 
 } 
 }); 
});


function onItemSaveComplete(response, status) 
{ 
if (status == "success") 
 { 
	 var resultSet = JSON.parse(response); 
	 if (resultSet.status.trim() == "success") 
 { 
	 $("#alertSuccess").text("Successfully saved."); 
	 $("#alertSuccess").show(); 
	 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
	 $("#alertError").text(resultSet.data); 
	 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
	 $("#alertError").text("Error while saving."); 
	 $("#alertError").show(); 
 } else
 { 
	 $("#alertError").text("Unknown error while saving.."); 
	 $("#alertError").show(); 
 } 
 
	 $("#hidItemIDSave").val(""); 
	 $("#formItem")[0].reset(); 
}



// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val()); 
 $("#employeeName").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#employeeEmail").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#employeeAge").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#employeePassword").val($(this).closest("tr").find('td:eq(4)').text()); 
 $("#employeePhone").val($(this).closest("tr").find('td:eq(5)').text()); 
 $("#nicNumber").val($(this).closest("tr").find('td:eq(6)').text()); 
 $("#employeeGender").val($(this).closest("tr").find('td:eq(7)').text()); 
 $("#employeeAddress").val($(this).closest("tr").find('td:eq(8)').text()); 
}); 


// CLIENT-MODEL================================================================
	function validateItemForm() 
	{ 
		// Employee Name
		if ($("#employeeName").val().trim() == "") 
 		{ 
			 return "Insert Employee Name."; 
 		} 
		// Employee Email
			if ($("#employeeEmail").val().trim() == "") 
			 { 
 				return "Insert Employee Email."; 
 			} 
 
 
 
// Employee Age
		if ($("#employeeAge").val().trim() == "") 
 		{ 
 			return "Insert Employee Age."; 
		 } 
		// is numerical value
		var tmpAge = $("#employeeAge").val().trim(); 
		if (!$.isNumeric(tmpAge)) 
 		{ 
 			return "Insert a numerical value for Age."; 
 		} 
		// convert to decimal price
 		//$("#itemPrice").val(parseFloat(tmpAge).toFixed(2)); 
 		
//Employee password
		if ($("#employeePassword").val().trim() == "") 
 		{ 
 			return "Insert Employee Password."; 
 		} 
	
	
	//Employee Phone
	if ($("#employeePhone").val().trim() == "") 
 		{ 
 			return "Insert Employee phone number."; 
 		} 
 	
 	//Employee nic	
 	if ($("#nicNumber").val().trim() == "") 
 		{ 
 			return "Insert Employee NICr."; 
 		} 	
 		
 		//Employee Gender	
 	if ($("#employeeGender").val().trim() == "") 
 		{ 
 			return "Insert Employee Gender."; 
 		} 
 		
 	//Employee Address
 	if ($("#employeeAddress").val().trim() == "") 
 		{ 
 			return "Insert Employee NICr."; 
 		} 	
 		
		return true; 
		
	}
	

//DELETE
$(document).on("click", ".btnRemove", function(event) 
{ 
 $.ajax( 
 { 
 url : "EmployeesAPI", 
 type : "DELETE", 
 data : "employeeNumber=" + $(this).data("employeenumber"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemDeleteComplete(response.responseText, status); 
 } 
 }); 
});


function onItemDeleteComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
 }