ActiveAdmin.register Attachment do
  permit_params :attachment

  config.filters = false

  index do
    column :document_file_name

    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Firmware" do
      f.input :attachment, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :document_file_name
    end
  end

  controller do

    def create
      attrs = permitted_params[:attachment]

      @attachment = Attachment.create()

      @attachment[:document_file_name] = attrs[:attachment].original_filename
      #@attachment[:attachment] = attrs[:attachment].read

      if @attachment.save
        redirect_to admin_attachment_path(@attachment)
      else
        render :new
      end
    end

    def update
      attrs = permitted_params[:attachment]

      @attachment = Attachment.where(id: params[:id]).first!
      #@attachment.firmware_level = attrs[:firmware_level]

      @attachment[:document_file_name] = attrs[:attachment].original_filename
      #@attachment[:attachment] = attrs[:attachment].read

      if @attachment.save
        redirect_to admin_attachment_path(@attachment)
      else
        render :edit
      end
    end
  end
end

