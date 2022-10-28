<cfcomponent output="false">
	<cfset this.name = 'Error_registry' />
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />
	<cfset this.datasource = 'error_registry' />
	<cfset this.sessionManagement = true/>
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />
	
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfreturn true/>
	</cffunction>
	
	<cffunction name="onRequestStart" returntype="boolean">
		<cfset this.onApplicationStart()/>
		<cfreturn true/>
	</cffunction>
</cfcomponent>