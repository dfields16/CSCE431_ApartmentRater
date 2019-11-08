class Apartment < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def get_reviews
    reviews = Review.where(:apartment_id => self.id)
    return reviews
  end

  def review_count
    return Review.where(:apartment_id => self.id).size
  end

  def average_rating
    avgRating = 0;
    reviewCount = 0;
    reviews = Review.where(:apartment_id => self.id)
    reviews.each do |review|
      review.get_metrics.each do |metric_key, metric_value|
        if metric_key.name == "Overall"
          avgRating += metric_value
          reviewCount += 1
        end
      end
    end
    if reviewCount == 0
      return "Undefined"
    end
    avgRating = avgRating / reviewCount;
    return avgRating
  end

  def get_tags
    hash = {}

    get_reviews.each do |review|
      review.get_tags.each do |tag|
          hash[tag.name] = (hash[tag.name] || 0) + 1
      end
    end
    return hash
  end


  #pricing data
  def get_average_price
    reviews = Review.where(:apartment_id => self.id)
    if reviews.size == 0
      return 0.0
    end

    sum = 0
    reviews.each do |review|
      sum = sum + review.price
    end
    return sum/reviews.size
  end

  def get_min_price
    reviews = Review.where(:apartment_id => self.id)
    if reviews.size == 0
      return 0.0
    end

    min = reviews.first.price
    reviews.each do |review|
      if review.price < min
        min = review.price
      end
    end
    return min
  end

  def get_max_price
    reviews = Review.where(:apartment_id => self.id)
    if reviews.size == 0
      return 0.0
    end

    max = reviews.first.price
    reviews.each do |review|
      if review.price > max
        max = review.price
      end
    end
    return max
  end
end
