class Search::User < Search::Base
  ATTRIBUTES = %i(
    nickname
    name
    faculty_id
    department_id
    sex
    want_friends
    circle_ids
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::User.arel_table
    results = ::User.all
    if department_id.present?
      results = results.where(department_id: department_id)
    elsif faculty_id.present?
      results = results.where(faculty_id: faculty_id)
    end
    results = results.where(sex: sex) if sex.present?
    results = results.where(want_friends: want_friends) if want_friends.present?
    binding.pry
    return results
  end
end
