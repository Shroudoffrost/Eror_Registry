<cfset is_changed = false/>
<cfif structKeyExists(form,"btn-save")>
	<cfset error_messages = arraynew(1)/>

	<cfif form.first_name eq ''>
		<cfset arrayappend(error_messages,'Invalid first name provided')/>
	</cfif>

	<cfif form.last_name eq ''>
		<cfset arrayappend(error_messages,'Invalid last name provided')/>
	</cfif>

	<cfif form.user_name eq ''>
		<cfset arrayappend(error_messages,'Invalid user name provided')/>
	</cfif>

	<cfif form.password eq ''>
		<cfset arrayappend(error_messages,'Invalid password provided')/>
	</cfif>

	<cfif form.password_confirm eq ''>
		<cfset arrayappend(error_messages,'Confirm your password')/>
	</cfif>

	<cfif form.password neq form.password_confirm>
		<cfset arrayappend(error_messages,'Passwords do not match')/>
	</cfif>

	<cfif arrayisempty(error_messages)>
		<cfquery>
			update t_Users
			set user_name  = '#form.user_name#',
				first_name = '#form.first_name#',
				last_name  = '#form.last_name#',
				password   = '#form.password#'
			where ID = #session.stLoggedIn_user.user_id#;
		</cfquery>
		<cfset is_changed = true/>
	</cfif>
</cfif>

<cfquery name='currentUser_credentials'>
	select *
	from t_Users
	where ID = #session.stLoggedIn_user.user_id#;
</cfquery>

<div id="Profile-editor">
	<cfif is_changed>
		<h1 id="Success-message">SAVED</h1>

	<cfelse>
		<!---<cfif isDefined(error_messages) and not arrayisEmpty(error_messages)>
			<cfoutput>
				<cfloop array="error_messages" item="message">
					<h1>#message#</h1>
				</cfloop>
			</cfoutput>
		</cfif>--->
		<cfform id="Profile-editor-form">

			<cfinput name="first_name" value="#session.stLoggedIn_user.first_name#"
		             required="true" validateAt="onSubmit"
		             message="Invalid first name"
		             class="profile-editor-field"/>

			<cfinput name="last_name" value="#session.stLoggedIn_user.last_name#"
					 required="true" validateAt="onSubmit"
					 message="Invalid last name"
					 class="profile-editor-field"/>

			<cfinput name="user_name" value="#session.stLoggedIn_user.user_name#"
		             required="true" validateAt="onSubmit"
		             message="Invalid user name"
		             class="profile-editor-field"/>

			<cfinput type="password" name="password" <!---value="#session.stLoggedIn_user.password#"--->
					 placeholder="#session.stLoggedIn_user.password#"
					 required="true" validateAt="onSubmit"
					 message="Invalid password"
					 class="profile-editor-field"/>

			<cfinput type="password" name="password_confirm" placeholder="confirm password"
					 required="true" validateAt="onSubmit"
					 message="passwords do not match"
					 class="profile-editor-field"/>

		 	<cfinput type="submit" name="btn-save" value="save" id="Btn-save"/>

		</cfform>
	</cfif>
</div>