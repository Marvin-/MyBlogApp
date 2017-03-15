class Statistics
  def total_articles
    Article.count
  end

  def total_comments
    Comment.count
  end

  def most_popular
    Article.all.sort_by { |article| article.comments.count }.last
  end

  def article_word_counts
    words = []
    Article.all.each do |article|
      words.push(article.body.split(" ").count)
    end
    words.reduce :+
  end

  def article_average_word_count
    a = []
    Article.all.each do |article|
      article_word_count = article.body.split(" ").count.to_f
      a.push(article_word_count)
    end
    total_of_article_words = a.reduce :+
    total_word_counts = a.count
    average = total_of_article_words / total_word_counts
    average
  end

  def group_by_word_count
    Article.all.group_by do |article|
      article.body.split(" ").count
    end
  end
  def article_max_word_count
    articles_by_word_count = group_by_word_count
    articles_by_word_count.keys.sort.reverse[0]    
  end

  def article_min_word_count
    articles_by_word_count = group_by_word_count
    articles_by_word_count.keys.reverse[0]  
  end

end