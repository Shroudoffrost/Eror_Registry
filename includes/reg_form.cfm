<cfif structkeyExists(form,'btn-create')>
	<cflocation url="test_page.cfm">
</cfif>

<div id="Profile-editor">
	<cfform id="Profile-editor-form">

		<cfinput name="first_name" placeholder="first name"
	             required="true" validateAt="onSubmit"
	             message="Invalid first name"
	             class="profile-editor-field"/>

		<cfinput name="last_name" placeholder="last name"
				 required="true" validateAt="onSubmit"
				 message="Invalid last name"
				 class="profile-editor-field"/>

		<cfinput name="user_name" placeholder="user name"
	             required="true" validateAt="onSubmit"
	             message="Invalid user name"
	             class="profile-editor-field"/>

		<cfinput type="password" name="password"
				 placeholder="password"
				 required="true" validateAt="onSubmit"
				 message="Invalid password"
				 class="profile-editor-field"/>

		<cfinput type="password" name="password_confirm" placeholder="confirm password"
				 required="true" validateAt="onSubmit"
				 message="passwords do not match"
				 class="profile-editor-field"/>

	 	<cfinput type="submit" name="btn-create" value="create" id="Btn-save"/>

	</cfform>
</div>