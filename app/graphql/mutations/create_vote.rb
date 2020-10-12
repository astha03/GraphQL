module Mutations
    class CreateVote < BaseMutation
        argument :link_id, ID, required: true

        type Types::VoteType

        def resolve(link_id: link_id)
            Vote.create!(
                link: Link.find(link_id),
                user: context[:current_user]
            )
        end 
    end 
end 
