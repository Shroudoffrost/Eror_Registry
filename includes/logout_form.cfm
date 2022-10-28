<cfif structKeyExists(form,'btn-logout')>
	<cfset createObject("component",'Eror_registry.components.auth_service').do_logout()/>
	<cflocation url="index.cfm" />
</cfif>

<cfform id="Logout-form" preservedata="true">

 	<cfinput id="Btn-logout" name="btn-logout" type="submit"
 			 value="Logout"
 			 class="animated"/>

</cfform>