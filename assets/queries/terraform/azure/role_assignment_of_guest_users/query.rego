package Cx

import data.generic.terraform as tf_lib

CxPolicy[result] {
	role_assign := input.document[i].resource.azurerm_role_assignment[name]
	role_assign.role_definition_name == "Guest"
	
	result := {
		"documentId": input.document[i].id,
		"resourceType": "azurerm_role_assignment",
		"resourceName": tf_lib.get_resource_name(role_assign, name),
		"searchKey": sprintf("azurerm_role_assignment[%s].role_definition_name", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("azurerm_role_assignment[%s].role_definition_name not equal to 'Guest'", [name]),
		"keyActualValue": sprintf("azurerm_role_assignment[%s].role_definition_name equals to 'Guest'", [name]),
	}
}
