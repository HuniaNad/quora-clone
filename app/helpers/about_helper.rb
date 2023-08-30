# frozen_string_literal: true

module AboutHelper
  def pakistan_timezone(entity)
    entity.created_at.in_time_zone('Karachi')
  end
end
