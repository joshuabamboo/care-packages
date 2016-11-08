class PackagesController < ApplicationController
  def index
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      redirect_to @package
    else
      redirect_to root_path, notice: "There was an error creating your package. Please try again." 
    end
  end

  def show
    @package = Package.find(params[:id])
    good_news = [
      {headline: "The Cubs Won The World Series!", link: "http://insider.foxnews.com/2016/11/03/cubs-fans-1993-yearbook-eerie-tweet-kris-bryants-smile-going-viral"},
      {headline: "Job Growth, Wages Seen Picking Up in October", link: "http://www.foxbusiness.com/markets/2016/11/04/job-growth-wages-seen-picking-up-in-october.html"},
      {headline: "The Unemployment Rate Is At A Low 4.9%", link: "http://www.foxnews.com/politics/2016/08/05/us-adds-robust-255000-jobs-unemployment-stays-4-9-percent.html"},
      {headline: "The economy is generating enough jobs to reduce unemployment and boost incomes", link: "http://www.foxnews.com/us/2016/11/08/us-job-openings-increase-slightly-in-september.html"},
      {headline: "Consumer Confidence Rose To The Highest Level In Nine Years", link: "http://www.foxbusiness.com/markets/2016/09/27/us-consumer-confidence-jumped-in-september.html"},
      {headline: "Violent crime has fallen by 9.6 percent since 2009", link: "http://www.foxnews.com/us/2016/09/26/fbi-violent-crime-across-us-spiked-in-2015-murders-up-nearly-11-percent.html"},
      {headline: "Communities across the country still have far safer streets than twenty years ago, as homicide and overall violent crime rates are roughly half of their early-1990’s peaks.", link: "http://www.foxnews.com/opinion/2016/10/08/ken-cuccinelli-what-youre-not-being-told-about-new-crime-numbers.html"},
      {headline: "ISIS territory has shrunk to an area roughly the size of West Virginia", link: "http://www.foxnews.com/world/2016/10/11/isis-suffers-major-land-loss-ahead-planned-mosul-assault-report-finds.html"},
      {headline: "US Stocks Are At Record Highs", link: "http://www.foxbusiness.com/markets/2016/08/15/u-s-stocks-at-record-highs-as-materials-shares-surge.html"},
      {headline: "US is now the worlds largest producer of oil and gas", link: "http://www.foxnews.com/us/2015/06/10/us-overtakes-russia-as-top-oil-and-gas-producer-report-says.html"},
      {headline: "Gas prices are really low", link: "http://www.foxbusiness.com/features/2016/03/31/aaa-gas-prices-start-2016-at-12-year-low.html"},
      {headline: "The economy is growing", link: "http://latino.foxnews.com/latino/news/2016/10/28/us-gdp-grows-2-pct-in-third-quarter/"},
      {headline: "Home Prices Continue Brisk Growth", link: "http://www.foxbusiness.com/markets/2016/09/27/home-prices-continued-brisk-growth-in-july.html"},
      {headline: "Teen Pregnancies Are Dropping In All 50 States", link: "http://www.foxnews.com/health/2014/05/06/teen-pregnancy-rates-drop-each-state.html"},
      {headline: "Smoking among adults in the U.S. fell to 15 percent last year thanks to the biggest one-year decline in more than 20 years.", link: "http://www.foxnews.com/health/2016/05/24/kicking-habit-adult-smoking-rate-in-us-is-falling-fast.html"}
      # {headline: "", link: ""}
    ]
    @stories = good_news.sample(10)
    # @news0 = good_news[0]
    # @news1 = good_news[1]
    # @news2 = good_news[2]
    # @news3 = good_news[3]
    # @news4 = good_news[4]
    # @news5 = good_news[5]

    cat_gifs=
      [
        "background-image:url(https://media.giphy.com/media/wrXXI5XwIx6c8/giphy.gif);", 
        "background-image:url(https://media.giphy.com/media/MjiO4GHq4LpGE/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/l0MYNB04rBb51QNtC/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/EJpdQjkR9fvr2/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/4SUjDVStJqKc0/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/10APf3POAhlI1G/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/eDgmbiQcujjsA/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/3o6gaW2l0FJB0jt7MY/giphy.gif);",
        "background-image:url(https://media.giphy.com/media/l4KhS0BOFBhU2SYIU/giphy.gif);",
        "background-image:url(https://media2.giphy.com/media/Z1kpfgtHmpWHS/200.gif);",
        "background-image:url(https://media0.giphy.com/media/DpzCmNg8M5p9m/200.gif);",
        "background-image:url(https://media0.giphy.com/media/5Vy3WpDbXXMze/200.gif);",
        "background-image:url(https://media4.giphy.com/media/G3773sSDJHHy0/200w.gif);",
        "background-image:url(https://media2.giphy.com/media/gB0HshOXbWcyk/200w.gif);",
        "background-image:url(https://media0.giphy.com/media/IXmipOaLm6p3i/200.gif);",
        "background-image:url(https://media4.giphy.com/media/7qD1odpQnVfR6/200.gif);",
        "background-image:url(https://media2.giphy.com/media/12c7MQi3q492Hm/200.gif);",
        "background-image:url(https://media2.giphy.com/media/kWA6KVQpSQmiI/200.gif);",
        "background-image:url(https://media0.giphy.com/media/nU8gONY9Azux2/200w.gif);",
        "background-image:url(https://media0.giphy.com/media/65LB1O0AlVHX2/200.gif);",
        "background-image:url(https://media1.giphy.com/media/4Wn8GqpENHnUs/200.gif);",
        "background-image:url(https://media4.giphy.com/media/LL90Zx5BbfIkw/200.gif);"
        # "background-image:url();",
      ]
    @gifs = cat_gifs.sample(@stories.size)
  end

  private
  def package_params
    params.require(:package).permit(:to, :from)
  end
end
