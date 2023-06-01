{
	"contents": {
		"397c553a-6700-4f7f-bc2f-c504dfd1f018": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "ats.emp.employeeonboarding",
			"subject": "EmployeeOnboarding",
			"name": "EmployeeOnboarding",
			"documentation": "Employee onboarding",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"c5400ec2-c396-4d08-a72e-2d8fe5aa2b71": {
					"name": "EmployeeData"
				},
				"906ed24c-04eb-4a4e-a3f6-0023c072a94b": {
					"name": "PostEmployeeS4"
				},
				"a3ba14ab-6c9f-4ddc-bfef-64a4bbde33cf": {
					"name": "DetermineCardType"
				},
				"82e9c743-4237-4015-84c3-b973ffca7f6a": {
					"name": "MapEmpBandToRule"
				},
				"a9092dd4-26ac-4482-b760-4a10ffd917b0": {
					"name": "SendEmailCard"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"3f8bcc1a-f419-4137-ba01-a4541c2b9f6a": {
					"name": "SequenceFlow2"
				},
				"158a15b1-b09a-4509-b72c-3cf2e4e41c6b": {
					"name": "SequenceFlow3"
				},
				"3b04afe1-6f47-4443-9d09-467b843c3d2e": {
					"name": "SequenceFlow4"
				},
				"66a9b3a1-e853-4717-af3e-4ce432882013": {
					"name": "SequenceFlow5"
				},
				"692e2cbc-7e4a-4e97-98a6-5700fe05aecc": {
					"name": "SequenceFlow6"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"4815e206-c4fd-4c0a-a675-da3d656b6f59": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"c5400ec2-c396-4d08-a72e-2d8fe5aa2b71": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "EmployeeData",
			"description": "On-boarding",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "$(info.startedBy)",
			"formReference": "/forms/EmployeeOnboarding/EmployeeOnboad.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "employeeonboad"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "EmployeeData"
		},
		"906ed24c-04eb-4a4e-a3f6-0023c072a94b": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANA",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/EmpWorkflowSet",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/$metadata",
			"requestVariable": "${context.employeeData}",
			"responseVariable": "${context.resultEmployee}",
			"id": "servicetask1",
			"name": "PostEmployeeS4",
			"documentation": "send employee data to S/4 HANA"
		},
		"a3ba14ab-6c9f-4ddc-bfef-64a4bbde33cf": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"destinationSource": "consumer",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.businessRule}",
			"responseVariable": "${context.resultBusinessRule}",
			"id": "servicetask2",
			"name": "DetermineCardType",
			"documentation": "Find Card type depends on employee band"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "c5400ec2-c396-4d08-a72e-2d8fe5aa2b71"
		},
		"3f8bcc1a-f419-4137-ba01-a4541c2b9f6a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "c5400ec2-c396-4d08-a72e-2d8fe5aa2b71",
			"targetRef": "906ed24c-04eb-4a4e-a3f6-0023c072a94b"
		},
		"158a15b1-b09a-4509-b72c-3cf2e4e41c6b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "906ed24c-04eb-4a4e-a3f6-0023c072a94b",
			"targetRef": "82e9c743-4237-4015-84c3-b973ffca7f6a"
		},
		"3b04afe1-6f47-4443-9d09-467b843c3d2e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "a3ba14ab-6c9f-4ddc-bfef-64a4bbde33cf",
			"targetRef": "a9092dd4-26ac-4482-b760-4a10ffd917b0"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"a702cac6-2120-4bf4-a727-4dc113862db3": {},
				"49ca7f8c-09ee-475f-98dc-55b0570ebce5": {},
				"89be78b3-797b-439d-8851-cedbe53dc499": {},
				"f2544620-a082-4c6d-a608-57dd3424d2bb": {},
				"85c378ff-4383-4bb5-be96-ab3ba14328cc": {},
				"f7bffaaf-54d2-484a-a588-12fbe6c07447": {},
				"526fb6d7-52a8-4738-899a-7a96675b3de3": {},
				"74b4466f-e069-4e27-a57e-e79ece9a77c1": {},
				"a4b4154f-e02c-46d4-b0f7-83ff359dc968": {},
				"63a126e9-dede-4b4f-baff-fae27e462ca3": {}
			}
		},
		"4815e206-c4fd-4c0a-a675-da3d656b6f59": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/EmployeeOnboarding/employeeBoarding.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 46,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 44.5,
			"y": 644,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,44 62,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "a702cac6-2120-4bf4-a727-4dc113862db3",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"a702cac6-2120-4bf4-a727-4dc113862db3": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 12,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "c5400ec2-c396-4d08-a72e-2d8fe5aa2b71"
		},
		"49ca7f8c-09ee-475f-98dc-55b0570ebce5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,154 62,204",
			"sourceSymbol": "a702cac6-2120-4bf4-a727-4dc113862db3",
			"targetSymbol": "89be78b3-797b-439d-8851-cedbe53dc499",
			"object": "3f8bcc1a-f419-4137-ba01-a4541c2b9f6a"
		},
		"89be78b3-797b-439d-8851-cedbe53dc499": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "906ed24c-04eb-4a4e-a3f6-0023c072a94b"
		},
		"f2544620-a082-4c6d-a608-57dd3424d2bb": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,264 62,314",
			"sourceSymbol": "89be78b3-797b-439d-8851-cedbe53dc499",
			"targetSymbol": "526fb6d7-52a8-4738-899a-7a96675b3de3",
			"object": "158a15b1-b09a-4509-b72c-3cf2e4e41c6b"
		},
		"85c378ff-4383-4bb5-be96-ab3ba14328cc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 424,
			"width": 100,
			"height": 60,
			"object": "a3ba14ab-6c9f-4ddc-bfef-64a4bbde33cf"
		},
		"f7bffaaf-54d2-484a-a588-12fbe6c07447": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,484 62,534",
			"sourceSymbol": "85c378ff-4383-4bb5-be96-ab3ba14328cc",
			"targetSymbol": "a4b4154f-e02c-46d4-b0f7-83ff359dc968",
			"object": "3b04afe1-6f47-4443-9d09-467b843c3d2e"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 1,
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 2,
			"scripttask": 1,
			"mailtask": 1
		},
		"82e9c743-4237-4015-84c3-b973ffca7f6a": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/EmployeeOnboarding/mapping.js",
			"id": "scripttask1",
			"name": "MapEmpBandToRule"
		},
		"526fb6d7-52a8-4738-899a-7a96675b3de3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 12,
			"y": 314,
			"width": 100,
			"height": 60,
			"object": "82e9c743-4237-4015-84c3-b973ffca7f6a"
		},
		"66a9b3a1-e853-4717-af3e-4ce432882013": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "82e9c743-4237-4015-84c3-b973ffca7f6a",
			"targetRef": "a3ba14ab-6c9f-4ddc-bfef-64a4bbde33cf"
		},
		"74b4466f-e069-4e27-a57e-e79ece9a77c1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,374 62,424",
			"sourceSymbol": "526fb6d7-52a8-4738-899a-7a96675b3de3",
			"targetSymbol": "85c378ff-4383-4bb5-be96-ab3ba14328cc",
			"object": "66a9b3a1-e853-4717-af3e-4ce432882013"
		},
		"a9092dd4-26ac-4482-b760-4a10ffd917b0": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "SendEmailCard",
			"mailDefinitionRef": "29579d0f-b007-4b03-8da5-7144a7fb20d3"
		},
		"a4b4154f-e02c-46d4-b0f7-83ff359dc968": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 12,
			"y": 534,
			"width": 100,
			"height": 60,
			"object": "a9092dd4-26ac-4482-b760-4a10ffd917b0"
		},
		"692e2cbc-7e4a-4e97-98a6-5700fe05aecc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "a9092dd4-26ac-4482-b760-4a10ffd917b0",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"63a126e9-dede-4b4f-baff-fae27e462ca3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,594 62,644",
			"sourceSymbol": "a4b4154f-e02c-46d4-b0f7-83ff359dc968",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "692e2cbc-7e4a-4e97-98a6-5700fe05aecc"
		},
		"29579d0f-b007-4b03-8da5-7144a7fb20d3": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "reddibattulajahnavi@gmail.com",
			"subject": "Employee ${context.employeeData.Empname} was onboarded",
			"text": "Dear  ${context.employeeData.Empname},\nCongratulations for your new Job!\n\nA new Credit card of category ${context.resultBusinessRule.Result[0].CardType} was issued to you\n\nRegards,\nSAP BTP Workflow.",
			"id": "maildefinition1"
		}
	}
}