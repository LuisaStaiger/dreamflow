class DreamsAnalyticsController < ApplicationController
  def analytics
    @tag_counts = Dream.group(:tags).count
  end
end
