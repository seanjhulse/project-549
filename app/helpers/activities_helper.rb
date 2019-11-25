module ActivitiesHelper

  def convert_from_kelvin_to_fahrenheit(temperature)
    temperature = (temperature - 273.15) * 9 / 5 + 32
    return temperature.round(2)
  end

  def weather(temperature)
    temperature_in_fahrenheit = convert_from_kelvin_to_fahrenheit(temperature)
    if temperature_in_fahrenheit < 50
      return "snowflake"
    end

    if temperature_in_fahrenheit < 75
      return "cloud-sun"
    end

    if temperature_in_fahrenheit < 90
      return "sun"
    end

    return "meteor"
  end

  def event_type(event)
    case event
    when "Indoors"
      return "fa-home"
    when "Outdoors"
      return "fa-hiking"
    when "Festival"
      return "fa-music"
    when "Restaurant"
      return "fa-utensils"
    when "Social"
      return "fa-user-friends"
    else
    end
  end

  def event_color(event)
    case event
    when "Indoors"
      return "black"
    when "Outdoors"
      return "green"
    when "Festival"
      return "red"
    when "Restaurant"
      return "blue"
    when "Social"
      return "orange"
    else
    end
  end
end
