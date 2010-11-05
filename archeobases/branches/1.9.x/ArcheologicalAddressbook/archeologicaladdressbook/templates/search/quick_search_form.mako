## -*- coding: utf-8 -*-
##
<%def name="quick_search_form()">
${h.form(url(controller="search", action="quick_search"))}
  <header>
  </header>
    <fieldset>
      <legend>${_("Quick search")}</legend>
      <p><label for="last_name"> ${_("Last name")}</label> ${h.text(name="last_name", maxlength=25)}<p/>
      <p><label for="first_name"> ${_("First name")}</label> ${h.text(name="first_name", maxlength=25)}<p/>
   </fieldset>
  <footer>
    <button name="search_button" type="submit"><img src="/images/magnifier.png"/>${_("Search")}</button>
  </footer>
${h.end_form()}
</%def>