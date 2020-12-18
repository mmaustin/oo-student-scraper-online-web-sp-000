require_relative "../lib/practice.rb"
require 'pry'

class CLI

    puts ""
    puts "Hi. Below you will find the Fall 2020 course names at Jazz at Lincoln Center's Swing University! Registration for individual classes are still being accepted!",""
    #puts ""

  def go
    #puts "Hi. Below you will find the Fall 2020 course names at Jazz at Lincoln Center's Swing University! Registration for individual classes are still being accepted!"
    Scraper.make_courses('https://jazzatlincolncenter.squarespace.com/swing-u')
    Courses.display_courses
    puts ""
    puts "Please enter the number to the left of the course for more information."
    input = gets.strip.to_i
    get_course_info(input)
    puts ""
    puts "Would you like to view another course? Enter: y or n.  Thank you.",""
    #puts ""
    input_two = gets.strip.downcase
    view_another_course(input_two)
  end

#end

def valid_input(input) #self
  if input >= 1 && input <=9
    true
  else
    puts "Please try again.",""
    first_display
    #go
    #puts ""
    #Courses.display_courses #self
    #input = gets.strip.to_i
    #get_course_info(input)
  end
end

  def first_display
    Courses.display_courses #self
    puts ""
    puts "Please enter the number to the left of the course for more information."
    input = gets.strip.to_i
    get_course_info(input)
  end

def get_course_info(input) #self
  if valid_input(input) #self
    puts "Title: #{Courses.all[input - 1].title}",""
    #puts ""
    puts "Date: #{Courses.all[input - 1].date}",""
    #puts ""
    puts "Description: #{Courses.all[input - 1].description}",""
    #puts ""
    puts "#{Courses.all[input - 1].instructor}"
    #puts ""
  end
end

def view_another_course(input_two) #self
  if input_two == "y"
    puts ""
    #go #self
    second_display
  elsif input_two == "n"
    puts "Have a wonderful day, and keep on Swingin!'", ""
    exit
  else
    puts "Please try again"
    #go
    input_two = gets.strip.downcase
    view_another_course(input_two) #self
  end
end

  def second_display
    Courses.display_courses #self
    puts ""
    puts "Please enter the number to the left of the course for more information."
    input = gets.strip.to_i
    get_course_info(input)
    puts ""
    puts "Would you like to view another course? Enter: y or n.  Thank you.",""
    input_two = gets.strip.downcase
    view_another_course(input_two)
  end

end

=begin
  puts "Hello. Below are the recently named NEA JazzMasters for 2021! Please enter the number next to an artist's name to view more information about the artist."
  puts ""
  def go #self
    Master.display_name #Master
    input = gets.strip.to_i
    puts ""
    get_info(input) #self
    puts ""
    puts "Would you like to view another artist? Enter: y or n.  Thank you."
    puts ""
    input_two = gets.strip.downcase
    view_more(input_two) #self
  end

  def valid_input(input) #self
    if input >= 1 && input <=9
      true
    else
      puts "Please try again."
      puts ""
      Courses.display_courses #self
      input = gets.strip.to_i
    end
  end

  def get_info(input) #self
    if valid_input(input) #self
      puts "Title: #{Courses.all[input - 1].title}"
      puts ""
      puts "Date: #{Courses.all[input - 1].date}"
      puts ""
      puts "Description: #{Courses.all[input - 1].description}"
      puts ""
      puts "Instuctor: #{Courses.all[input - 1].instructor}"
      puts ""
    end
  end

  def view_more(input_two) #self
    if input_two == "y"
      go #self
    elsif input_two == "n"
      puts "Have a wonderful day!"
      exit
    else
      puts "Please try again"
      input_two = gets.strip.downcase
      view_more(input_two) #self
    end
  end

end
#CLI.go
=end
