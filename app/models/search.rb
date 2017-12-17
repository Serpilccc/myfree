class Search < ApplicationRecord

def courses_search

courses = courses.where(["categorie LIKE ?", categorie]) if categorie.present?
courses = courses.where(["typdedoc LIKE ?", typedoc ]) if typedoc.present?

return courses

end
end