module Mutations
  class CreateVote < BaseMutation
    argument :link_id, ID, required: false

    type Types::VoteType

    def resolve(link_id: nil)
      Vote.find_or_create_by!(
        link: Link.find(link_id),
        user: context[:current_user]
      )
    end
  end
end
