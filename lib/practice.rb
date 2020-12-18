require 'nokogiri'
require 'open-uri'
require 'pry'

  class Scraper

    def self.make_courses(site)
      doc = Nokogiri::HTML(open(site))
      #doc.css('div.col.sqs-col-4.span-4').slice(2,10).each do |course|
      doc.css('div.col.sqs-col-4.span-4').drop(2).each do |course|
        Courses.new(course.css('div.sqs-block-content h4').text, course.css('div.sqs-block-content h3').text,
          course.css('div.sqs-block-content p[1]').text, course.css('div.sqs-block-content p[2]').text)
      end
    end

  end

  class Courses
    attr_accessor :date, :title, :description, :instructor
    @@all = []

    def initialize(date, title, description, instructor)
      @date = date
      @title = title
      @description = description
      @instructor = instructor
      @@all << self
    end

    def self.all
      @@all.slice(1,9)
      #binding.pry
    end

    def self.display_courses
      #puts ""
      #puts "Hi. Below you will find the Fall 2020 course names at Jazz at Lincoln Center's Swing University! Registration for individual classes are still being accepted!"
      #puts ""
      self.all.each.with_index(1) do |name, i|
        puts "#{i}:  #{name.title}"
      end
    end

  end

=begin
class Scraper

  def self.scrape_masters(site)
    array = []
    doc = Nokogiri::HTML(open(site))
    doc.css('div.view__row').each do|master|
      array << {#:profile_url => master.css('h3.card__title a').attribute('href').value,
                :name => master.css('h3.card__title span').text,
                :info_snippet => master.css('div.card__text').text}
    end
    array.slice(0,4)
  end

  def self.scrape_from_carrington(site)
    c_hash = {}
    doc = Nokogiri::HTML(open(site))
    base = doc.css('div.l-full')
    base.each do |bbs|
      c_hash[:birth] = bbs.css('time').text
      c_hash[:bio] = bbs.css('div.l-constrain.l-constrain--xs p').text
      c_hash[:statement] = bbs.css('div.accordion-item__description p').text
    end
    c_hash
  end

  def self.scrape_from_heath(site)
    h_hash = {}
    doc = Nokogiri::HTML(open(site))
    base = doc.css('div.l-full')
    base.each do |bbs|
      h_hash[:birth] = bbs.css('time').text
      h_hash[:bio] = bbs.css('div.l-constrain.l-constrain--xs p').text
      h_hash[:statement] = bbs.css('div.accordion-item__description p').text
    end
    h_hash
  end

  def self.scrape_from_schaap(site)
    s_hash = {}
    doc = Nokogiri::HTML(open(site))
    base = doc.css('div.l-full')
    base.each do |bbs|
      s_hash[:birth] = bbs.css('time').text
      s_hash[:bio] = bbs.css('div.l-constrain.l-constrain--xs p').text
      s_hash[:statement] = bbs.css('div.accordion-item__description p').text
    end
    s_hash
  end

  def self.scrape_from_threadgill(site)
    t_hash = {}
    doc = Nokogiri::HTML(open(site))
    base = doc.css('div.l-full')
    base.each do |bbs|
      t_hash[:birth] = bbs.css('time').text
      t_hash[:bio] = bbs.css('div.l-constrain.l-constrain--xs p').text
      t_hash[:statement] = bbs.css('div.accordion-item__description p').text
    end
    t_hash
  end

end

class Master

  attr_accessor :profile_url, :name, :info_snippet, :birth, :bio, :statement
  @@all = []

  def initialize(master_hash)
    master_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.display_name
    puts "1. #{carrington.name}"
    puts "2. #{heath.name}"
    puts "3. #{schaap.name}"
    puts "4. #{threadgill.name}"
  end

  def self.carrington
    carrington = @@all[0]
  end

  def self.heath
    heath = @@all[1]
  end

  def self.schaap
    schaap = @@all[2]
  end

  def self.threadgill
    threadgill = @@all[3]
  end

  def self.create_from_collection(students_array)
    students_array.each do |item|
      Master.new(item)
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      self.send(("#{key}="), value)
      self
    end
  end

  def self.valid_input(input)
    if input == 1 || input == 2 || input == 3 || input == 4 || input == 'n' || input == 'N'
      print true
    else
      print false
    end
  end


end

Master.create_from_collection(Scraper.scrape_masters('https://www.arts.gov/honors/jazz'))
Master.carrington.add_student_attributes(Scraper.scrape_from_carrington('https://www.arts.gov/honors/jazz/terri-lyne-carrington'))
Master.heath.add_student_attributes(Scraper.scrape_from_heath('https://www.arts.gov/honors/jazz/albert-tootie-heath'))
Master.schaap.add_student_attributes(Scraper.scrape_from_schaap('https://www.arts.gov/honors/jazz/phil-schaap'))
Master.threadgill.add_student_attributes(Scraper.scrape_from_threadgill('https://www.arts.gov/honors/jazz/henry-threadgill'))
#Master.all
=end

#Master.valid_input('y')

=begin
carrington = Scraper.scrape_from_carrington('https://www.arts.gov/honors/jazz/terri-lyne-carrington')
t_lyne = Master.new(carrington)
t_lyne.add_student_attributes(Scraper.scrape_masters('https://www.arts.gov/honors/jazz'))

threadgill = Scraper.scrape_from_threadgill('https://www.arts.gov/honors/jazz/henry-threadgill')
t_gill = Master.new(threadgill)
t_gill.add_student_attributes(Scraper.scrape_masters('https://www.arts.gov/honors/jazz'))
Master.all
Scraper.scrape_masters('https://www.arts.gov/honors/jazz')
Master.all
=end
