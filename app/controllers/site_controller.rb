class SiteController < ApplicationController
    skip_before_action :login_check, only:[:index]
    include SessionsHelper
    def index
        gon.login_check = login?
        @react = true
        
    end

    def login?
        if current_user
            return true
        else
            return false
        end
    
    end
    def logged_in?
        if current_user #helper method written in application_contoller
            session[:user_id] = @current_user.id
            render json: { logged_in: true, user: @current_user ,session: session[:user_id]}
        else
           
            render json: { logged_in: false, message: 'ユーザーが存在しません' ,session: session[:user_id]}
        end
    end

    def logout
        session[:user_id] = nil
        render json: {logged_in: false, user: nil, session: nil}

    end


    #map plick 
    def map_json

        
        n_of_jobs = Received.all.where('received_date >= ?', Date.today).sum(:number_of_order)

        n_of_staffs = WorkTime.all.where('start >= ?', Date.today).count
        #render template: "/mapplic/map.json"
        test = "test data yeah!!"
        render json: {
            "mapwidth": "1000",
            "mapheight": "500",
            "defaultstyle": "light",
            "styles": [
                {
                    "class": "light",
                    "hover": { "fill": "#f4f4f4" },
                    "active": { "fill": "#fff" }
                },
                {
                    "class": "dark",
                    "hover": { "fill": "#666" },
                    "active": { "fill": "#555" }
                }
            ],
            "categories": [
                {
                    "id": "fashion",
                    "title": "Fashion",
                    "about": "Cothing & Accessories",
                    "icon": "<i class=\"fas fa-tshirt\"></i>",
                    "color": "#FF9595"
                },
                {
                    "id": "health",
                    "title": "Health",
                    "about": "Health & Cosmetics",
                    "icon": "<i class=\"fas fa-heartbeat\"></i>",
                    "color": "#FFB985"
                },
                {
                    "id": "food",
                    "title": "Food, Drinks",
                    "about": "Fast-foods & Restaurants",
                    "icon": "<i class=\"fas fa-utensils\"></i>",
                    "color": "#AEC47E"
                },
                {
                    "id": "dep",
                    "title": "Department Stores",
                    "about": "Wide wariety of goods",
                    "color": "#8DB3DC",
                    "icon": "<i class=\"fas fa-shopping-cart\"></i>",
                    "style": "dark"
                },
                {
                    "id": "others",
                    "title": "Others",
                    "icon": "<i class=\"fas fa-lightbulb\"></i>",
                    "color": "#b091b7"
                },
                {
                    "id": "nopointer-logos",
                    "title": "Logos",
                    "toggle": "true",
                    "legend": "true",
                    "hide": "true"
                }
            ],
            "levels": [
                {
                    "id": "underground",
                    "title": "Underground",
                    "map": "/map/mall-underground.svg",
                    "minimap": "maps/mall/mall-underground-mini.jpg",
                    "locations": [
                        {
                            "id": "gap",
                            "title": "GAP",
                            "about": "Lorem ipsum",
                            "description": "Lorem ipsum",
                            "category": "fashion",
                            "x": "0.3781",
                            "y": "0.4296"
                        },
                        {
                            "id": "petco",
                            "title": "Petco",
                            "about": "Lorem ipsum",
                            "description": "Lorem ipsum",
                            "category": "others",
                            "style": "dark",
                            "x": "0.5311",
                            "y": "0.2686"
                        }
                    ]
                },
                {
                    "id": "ground-floor",
                    "title": "Ground Floor",
                    "map": "/map/mall-ground.svg",
                    "minimap": "maps/mall/mall-ground-mini.jpg",
                    "show": "true",
                    "locations": [
                        {
                            "id": "nordstrom",
                            "title": "Nordstrom",
                            "about": "Lorem ipsum dolor sit amet.",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion,dep",
                            "style": "dark",
                            "x": "0.7856",
                            "y": "0.2022",
                            "zoom": "2"
                        },
                        {
                            "id": "macys",
                            "title": "Macy's",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "dep",
                            "x": "0.2021",
                            "y": "0.5847",
                            "zoom": "5"
                        },
                        {
                            "id": "jcpenney",
                            "title": "JCPenney",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "dep",
                            "link": "https://1.envato.market/R5Nv",
                            "x": "0.6651",
                            "y": "0.6734",
                            "zoom": "2"
                        },
                        {
                            "id": "walgreens",
                            "title": "Walgreens",
                            "about": "Lorem ipsum",
                            "description": "At the corner of Happy & Healthy",
                            "image": "https://source.unsplash.com/v113g-WnhTI/400x150",
                            "category": "health",
                            "x": "0.4611",
                            "y": "0.5426"
                        },
                        {
                            "id": "sephora",
                            "title": "Sephora",
                            "about": "Lorem ipsum",
                            "description": "<p>Makeup, fragrance, skincare</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "image": "https://source.unsplash.com/v113g-WnhTI/400x150",
                            "category": "health",
                            "link": "https://1.envato.market/R5Nv",
                            "x": "0.7504",
                            "y": "0.5211"
                        },
                        {
                            "id": "geox",
                            "title": "Geox",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "link": "https://1.envato.market/R5Nv",
                            "x": "0.3947",
                            "y": "0.5544"
                        },
                        {
                            "id": "hnm",
                            "title": "H&M",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "x": "0.6445",
                            "y": "0.4478"
                        },
                        {
                            "id": "adidas",
                            "title": "Adidas",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "x": "0.3688",
                            "y": "0.3909"
                        },
                        {
                            "id": "massimodutti",
                            "title": "Massimo Dutti",
                            "about": "Lorem ipsum",
                            "description": "<p>Some people think design means how it looks. But of course, if you dig deeper, it's really how it works.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "x": "0.6243",
                            "y": "0.2655"
                        },
                        {
                            "id": "starbucks",
                            "title": "Starbucks",
                            "about": "Lorem ipsum",
                            "description": "<p>Enjoy today and every day with our creamy non-dairy beverage options.</p><strong>7:30 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "image": "https://source.unsplash.com/n-HtQS7IgU4/400x150",
                            "link": "https://www.mapplic.com/",
                            "category": "food",
                            "x": "0.5431",
                            "y": "0.5240"
                        },
                        {
                            "id": "zara",
                            "title": "Zara",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "link": "https://1.envato.market/R5Nv",
                            "x": "0.4785",
                            "y": "0.2873"
                        }
                    ]
                },
                {
                    "id": "first-floor",
                    "title": "First Floor",
                    "map": "/map/logi.svg",
                    "minimap": "maps/mall/mall-first-mini.jpg",
                    "locations": [
                        {
                            "id": "area4",
                            "title": "area4's",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>10:00 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "image": "https://source.unsplash.com/fDzQTTDI7bs/400x150",
                            "category": "food",
                            "style": "dark",
                            "x": "0.7536",
                            "y": "0.2196"
                        },
                        {
                            "id": "area3",
                            "title": "<p>現在の作業人数：#{n_of_staffs}</p><p>本日の作業量：#{n_of_jobs}",
                            "about": "Lorem ipsum",
                            "description": "<p>現在の作業人数：#{n_of_staffs}</p><p>本日の作業量：#{n_of_jobs}",
                            "category": "food",
                            "style": "dark",
                            "x": "0.2390",
                            "y": "0.3000",
                            "link": "https://1.envato.market/R5Nv"
                        },
                        {
                            "id": "mcdonalds",
                            "title": "McDonald's",
                            "about": "Lorem ipsum",
                            "description": "Additional information",
                            "category": "food",
                            "link": "https://1.envato.market/R5Nv",
                            "x": "0.7374",
                            "y": "0.3918"
                        },
                        {
                            "id": "pizzahut",
                            "title": "Pizza Hut",
                            "about": "Lorem ipsum",
                            "description": "Make it great",
                            "category": "food",
                            "x": "0.7092",
                            "y": "0.5232"
                        },
                        {
                            "id": "subway",
                            "title": "Subway",
                            "about": "Lorem ipsum",
                            "description": "Eat fresh.",
                            "category": "food",
                            "x": "0.6278",
                            "y": "0.2731"
                        },
                        {
                            "id": "cvs",
                            "title": "CVS Pharmacy",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>7:30 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "health",
                            "link": "https://1.envato.market/R5Nv",
                            "thumbnail": "CVS",
                            "x": "0.5104",
                            "y": "0.2471"
                        },
                        {
                            "id": "pullnbear",
                            "title": "Pull & Bear",
                            "about": "Lorem ipsum",
                            "description": "<p>Recognizing the need is the primary condition for design.</p><strong>7:30 - 22:00</strong> <small>(Monday - Sunday)</small>",
                            "category": "fashion",
                            "thumbnail": "PB",
                            "x": "0.4846",
                            "y": "0.2946"
                        },
                        {
                            "id": "amc",
                            "title": "AMC Theatres",
                            "about": "Lorem ipsum",
                            "description": "Additional information",
                            "category": "others",
                            "style": "dark",
                            "thumbnail": "AMC",
                            "x": "0.6671",
                            "y": "0.6851"
                        },
                        {
                            "id": "atnt",
                            "title": "AT&T",
                            "about": "Lorem ipsum",
                            "description": "Additional information",
                            "category": "others",
                            "x": "0.3750",
                            "y": "0.5391"
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