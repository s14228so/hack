json.student @student, :id, :images, :nickname, :university, :grade, :department, :email


json.set! :image, rails_blob_url(@student.images[0])


