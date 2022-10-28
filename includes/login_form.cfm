<cfif structkeyExists(form,'Btn-submit')>
	<cfset auth_service = createobject("component",'Eror_Registry.components.auth_service')/>
	<cfset aError_messages = auth_service.validate_user(form.user_name, form.password) />
	<cfif arrayisEmpty(aerror_messages)>
		<cfset is_logged_in = auth_service.do_login(form.user_name, form.password) />
		<cfif is_logged_in>
			<cflocation url="workspace.cfm" >
		</cfif>
	</cfif>
</cfif>

<cfform id="Login-form-block" preservedata="true">
	<cfinput name="user_name" type="text" id="User_name" placeholder="user name"
             required="true" validateAt="onSubmit"
             message="Invalid user Name"
             class="form-field animated"/>

	<cfinput type="password" name="password" id="Password" placeholder="password"
			 required="true" validateAt="onSubmit"
			 message="Invalid password"
			 class="form-field animated"/>

 	<cfinput name="btn-submit" type="submit" id="Btn-submit"
 			 value="Login"
 			 class="animated"/>

</cfform>