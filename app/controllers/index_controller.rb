require 'open-uri'
class IndexController < ApplicationController


  def crawler

  end

  def rank

    url = 'http://www.mnet.com/chart/top100/'
    doc = Nokogiri::HTML(open(url))
    @posts = doc.css('div.MnetMusicList.MnetMusicListChart > div.MMLTable.jQMMLTable > table > tbody > tr')
    @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
      rank = x.css('.MMLItemRank span').text
      img = x.css('.MMLITitle_Album img').attr('src').text
      href = x.css('.MMLITitle_Album a').attr('href').text
      n = href.size
      url2 = 'http://www.mnet.com' + href[0..n - 2]

      doc2 = Nokogiri::HTML(open(url2))
      caption = doc2.at('meta[name="description"]')['content']
      ranks = rank.to_i

      title = x.css('.MMLI_Song').inner_text
      artist = x.css('.MMLIInfo_Artist').text
      album = x.css('.MMLIInfo_Album').text
      score = rand(1...100 - ranks)


      @res = Rank.new(title: title, img: img, rank: rank, artist: artist, album: album, caption: caption, href: url2, score: score)
      @res.save
    end

    redirect_to '/index/index'

  end


  def index
    if Rank.nil?
      rank
    else
      @result = Rank.order("created_at desc").limit(50).reverse_order
    end

  end


end
