# frozen_string_literal: true
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  def paginate(file_records, params)
    @pagy, paginated = pagy(file_records, limit: params[:limit])
    paginated
  end

  def pagination_meta(pagy)
    return {
      current_page: pagy.page,
      total_pages: pagy.pages,
      total_count: pagy.count
    }
  end

  def pagination_links(pagy)
    base_url = request.base_url + request.path

    links = {
      self: "#{base_url}?page=#{pagy.page}",
      first: "#{base_url}?page=1",
      last: "#{base_url}?page=#{pagy.pages}"
    }

    links[:prev] = "#{base_url}?page=#{pagy.prev}" if pagy.prev
    links[:next] = "#{base_url}?page=#{pagy.next}" if pagy.next

    links
  end
end
