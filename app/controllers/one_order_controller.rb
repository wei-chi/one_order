class OneOrderController < ApplicationController

  def q1
    @result = Meal.where.not(id: MealFood.select('meal_id')).pluck('name')
    render json: @result
  end

  def q2
    @result = Food.joins(:meal_foods).group(:name).count
    render json: @result
  end

  def q3
    @food_head = params['food_head']
    @result = Array.new
    f = MealFood.joins(:food).where('foods.name = "%s"' % @food_head).select('meal_id')
    f.each do |a|
      fid = MealFood.where(meal_id: a.meal_id).pluck("food_id")
      fname = Food.where('not name = "%s" and id in (?)' % @food_head, fid).pluck('name')
      @result.concat fname
    end
    render json: {'Food Head': @food_head, 'other_food': @result.uniq}
  end

end
