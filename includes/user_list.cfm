<cfquery name="qUser_list">
	select ID, First_name, Last_name, user_name
	from t_users;
</cfquery>

<div>
	<cfoutput >
	<table id="User-list">
	    <tr class="user-list-headers">
	      	<th class="t-cell col-user-id user-data">	ID</th>
	    	<th class="t-cell col-first-name user-data">first name</th>
	    	<th class="t-cell col-last-name user-data"> last name</th>
	    	<th class="t-cell col-user-name user-data"> user name</th>
	    </tr>
    	<cfloop query="qUser_list">
    		<tr>
				<th class="t-cell col-user-id user-data">	#ID#</th>
		    	<th class="t-cell col-first-name user-data">#first_name#</th>
		    	<th class="t-cell col-last-name user-data"> #last_name#</th>
		    	<th class="t-cell col-user-name user-data"> #user_name#</th>
			</tr>
		</cfloop>
		</table>
    </cfoutput>
</div>