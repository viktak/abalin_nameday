![GitHub](https://img.shields.io/github/license/viktak/abalin_nameday) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/viktak/abalin_nameday) ![PyPI](https://img.shields.io/pypi/v/abalin_nameday) ![PyPI - Python Version](https://img.shields.io/pypi/pyversions/abalin_nameday) ![PyPI - Format](https://img.shields.io/pypi/format/abalin_nameday)

# abalin_nameday
Simple Python wrapper for the International NameDay API @ https://api.abalin.net

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install abalin_nameday.

```bash
pip install abalin_nameday
```

## Usage

```python
import abalin_nameday
apinames = ["air_pollution", "roadrisk"]
myOWM = owm2json.owmRequestor(apinames, latitude, longitude, appid)
print(myOWM.GetData())
```

### Explanation
`apinames`: a list of APIs to call. The full list can be seen on the official [OpenWeatherMap web site](https://openweathermap.org/api).<br>
`latitude`, `longitude`: coordinates of the desired location.<br>
`appid`: API key to use with the service. You can obtain yours at [OpenWeatherMap](https://home.openweathermap.org/api_keys)

If the call is successful, `owm2json` returns a string that contains a concatenated version of all the API calls that were requested. It also contains version information about itself.

Sample response from `owm2json`:
```json
{
    "module": {
        "version": "0.1.86"
    },
    "air_pollution": {
        "coord": {
            "lon": 12.34,
            "lat": 12.34
        },
        "list": [{
            "main": {
                "aqi": 2
            },
            "components": {
                "co": 216.96,
                "no": 0.36,
                "no2": 2.49,
                "o3": 98.71,
                "so2": 5.19,
                "pm2_5": 5.18,
                "pm10": 5.46,
                "nh3": 0.33
            },
            "dt": 1617289200
        }]
    },
    "roadrisk": {
        "message": "Please use POST request according to the documentation https://openweathermap.org/api/road-risk"
    }
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GNU General Public License v3.0](https://choosealicense.com/licenses/gpl-3.0/)
