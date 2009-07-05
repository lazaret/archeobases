${h.form(h.url_for(action="save_image"), multipart=True)}
Upload file: ${h.file("image")} <br />
File description: ${h.text("description")} <br />
${h.submit("Submit", "Submit")}
${h.end_form()}
