<cfif isDefined('url.allErrors')>
	<table class="tbl-headers-left">
	    <tr class="tbl-headers-left">
	      	<th class="t-cell col-id">ID</th>
	    	<th class="t-cell col-date">Registered</th>
	    	<th class="t-cell col-short-desc">Brief</th>
	    	<th class="t-cell col-full-desc">Full description</th>
		</tr>
	</table>
		
	<table class="tbl-headers-right">
	    <tr class="tbl-headers-right">
	      	<th class="t-cell col-author">Edited</th>
	    	<th class="t-cell col-status">Status</th>
	    	<th class="t-cell col-urgency">Urgency</th>
	    	<th class="t-cell col-criticality">Criticality</th>
	    </tr>
	</table>

    <cfquery name="qError_list_full">
		select er.ID, er.Date_registered, er.Short_comment, er.Full_description,
				us.User_name, us.ID as User_id,
				st.Status, ur.Urgency, cr.Criticality
		from t_Errors er
		inner join t_Users us		 on er.Registered_by = us.ID
		inner join t_Status st		 on er.Status = st.CODE
		inner join t_Urgency ur		 on er.Urgency = ur.CODE
		inner join t_Criticality cr on er.Criticality = cr.CODE;
	</cfquery>
	<cfoutput >
    	<table class="main-table">
    	<cfloop query="qError_list_full">
    		<tr>
				<th class="t-cell col-id">		   <a href="workspace.cfm?id=#ID#">#qError_list_full.ID#</a></th>
		    	<th class="t-cell col-date">	   <a href="workspace.cfm?date=#dateformat(date_registered, 'mmm dd yyyy')#">#dateformat(date_registered, 'mmm dd yyyy')#</a></th>
		    	<th class="t-cell col-short-desc"> <a href="workspace.cfm?id=#ID#">#short_comment#</a></th>
		    	<th class="t-cell col-full-desc">  <a href="workspace.cfm?id=#ID#">#full_description#</a></th>
		    	<th class="t-cell col-author">	   <a href="workspace.cfm?by=#user_id#">#user_name#</a></th>
		    	<th class="t-cell col-status">	   <a href="workspace.cfm?status=#status#">#status#</a></th>
		    	<th class="t-cell col-urgency">	   <a href="workspace.cfm?urgency=#urgency#">#urgency#</a></th>
		    	<th class="t-cell col-criticality"><a href="workspace.cfm?criticality=#criticality#">#Criticality#</a></th>
			</tr>
		</cfloop>
		</table>
    </cfoutput>
<cfelseif isDefined('url.id')>
	<cfquery name="qSingle_error">
		select er.ID, er.Date_registered, er.Short_comment, er.Full_description,
				us.User_name, us.ID as user_id,
				st.Status,
				ur.Urgency,
				cr.Criticality
		from t_Errors er
		inner join t_Users us		 on er.Registered_by = us.ID
		inner join t_Status st		 on er.Status = st.CODE
		inner join t_Urgency ur		 on er.Urgency = ur.CODE
		inner join t_Criticality cr on er.Criticality = cr.CODE
		where er.ID = #url.id#;
	</cfquery>
	<cfdump var="#qSingle_error#" >
	
	
<cfelseif isDefined('url.by')>
	<table class="tbl-headers-left">
	    <tr class="tbl-headers-left">
	      	<th class="t-cell col-id">ID</th>
	    	<th class="t-cell col-date">Registered</th>
	    	<th class="t-cell col-short-desc">Brief</th>
	    	<th class="t-cell col-full-desc">Full description</th>
		</tr>
	</table>
		
	<table class="tbl-headers-right">
	    <tr class="tbl-headers-right">
	      	<th class="t-cell col-author">Edited</th>
	    	<th class="t-cell col-status">Status</th>
	    	<th class="t-cell col-urgency">Urgency</th>
	    	<th class="t-cell col-criticality">Criticality</th>
	    </tr>
	</table>
	<cfquery name="qError_list_by_user">
		select er.ID, er.Date_registered, er.Short_comment, er.Full_description,
				us.User_name, us.ID as user_id,
				st.Status,
				ur.Urgency,
				cr.Criticality
		from t_Errors er
		inner join t_Users us		 on er.Registered_by = us.ID
		inner join t_Status st		 on er.Status = st.CODE
		inner join t_Urgency ur		 on er.Urgency = ur.CODE
		inner join t_Criticality cr on er.Criticality = cr.CODE
		where us.ID = #url.by#
		order by Date_registered desc;
	</cfquery>
	<cfoutput >		
		<table class="main-table">
			<cfloop query="qError_list_by_user">
			<tr>
				<th class="t-cell col-id">		   <a href="workspace.cfm?id=#ID#">#ID#</a></th>
		    	<th class="t-cell col-date">	   <a href="workspace.cfm?date=#dateformat(date_registered, 'mmm dd yyyy')#">#dateformat(date_registered, 'mmm dd yyyy')#</a></th>
		    	<th class="t-cell col-short-desc"> <a href="workspace.cfm?id=#ID#">#short_comment#</a></th>
		    	<th class="t-cell col-full-desc">  <a href="workspace.cfm?id=#ID#">#full_description#</a></th>
		    	<th class="t-cell col-author">	   <a href="workspace.cfm?by=#user_id#">#user_name#</a></th>
		    	<th class="t-cell col-status">	   <a href="workspace.cfm?status=#status#">#status#</a></th>
		    	<th class="t-cell col-urgency">	   <a href="workspace.cfm?urgency=#urgency#">#urgency#</a></th>
		    	<th class="t-cell col-criticality"><a href="workspace.cfm?criticality=#criticality#">#Criticality#</a></th>
			</tr>
			</cfloop>
		</table>
	</cfoutput>
<cfelseif isDefined('url.editProfile')>
	<cfinclude template="profile_editor.cfm" >
</cfif>