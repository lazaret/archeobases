id = ${c.record.id} </br>
file_path = ${c.record.file_path} </br>
thumb_path = ${c.record.thumb_path} </br>
description = ${c.record.description} </br>
</br>
</br>
thumb : ${h.image("../../uploads/"+c.record.thumb_path, "thumb")}</br></br></br>
file : ${h.image("../../uploads/"+c.record.image_path, "image")}</br></br></br>
