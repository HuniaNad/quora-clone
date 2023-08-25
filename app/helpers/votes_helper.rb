# frozen_string_literal: true

module VotesHelper
    def format_entity_name(entity)
        entity.class.name.pluralize.downcase
    end

    def has_user_upvoted?(entity, current_user)
        entity.upvotes.pluck(:user_id).include? current_user.id
    end

    def has_user_downvoted?(entity, current_user)
        entity.downvotes.pluck(:user_id).include? current_user.id
    end
end
