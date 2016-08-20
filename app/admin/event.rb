ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# more docs for admin of automated events and their admin
# https://lorefnon.me/2016/03/31/database-driven-scheduling-with-clockwork-and-activejob.html

permit_params :name, :job_name, :job_arguments, :frequency, :at

form do |f|
    f.inputs do
      f.input :name
      f.input :job_name
      f.input :frequency
      f.input :at
      f.input :job_arguments, as: :text
    end
    f.actions
  end

end
