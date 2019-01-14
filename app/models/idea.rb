class Idea < ApplicationRecord
    validates(
        :title,
        present: true,
        uniqueness: true
    )

    validates(
        :description,
        present: true
    )
end
