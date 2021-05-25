import axios from 'axios';

const API_KEY = process.env.REACT_APP_API_KEY;
const ZIP_KEY = process.env.REACT_APP_ZIP_KEY;

const upcomingDaysURL = `https://api.openweathermap.org/data/2.5/forecast`,
      currentWeatherURl = `https://api.openweathermap.org/data/2.5/weather`,
      zipCodeURL = `https://api.zip-codes.com/ZipCodesAPI.svc/1.0/QuickGetZipCodeDetails/`;

export const fetchZipCode = async(zip) => { 
  const url = `${zipCodeURL}/${zip}?key=${ZIP_KEY}`;
  
  try { 
    const {data} = await axios.get(url);

    if(!data.Error) {
      return data.City;
    }
    return "Error";

  } catch(error) { 
    console.log(error);
  }
}


export const fetchTodayData = async(zip_code) => { 
  const url = `${currentWeatherURl}?units=metric&zip=${zip_code}&appid=${API_KEY}`;

  try { 
    const { 
      data : {
        dt, 
        name, 
        main, 
        weather 
      } 
    } = await axios.get(url);

    var todayData = [new Date(dt * 1000), Math.round(main.feels_like), weather[0].main, weather[0].description, weather[0].icon];

    return [todayData];

  } catch(error) { 
    console.log(error);
  }
}

export const fetchUpcomingDaysData = async(zip_code) => { 
  const url = `${upcomingDaysURL}?zip=${zip_code}&units=metric&appid=${API_KEY}`;

  try {
    const { 
      data: {
        city: { name },
        list
      }
    } = await axios.get(url);
    
    var days = [];
    for(var i = 0; i < list.length; i+=8) // jump 8 elements since the api returns 8 timestamps per day
      { 
        const date = new Date(list[i+5].dt_txt), // i + 5 to get first interval of the day at 12:00
        maxTemp = findMaxTempPerDay(list, i),
        main = list[i].weather[0].main,
        description = list[i].weather[0].description,
        icon = list[i].weather[0].icon;

        days.push([date, Math.round(maxTemp), main, description, icon]);
      }

    const data = { 
      cityname : name,
      upcomingDays : days
    }
    return data;

    } catch(error) { 
      console.log(error);
    }
}

const findMaxTempPerDay = (temperaturesList, start) => { 
  var max = 0;

  for(var i = start; i < start + 8; i++)
    if (temperaturesList[i].main.feels_like > max)
      max = temperaturesList[i].main.feels_like

  return max;
}