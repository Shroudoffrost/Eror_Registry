<cfif structKeyexists(session,'stLoggedIn_user')>
	<div id="Header">
		<div id="Logo-block">
			<a href="index.cfm"><h1 id="Logo">>Error Registry</h1></a>
			<h5 id="Status-message"><cfoutput>Welcome, #session.stLoggedIn_user.user_name#<</cfoutput></h5>
		</div>
		<cfinclude template="logout_form.cfm" />
	</div>
<cfelse>
	<div id="Header">
		<div id="Logo-block">
			<a href="index.cfm"><h1 id="Logo">>Error Registry</h1></a>
			<h5 id="Status-message"><cfoutput>Log in to see the full list<</cfoutput></h5>
		</div>
		<cfinclude template="login_form.cfm" />
	</div>
	<h1 id="Login-fail-message">SYSTEM FAILURE</h1>
</cfif>