class SiteController < ApplicationController
  skip_before_action :login_check, only: [:index]
  include SessionsHelper
  def index
    gon.login_check = login?
    @react = true
  end

  def login?
    if current_user
      true
    else
      false
    end
  end

  def logged_in?
    if current_user # helper method written in application_contoller
      session[:user_id] = @current_user.id
      render json: { logged_in: true, user: @current_user, session: session[:user_id] }
    else

      render json: { logged_in: false, message: 'ユーザーが存在しません', session: session[:user_id] }
    end
  end

  def logout
    session[:user_id] = nil
    render json: { logged_in: false, user: nil, session: nil }
  end

  # map plick
  def map_json
    n_of_jobs = Received.all.where(received_date: Date.today..Date.today).sum(:number_of_order)
    rest_of_jobs = Received.all.where(received_date: Date.today..Date.today).where(shipped_date: nil).sum(:number_of_order)
    n_of_staffs = WorkTime.all.where('start >= ?', Date.today).where(end: nil).count
    # render template: "/mapplic/map.json"
    
    render json: {
      "mapwidth": '1000',
      "mapheight": '500',
      "defaultstyle": 'light',
      "styles": [
        {
          "class": 'light',
          "hover": { "fill": '#f4f4f4' },
          "active": { "fill": '#fff' }
        },
        {
          "class": 'dark',
          "hover": { "fill": '#666' },
          "active": { "fill": '#555' }
        }
      ],
      "categories": [
        {
          "id": 'fashion',
          "title": 'Fashion',
          "about": 'Cothing & Accessories',
          "icon": '<i class="fas fa-tshirt"></i>',
          "color": '#FF9595'
        },
        {
          "id": 'health',
          "title": 'Health',
          "about": 'Health & Cosmetics',
          "icon": '<i class="fas fa-heartbeat"></i>',
          "color": '#FFB985'
        },
        {
          "id": 'food',
          "title": 'Food, Drinks',
          "about": 'Fast-foods & Restaurants',
          "icon": '<i class="fas fa-utensils"></i>',
          "color": '#AEC47E'
        },
        {
          "id": 'dep',
          "title": 'Department Stores',
          "about": 'Wide wariety of goods',
          "color": '#8DB3DC',
          "icon": '<i class="fas fa-shopping-cart"></i>',
          "style": 'dark'
        },
        {
          "id": 'others',
          "title": 'Others',
          "icon": '<i class="fas fa-lightbulb"></i>',
          "color": '#b091b7'
        },
        {
          "id": 'nopointer-logos',
          "title": 'Area Name',
          "toggle": 'true',
          "legend": 'true',
          "hide": 'true'
        }
      ],
      "levels": [

        {
          "id": 'second-floor',
          "title": 'Second Floor',
          "map": '/map/logi-2.svg',
          "minimap": 'maps/mall/mall-ground-mini.jpg',
          "show": 'true',
          "locations": [
            {
              "id": 'area8',
              "title": '<h4>area8</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.2390',
              "y": '0.6000'
            },
            {
              "id": 'area7',
              "title": "<h4>Area7</h4><p>現在の作業人数：#{n_of_staffs}</p><p>本日の作業量：#{n_of_jobs}</p><p>残り作業量：#{rest_of_jobs}</p>",
              "about": 'Lorem ipsum',
              "description": '<p>データベースより、本日の作業量及び現在の作業人数を動的に取得し表示しています。</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.2390',
              "y": '0.3000'

            },
            {
              "id": 'area5',
              "title": '<h4>Area5</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.6374',
              "y": '0.3000'
            },
            {
              "id": 'area6',
              "title": '<h4>Area6</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.4500',
              "y": '0.3000'
            }

          ]
        },
        {
          "id": 'first-floor',
          "title": 'First Floor',
          "map": '/map/logi.svg',
          "minimap": 'maps/mall/mall-first-mini.jpg',
          "locations": [
            {
              "id": 'area4',
              "title": '<h4>Area4</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.2390',
              "y": '0.6000'
            },
            {
              "id": 'area3',
              "title": '<h4>Are3</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.2390',
              "y": '0.3000'

            },
            {
              "id": 'area1',
              "title": '<h4>Area1</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.6374',
              "y": '0.3000'
            },
            {
              "id": 'area2',
              "title": '<h4>Area2</h4>',
              "about": 'Lorem ipsum',
              "description": '<p>まだ、データは取得できません。</p><p>改良中</p>',
              "category": 'food',
              "style": 'dark',
              "x": '0.4500',
              "y": '0.3000'
            }

          ]
        }
      ]
    }
  end

  def map
    render template: "/mapplic/#{params[:map]}"
  end
end
