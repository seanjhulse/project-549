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
end
