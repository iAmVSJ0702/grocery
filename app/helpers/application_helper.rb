# frozen_string_literal: true

# This is module ApplicationHelper
module ApplicationHelper
  def show_errors(object, field_name)
    return unless object.errors.any?
    return if object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end

  def delete_link(path, text_back = '', text_front = '')
    link_to "#{text_front}" '<i class="fa fa-trash" title="Delete Details"></i> ' "#{text_back}".html_safe,
            path,
            data: { turbo_method: :delete,
                    turbo_confirm: 'Are you sure?' },
            class: 'btn btn-danger btn-sm'
  end

  def edit_link(path, text_back = '', text_front = '')
    link_to "#{text_front}" '<i class="fa-solid fa-pen"></i> ' "#{text_back}".html_safe,
            path,
            method: 'get',
            class: 'btn btn-info btn-sm'
  end
end
