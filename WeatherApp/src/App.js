import React, {useState} from 'react';
import {fetchUpcomingDaysData, fetchTodayData, fetchZipCode} from './api';
import {Cards, SearchBar} from './components';
import styles from './App.module.css';
import {Typography} from '@material-ui/core'


class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
  }

  async componentDidMount() {
    // Make required network calls when components is already mounted
    const initialZipCode = "10001"; // New York Zip Code
    const fetchedUpcomingDaysData = await fetchUpcomingDaysData(initialZipCode);
    const todayData = await fetchTodayData(initialZipCode);

    // Concatenate today's data as upcoming days forecast data doesn't include today's data
    const upcomingDaysData = todayData.concat(fetchedUpcomingDaysData.upcomingDays);
    const data = { 
      cityname: fetchedUpcomingDaysData.cityname,
      upcomingDays: upcomingDaysData
    }

    this.setState({
      data : data, 
      cityName : data.cityname, 
      zip : initialZipCode, 
      zipError : false
    });
    
    this.cityName = fetchedUpcomingDaysData.cityname;
  }

  zipCodeChange = async(change) => { 
    const validation = await fetchZipCode(change);
    validation != "Error" ? this.handleZipCodeChange(change) : this.zipError = true;
  }

  handleZipCodeChange = async(zipCode) => { 
    // Refetch data when Zip Code changes
    const fetchedUpcomingDaysData = await fetchUpcomingDaysData(zipCode);
    const todayData = await fetchTodayData(zipCode);
    
    if(!todayData || !fetchedUpcomingDaysData)
      return "Loading ... ";

    // Concatenate today's data as upcoming days forecast data doesn't include today's data
    const upcomingDaysData = todayData.concat(fetchedUpcomingDaysData.upcomingDays);
    const data = { 
      cityname: fetchedUpcomingDaysData.cityname,
      upcomingDays: upcomingDaysData
    }
    
    this.setState({
      data : data, 
      cityName : data.cityname, 
      zip : zipCode, 
      zipError : false
    });
  }

  render() {
    return (
      <div classNames = {styles.container}>
        <Typography 
          className = {styles.typography} 
          gutterBottom 
          variant="h5" 
          component="h2" 
          align = "center"
        >
          {this.state.cityName} 
        </Typography>

        <SearchBar zipCodeChange = { this.zipCodeChange } error={this.state.zipError}/>

        <Cards data={this.state.data}/>
      </div>
    )
  }
}

export default App;