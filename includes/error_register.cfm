<cfquery datasource="error_registry" name="qUrgency">
	select *
	from t_Urgency;
</cfquery>
<cfquery datasource="error_registry" name="qCriticality">
	select *
	from t_Criticality;
</cfquery>

<cfif structKeyExists(form,'btn-register')>
	<cfset error_messages = arraynew(1)/>

	<cfif form.comment eq ''>
		<cfset arrayappend(error_messages,'Comment is required')/>
	</cfif>
	<cfif arrayisEmpty(error_messages)>
		<cfquery>
			insert into t_Errors (
				ID,
				Date_registered,
				Short_comment,
				Full_description,
				Registered_by,
				Status,
				Urgency,
				Criticality
			)
			values (
				(select top 1 id+1 from t_Errors order by ID desc),
				CURRENT_TIMESTAMP,
				'#form.comment#',
				'#form.full_description#',
				#session.stLoggedIn_user.user_id#,
				1,
				#form.urgency#,
				#form.criticality#
			);
			insert into t_Error_history (
				ID,
				Date_edited,
				Action,
				Comment,
				By_user
			)
			values (
				(select top 1 id
				from t_Errors order by ID desc),
				(select date_edited from t_errors where id = (select top 1 id
				from t_Errors order by ID desc)),
				'Registered',
				(select short_comment from t_errors where id = (select top 1 id
				from t_Errors order by ID desc)),
				(select registered_by from t_errors where id = (select top 1 id
				from t_Errors order by ID desc))
			);
		</cfquery>
	</cfif>

</cfif>

<html>
	<head>
		<title>Editor</title>
		<link href="css/error_register.css" rel="stylesheet" type="text/css" media="screen" />
	</head>
	<body>
		<div id="Error-register">
			<cfform>
				<cfselect id="Urgency-field" name="urgency"
						  query="qUrgency" value="code" display="urgency" queryposition="below">
					<option value="0">Supply urgency level</option>
				</cfselect>

				<cfselect id="Criticality-field" name="criticality"
						  query="qCriticality" value="code" display="criticality" queryposition="below">
					<option value="0">Supply criticality level</option>
				</cfselect>

				<cftextarea id="Comment-field" name="comment" placeholder="comment"
						 	required="true" validateAt="onSubmit" message="Comment is required">
				</cftextarea>

				<cftextarea id="Full-description-field" name="full_description"
							placeholder="full description" richtext="true" toolbar="Basic">
				</cftextarea>

				<cfinput id="Btn-register" name="btn-register" type="submit" value="Register error">
			</cfform>
		</div>
	</body>
</html>