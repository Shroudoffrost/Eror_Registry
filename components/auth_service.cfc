<cfcomponent output="false">

	<cffunction name="validate_user" access="public" output="false" returntype="array">
		<cfargument name="user_name"  type="string" required="true" />
		<cfargument name="password"   type="string" required="true" />

		<cfset aError_messages = arraynew(1)/>

		<cfif arguments.user_name eq ''>
			<cfset arrayAppend(aError_messages,'Provide user name')/>
		</cfif>

		<cfif arguments.password eq ''>
			<cfset arrayAppend(aError_messages,'Provide password')/>
		</cfif>

		<cfreturn aError_messages>
	</cffunction>

	<cffunction name="do_login" access="public" output="false" returntype="boolean">
		<cfargument name="user_name" type="string" required="true" />
		<cfargument name="password"  type="string" required="true" />
		<cfset var is_logged_in = false/>

		<cfquery name="qLogin_credentials">
			select *
			from t_Users
			where User_name = '#arguments.user_name#' and Password = '#arguments.password#';
		</cfquery>
		<cfif qLogin_credentials.recordCount eq 1>
			<cfdump var="#qLogin_credentials#" >
			<cflogin>
				<cfloginuser name="#qLogin_credentials.user_name#" password="#qLogin_credentials.password#" roles="user">
			</cflogin>
			<cfset session.stLoggedIn_user = {
				'user_id' 	 = qLogin_credentials.ID,
				'first_name' = qLogin_credentials.first_name,
				'last_name'  = qLogin_credentials.last_name,
				'user_name'  = qlogin_credentials.user_name,
				'password'   = qLogin_credentials.password
			}/>

			<cfset var is_logged_in = true/>
		</cfif>
		<cfreturn is_logged_in/>
	</cffunction>

	<cffunction name="do_logout" access="public" output="false" returntype="void">
		<cfset structDelete(session,'stLoggedIn_user')/>
		<cflogout />
	</cffunction>

</cfcomponent>